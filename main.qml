import QtQuick 2.12
import QtQuick.Window 2.12
import MainModel 1.0
import NormalModeModel 1.0
import SimulationController 1.0
import Drivetrain 1.0
import MainModelData 1.0

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
            interval: 50
            running: true
            repeat: true
            onTriggered: {
                simulationController.update();
                MainModel.speed = MainModelData.speed
                MainModel.rpm = MainModelData.rpm
                MainModel.odo = MainModelData.odo
                MainModel.range = MainModelData.range
                MainModel.gearShiftText = MainModelData.odo === 0 ? "P" : "D"
            }
        }

        function onKeyPressed(key : int) {
            if (key === Qt.Key_Right) {
                NormalModeModel.nextMenu()
            } else if (key === Qt.Key_Left) {
                NormalModeModel.previousMenu()
            }
        }

        Keys.onPressed: (event)=> { onKeyPressed(event.key) }
        Keys.onReleased: (event)=> { onKeyReleased(event.key) }

        Component.onCompleted: {
            simulationController.start()
        }
    }


}
