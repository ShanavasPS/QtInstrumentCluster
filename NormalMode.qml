import QtQuick 2.12

Item {
    id: root;
    property real scale: 1.0

    Image {
        id: topLine;
        source: "images/top-line.png";
        anchors.horizontalCenter: parent.horizontalCenter;
        y: 62;
    }

    LaneAssist {
            anchors.fill: parent
            scale: root.scale
        }

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
