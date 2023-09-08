#include "simulationcontroller.h"
#include "qdebug.h"

SimulationController::SimulationController(QObject *parent) : QObject(parent)
{
    driveState = DriveState();
}

void SimulationController::start()
{
    // Your C++ function logic here
}

void SimulationController::startInteractiveMode()
{
    /*
    const Simulation::Drivetrain::DriveData &data = drivetrain.getDriveData();
    mainModel.speed.setValue(data.speed);
    mainModel.rpm.setValue(data.rpm);
    mainModel.odo.setValue(int(data.odo));
    mainModel.batteryLevel.setValue(data.battery);
    mainModel.temp.setValue(data.coolantTemp);
    mainModel.range.setValue(int(data.range));
    mainModel.fuelLevel.setValue(data.fuel);
    */
}

void SimulationController::stopInteractiveMode()
{
    // Your C++ function logic here
}

void SimulationController::update()
{
    driveState.onUpdate(500 * 0.1);

   emit speedChanged();
}
