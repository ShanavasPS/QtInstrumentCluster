#include "simulationcontroller.h"
#include "mainmodel.h"

SimulationController::SimulationController(QObject *parent) : QObject(parent)
{
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(onTimerTimeout()));
}

void SimulationController::onTimerTimeout() {
    driveState.onUpdate(500);
    update();
}

void SimulationController::start()
{
    timer->start(500);
}

void SimulationController::stop()
{
    timer->stop();
}

void SimulationController::update()
{
    const Drivetrain::DriveData &data = driveState.drivetrain.getDriveData();
    MainModel* mainModel = MainModel::instance();
    mainModel->update(data);
}
