import QtQuick 2.12
import NormalModeModel 1.0

Item {
    id: root;
    property real scale: 1.0
    property int menu: NormalModeModel.menu;

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

    Menu {
        id: normalMenu;
        opacity: topLine.opacity;
        anchors.horizontalCenter: parent.horizontalCenter;
        y: 293;
        currentIndex: menu;
        onClicked: menu = index;
    }
}
