import QtQuick 2.12
import QtQuick.Window 2.12
import MainModel 1.0


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
        id: highlights
        anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter; }
        source: "images/car-highlights.png"

        transform: Scale {
            origin.x: highlights.implicitWidth / 2
            origin.y: highlights.implicitHeight
        }
    }

    Text {
        id: odo
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 27;
        anchors.left: parent.left;
        anchors.leftMargin: 30;
        text: "ODO";
        color: "#657080"
        font.pixelSize: 12;
        font.family: "Sarabun";
    }

    Image {
        id: topLine;
        source: "images/top-line.png";
        anchors.horizontalCenter: parent.horizontalCenter;
        y: 62;
    }

    TellTales {
        anchors.horizontalCenter: parent.horizontalCenter;
        y:16;
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

    LinearGauge {
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 27;
        x: 534;
        image: "images/status/fuel.png";
        emptyText: "R";
        value: MainModel.fuelLevel;
    }

    LinearGauge {
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 27;
        x: 660;
        image: "images/status/battery.png";
        emptyText: "E";
        value: MainModel.batteryLevel;
    }
}
