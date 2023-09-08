#ifndef MAINMODEL_H
#define MAINMODEL_H

#include <QObject>

class MainModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float speed READ speed CONSTANT)
    Q_PROPERTY(float rpm READ rpm CONSTANT)

public:
    static MainModel* instance();
    float speed() const;
    float rpm() const;
    void setSpeed(float newValue);
    void setRPM(float newValue);

signals:
    void speedChanged();

private:
    explicit MainModel(QObject* parent = nullptr);
    float m_speed;
    float m_rpm;
};

#endif // MAINMODEL_H
