#include "simulationcontroller.h"
#include "qdebug.h"
#include "mainmodel.h"

SimulationController::SimulationController(QObject *parent) : QObject(parent)
{
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(onTimerTimeout()));
}

void SimulationController::onTimerTimeout() {
    driveState.onUpdate(500);
}

void SimulationController::start()
{
    timer->start(500);
}

void SimulationController::startInteractiveMode()
{

}

void SimulationController::stopInteractiveMode()
{
    // Your C++ function logic here
}

void SimulationController::update()
{
    const Drivetrain::DriveData &data = driveState.drivetrain.getDriveData();
    MainModel* mainModel = MainModel::instance();
    mainModel->setRPM(data.rpm);
    mainModel->setSpeed(data.speed);
    mainModel->setOdo(data.odo);
    mainModel->setRange(data.range);
    /*mainModel.speed.setValue(data.speed);
    mainModel.rpm.setValue(data.rpm);
    mainModel.odo.setValue(int(data.odo));
    mainModel.batteryLevel.setValue(data.battery);
    mainModel.temp.setValue(data.coolantTemp);
    mainModel.range.setValue(int(data.range));
    mainModel->fuelLevel.setValue(data.fuel);*/
}
