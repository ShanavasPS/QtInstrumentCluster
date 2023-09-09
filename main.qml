import QtQuick 2.12
import QtQuick.Window 2.12

import MainModel 1.0
import SimulationController 1.0
import MediaPlayerModel 1.0
import "view" as View

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

        View.TellTales {
            anchors.horizontalCenter: parent.horizontalCenter;
            y:16;
        }

        View.Car {
            anchors.fill: parent;
        }

        View.NormalMode {
            id: normalMode;
            anchors.fill: parent;
        }

        View.StatusBar {
            anchors.fill: parent;
        }

        SimulationController {
            id: simulationController
        }

        function onKeyPressed(key : int) {
            if (key === Qt.Key_Right) {
                MediaPlayerModel.nextSong()
            } else if (key === Qt.Key_Left) {
                MediaPlayerModel.previousSong()
            } else if (key === Qt.Key_Space) {
                updateSimulationState()
            }
        }

        function updateSimulationState() {
            if(MainModel.simulationRunning) {
                simulationController.stop()
            } else {
                simulationController.start()
            }
            MainModel.simulationRunning = !MainModel.simulationRunning;
        }

        Keys.onPressed: (event)=> { onKeyPressed(event.key) }

        Component.onCompleted: {
            updateSimulationState()
        }
    }
}
