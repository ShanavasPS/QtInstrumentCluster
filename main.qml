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

    TellTales {
        anchors.horizontalCenter: parent.horizontalCenter;
        y:16;
    }

    Car {
        anchors.fill: parent;
    }

    NormalMode {
        id: normalMode;
        anchors.fill: parent;
    }

    StatusBar {
        anchors.fill: parent;
    }
}
