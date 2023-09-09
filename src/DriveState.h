#ifndef DRIVESTATE_H
#define DRIVESTATE_H


#include <cstdint>
#include "DriveTrain.h"

class DriveState
{
public:
    DriveState();
    void drive(uint32_t tick);
    void randomizeAccChange();
    void updateDrivetrain(uint32_t tick, float acceleration);
    void onUpdate(uint32_t tick);

    uint64_t getStateTime() const { return _cumulatedTime; }

    uint32_t _accChangeTimestamp;
    float _targetAcc;
    float _accChange;
    float _acceleration;
    uint64_t _cumulatedTime;
    bool _comesFromDriveState;
    Drivetrain drivetrain = Drivetrain();

};

#endif // DRIVESTATE_H
