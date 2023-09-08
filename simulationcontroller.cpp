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

void SimulationController::update()
{
    const Drivetrain::DriveData &data = driveState.drivetrain.getDriveData();
    MainModel* mainModel = MainModel::instance();
    mainModel->setRPM(data.rpm);
    mainModel->setSpeed(data.speed);
    mainModel->setOdo(data.odo);
    mainModel->setRange(data.range);
}
