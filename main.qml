import QtQuick 2.12
import QtQuick.Window 2.12
import MainModel 1.0
import NormalModeModel 1.0

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

        Timer {
            interval: 50
            running: true
            repeat: true
            onTriggered: {
                //ConnectivityService.sendHeartBeat()
            }
        }

        Timer {
            id: inactivityTimer
            interval: 10000
            running: false
            repeat: false
            onTriggered: {
                simulationController.stopInteractiveMode()
            }
        }

        function enterInteractiveMode() {
            simulationController.startInteractiveMode();
            inactivityTimer.restart()
        }

        function onKeyPressed(key : int) {
            if (key === Qt.Key_Right) {
                NormalModeModel.nextMenu()
            } else if (key === Qt.Key_Left) {
                NormalModeModel.previousMenu()
            }
        }

        function onKeyReleased(key : int) {
            if (!MainModel.introSequenceCompleted) {
                return
            }
            enterInteractiveMode()
        }

        Keys.onPressed: (event)=> { onKeyPressed(event.key) }
        Keys.onReleased: (event)=> { onKeyReleased(event.key) }

        Component.onCompleted: {
            simulationController.start()
        }
    }


}
