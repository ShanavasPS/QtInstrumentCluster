import QtQuick 2.12
import Style 1.0
import TellTalesModel 1.0

Item {
    id: indicator
    height: 28;
    width: image.width + 15;

    property alias source: image.source;
    property bool active: false;
    property color activeColor: Style.highlighterGreen
    property color inactiveColor: Style.darkBlue;
    property alias indicatorOpacity: image.opacity;
    property alias blinking: indicatorBlinkAnimation.running

    Image {
        id: image;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;

        Behavior on opacity { NumberAnimation {
            easing.type: Easing.InOutQuad;
            duration: TellTalesModel.opacityChangeDuration;
        }}
    }

    SequentialAnimation {
        id: indicatorBlinkAnimation
        loops: Animation.Infinite
        alwaysRunToEnd: true

        ScriptAction {
            script: indicator.active = true;
        }

        PauseAnimation {
            duration: 400
        }

        ScriptAction {
            script: indicator.active = false;
        }

        PauseAnimation {
            duration: 300
        }
    }
}
