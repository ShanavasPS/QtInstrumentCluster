#ifndef MAINMODEL_H
#define MAINMODEL_H

#include <QObject>

class MainModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float speed READ speed NOTIFY speedChanged)

public:
    static MainModel* instance();
    float speed() const;
    void setSpeed(float newValue);

signals:
    void speedChanged();

private:
    explicit MainModel(QObject* parent = nullptr);
    float m_speed = 42;
};

#endif // MAINMODEL_H
