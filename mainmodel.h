#ifndef MAINMODEL_H
#define MAINMODEL_H

#include <QObject>
#include "DriveTrain.h"

class MainModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float speed READ speed CONSTANT)
    Q_PROPERTY(float rpm READ rpm CONSTANT)
    Q_PROPERTY(float odo READ odo CONSTANT)
    Q_PROPERTY(float range READ range CONSTANT)

public:
    static MainModel* instance();
    float speed() const;
    float rpm() const;
    float odo() const;
    float range() const;
    void setSpeed(float newValue);
    void setRPM(float newValue);
    void setOdo(float newValue);
    void setRange(float newValue);
    void update(const Drivetrain::DriveData &data);

signals:
    void modelUpdated();

private:
    explicit MainModel(QObject* parent = nullptr);
    float m_speed;
    float m_rpm;
    float m_odo;
    float m_range;
};

#endif // MAINMODEL_H
