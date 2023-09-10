#ifndef SIMULATIONCONTROLLER_H
#define SIMULATIONCONTROLLER_H

#include <QObject>
#include "DriveState.h"
#include <QTimer>

struct SimulationController : public QObject
{
    Q_OBJECT
public:
    explicit SimulationController(QObject *parent = nullptr);

public slots:
    void start();
    void stop();
    void onTimerTimeout();

private:
    void randomizeAccChange();
    DriveState driveState;
    QTimer *timer;
};

#endif // SIMULATIONCONTROLLER_H
