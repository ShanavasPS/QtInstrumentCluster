#include "drivestate.h"
#include <assert.h>
#include <algorithm>
#include <cmath>
#include <cstdint>
#include "DriveTrain.h"
#include "mathutils.h"
#include "qdebug.h"

Drivetrain drivetrain = Drivetrain();

namespace CommonDriveConstants {
const uint16_t DelayDriveAfterModeChange = 1500;
const float AcceChangeFilteringFactor = 0.15f;
const uint8_t StateUpdatePeriod = 100;
} // namespace CommonDriveConstants

namespace NormalDriveConstants {
const uint16_t AccChangeRandomizePeriod = 3000;
const float AccChangeMin = -0.1f;
const float AccChangeMax = 1.0f;
const float AccMin = -0.3f;
const float AccMax = 0.4f;
const float AccInitial = AccMax;
const float AccChangeSpeedFactor = 10000.f;
const uint8_t DefaultSpeedLimit = 160;
const uint8_t ExcessiveSpeedingThreshold = 50;
const float ExcessiveSpeedingBraking = -0.5f;
const uint8_t LightSpeedingThreshold = 15;
const float LightSpeedingBraking = -0.2f;
const float LightSpeedingBrakingRelaxValue = -0.4f;
}

DriveState::DriveState()
{
    _cumulatedTime = 0;
}

void DriveState::updateDrivetrain(uint32_t tick, float acceleration)
{
    using namespace CommonDriveConstants;
    _acceleration = AcceChangeFilteringFactor * acceleration + (1 - AcceChangeFilteringFactor) * _acceleration;
    drivetrain.udpate(tick, _acceleration);
}

void DriveState::onUpdate(uint32_t tick)
{
    _cumulatedTime += tick;

    // When switching drive states, don't start to drive immediately,
    // keep prev acc value for a while
    if (getStateTime() > CommonDriveConstants::DelayDriveAfterModeChange || !_comesFromDriveState) {
        drive(tick);
    } else {
        updateDrivetrain(tick, _acceleration);
    }
}

void DriveState::drive(uint32_t tick) {

    using namespace NormalDriveConstants;

    _accChangeTimestamp += tick;
    float limit = 60;//speedLimits.getCurrentSpeedLimitInKmh();

    if (limit <= 10e-5f) {
        // There is not speed limit, but in normal mode don't go to fast
        limit = DefaultSpeedLimit;
    }

    if (limit > 0 && drivetrain.getDriveData().speed > limit) {
        if (drivetrain.getDriveData().speed - limit > ExcessiveSpeedingThreshold) {
            // Excessive speeding slow down fast
            _targetAcc = ExcessiveSpeedingBraking;
        } else if (_targetAcc < LightSpeedingBrakingRelaxValue
                   && drivetrain.getDriveData().speed - limit < LightSpeedingThreshold) {
            // Lot of braking, but not so much speeding any more, relax
            _targetAcc = LightSpeedingBraking;
        } else if (_targetAcc > LightSpeedingBraking) {
            // Slight speeding, slow down gently
            _targetAcc -= tick / AccChangeSpeedFactor;
        }
    } else {
        // Just randomize acc change
        if (_accChangeTimestamp >= AccChangeRandomizePeriod) {
            randomizeAccChange();
        }

        _targetAcc += tick / AccChangeSpeedFactor * _accChange;
        _targetAcc = std::clamp(_targetAcc, AccMin, AccMax);
    }

    updateDrivetrain(tick, _targetAcc);
}

void DriveState::randomizeAccChange()
{
    using namespace NormalDriveConstants;
    _accChange = randomize(AccChangeMin, AccChangeMax);
    _accChangeTimestamp = 0;
}
