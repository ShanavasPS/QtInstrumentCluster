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

void MainModel::setSpeed(float newValue) {
    if (m_speed != newValue) {
        m_speed = newValue;
        emit speedChanged();
    }
}
