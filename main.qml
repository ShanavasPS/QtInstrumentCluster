import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root;
    width: 800;
    height: 480;
    visible: true
    title: qsTr("Instrument Cluster Demo")

    color: "#00091a"

    Image {
        id: bg
        anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter; }
        source: "images/bg-mask.png"

        transform: Scale {
            origin.x: bg.implicitWidth / 2
            origin.y: bg.implicitHeight
        }
    }

    Image {
        id: topLine;
        source: "images/top-line.png";
        anchors.horizontalCenter: parent.horizontalCenter;
        y: 62;
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
