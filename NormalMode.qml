import QtQuick 2.12
import NormalModeModel 1.0
import Style 1.0
import MainModel 1.0
import Units 1.0
import MainModelData 1.0

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

    Item {
        id: mainElement;
        anchors.fill: parent
        MediaPlayer {
            activeMode: active;
            selected: true;//menu == NormalModeModel.MediaPlayerMenu;
            anchors.fill: parent;
        }
    }

    Gauge {
        id: leftGauge;
        x: 20;
        y: 44;
        leftOrientation: true;
        value: Units.kilometersToLongDistanceUnit(MainModel.speed)
        maxValue: Units.maximumSpeed
        textLabel: Units.speedUnit
    }

    Gauge {
        id: rightGauge;
        x: root.width - rightGauge.width - 20;
        y: 44;
        leftOrientation: false;
        value: MainModel.rpm / 1000;
        valueText: MainModel.speed === 0 ? "P" : "D"
        maxValue: MainModel.maxRpm / 1000;
        maxAngle: 180
        textLabel: ""

        Text {
            id: rpmLabel
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -35
            anchors.verticalCenterOffset: 100

            opacity: 0.2
            horizontalAlignment: Text.AlignRight
            text: "x1000\n    RPM"
            color: Style.lightPeriwinkle;
            font.pixelSize: 10
            font.family: "Sarabun"

            transform: Scale {
                origin.x: rightGauge.transformOriginX - rpmLabel.x
                origin.y: 340 - rpmLabel.y
                xScale: rightGauge.scale
                yScale: rightGauge.scale
            }
        }
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
