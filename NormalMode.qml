import QtQuick 2.12

Item {
    id: root;
    Gauge {
        id: leftGauge;
        x: 20;
        y: 44;
        leftOrientation: true;
    }

    Gauge {
        id: rightGauge;
        x: root.width - rightGauge.width - 20;
        y: 44;
        leftOrientation: false;
        maxAngle: 180
    }
}
