/******************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick Ultralite module.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
******************************************************************************/
#ifndef DRIVETRAIN_H
#define DRIVETRAIN_H

#include "qobject.h"
#include "qtmetamacros.h"
#include <stdint.h>

class Drivetrain : public QObject
{
Q_OBJECT
public:
    struct DriveData
    {
        float speed;
        float rpm;
        int gear;
        float odo;
        float range;
        float battery;
        float fuel;
        float coolantTemp;
    };

    struct Config
    {
        static const int MAX_GEARS = 10;

        float maxSpeed;
        float maxRpm;
        float minRpm;

        float shiftUpAtRpm;
        float shiftDownAtRpm;

        float tireCircumference; // cm
        float diffRatio;

        int gearNum;
        float gearRatios[MAX_GEARS];

        float batteryFillRatio;
        float batteryDrainRatio;

        float coolantHeatRatio;
        float coolantCooldownRatio;

        float optimalTemp;
        float maxTemp;

        float maxRange;
    };

    Drivetrain(QObject *parent = nullptr);
    void update(uint32_t tick, float acceleration);
    void udpateCruiseControll(uint32_t tick, float targetSpeed);
    void reset();
    void resetOdo(float value = 0);
    void resetBattery(float value = 0);

    float getSpeed(float rpm, int gear) const;
    float getRpm(float speed, int gear) const;

    const DriveData &getDriveData() const { return _data; }

signals:
    void speedChanged();

private:
    float updateRpm(uint32_t tick, float acceleration);
    void updateGearShift(uint32_t tick, float prevRpm, float acceleration);
    void updateSpeed();
    void applySpeedLimit();
    void updateOdo(uint32_t tick);
    void updateRange();
    void updateBattery(uint32_t tick, float acceleration);
    void updateFuelLevel();
    void updateCoolantTemp(uint32_t tick, float acceleration);
    void shiftGear(int delta);
    void updateModel();

    DriveData _data;
    const Config     _config = {
        200,                                        // float maxSpeed;
        7000,                                       // float maxRpm;
        800,                                        // float minRpm;
        6000,                                       // float shiftUpAtRpm;
        2500,                                       // float shiftDownAtRpm;
        207.3f,                                     // float tireCircumference; // cm for 225/45/R18
        7.5f,                                       // float diffRatio;
        6,                                          // int gearNum;
        {2.97f, 2.07f, 1.43f, 1.00f, 0.84f, 0.56f}, // float gearRatios[MAX_GEARS];
        0.000025f,                                  // float batteryFillRatio;
        0.00002f,                                   // float batteryDrainRatio;
        0.000055f,                                  // float coolantHeatRatio;
        0.00002f,                                   // float coolantCooldownRatio;
        90.f,                                       // float optimalTemp;
        180.f,                                      // float maxTemp;
        200.f        // float maxRange;
    };
    uint32_t _constSpeedTime;

};

#endif // DRIVETRAIN_H
