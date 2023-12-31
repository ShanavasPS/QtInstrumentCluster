#include "mainmodel.h"

MainModel::MainModel(QObject* parent) : QObject(parent) {}

MainModel* MainModel::instance()
{
    static MainModel* s_instance = nullptr;
    if (!s_instance)
        s_instance = new MainModel();
    return s_instance;
}

float MainModel::speed() const
{
    return m_speed;
}

float MainModel::rpm() const
{
    return m_rpm;
}

float MainModel::odo() const
{
    return m_odo;
}

float MainModel::range() const
{
    return m_range;
}

void MainModel::setSpeed(float newValue) {
    if (m_speed != newValue) {
        m_speed = newValue;
    }
}

void MainModel::setRPM(float newValue) {
    if (m_rpm != newValue) {
        m_rpm = newValue;
    }
}

void MainModel::setOdo(float newValue) {
    if (m_odo != newValue) {
        m_odo = newValue;
    }
}

void MainModel::setRange(float newValue) {
    if (m_range != newValue) {
        m_range = newValue;
    }
}

void MainModel::update(const Drivetrain::DriveData &data) {
    setRPM(data.rpm);
    setSpeed(data.speed);
    setOdo(data.odo);
    setRange(data.range);
    emit modelUpdated();
}
