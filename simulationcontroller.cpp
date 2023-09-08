#include "simulationcontroller.h"
#include "qdebug.h"

SimulationController::SimulationController(QObject *parent) : QObject(parent)
{
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(onTimerTimeout()));
}

void SimulationController::onTimerTimeout() {
    driveState.onUpdate(500 * 0.1);
}

void SimulationController::start()
{
    timer->start(500 * 0.1);
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
    // Check if the timer is running
   //emit speedChanged();
}
