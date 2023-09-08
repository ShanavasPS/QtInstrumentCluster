import QtQuick 2.12
import QtQuick.Window 2.12
import MainModel 1.0
import NormalModeModel 1.0
import SimulationController 1.0
import Drivetrain 1.0
import MainModelData 1.0
import TellTalesModel 1.0
import MediaPlayerModel 1.0

Window {
    id: window;
    width: 800;
    height: 480;
    visible: true
    title: qsTr("Instrument Cluster Demo")

    Rectangle {
        id: root;
        anchors.fill: parent;
        focus: true

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

        SimulationController {
            id: simulationController
        }

        Timer {
            interval: 500
            running: true
            repeat: true
            onTriggered: {
                simulationController.update();
                TellTalesModel.qtLogoOpacity = 0
                MainModel.speed = MainModelData.speed
                MainModel.rpm = MainModelData.rpm
                MainModel.odo = MainModelData.odo
                MainModel.range = MainModelData.range
            }
        }

        function onKeyPressed(key : int) {
            if (key === Qt.Key_Right) {
                MediaPlayerModel.nextSong()
            } else if (key === Qt.Key_Left) {
                MediaPlayerModel.previousSong()
            }
        }

        Keys.onPressed: (event)=> { onKeyPressed(event.key) }

        Component.onCompleted: {
            simulationController.start()
            TellTalesModel.qtLogoOpacity = 1
        }
    }


}
