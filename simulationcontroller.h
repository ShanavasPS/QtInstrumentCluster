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
    void drive();

public slots:
    void start();
    void startInteractiveMode();
    void stopInteractiveMode();
    void update();
    void onTimerTimeout();

signals:
    void speedChanged();
private:
    void randomizeAccChange();
    DriveState driveState;
    QTimer *timer;
};

#endif // SIMULATIONCONTROLLER_H
