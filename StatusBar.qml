import QtQuick 2.12
import Units 1.0
import MainModel 1.0
import Style 1.0

Item {

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

    Text {
        id: odoValue
        anchors.baseline: odo.baseline;
        anchors.left: odo.right;
        anchors.leftMargin: 4;
        text: Units.toInt(Units.kilometersToLongDistanceUnit(MainModel.odo));
        color: Style.lightPeriwinkle;
        font.pixelSize: 20;
        font.family: "Sarabun";
    }

    Text {
        id: odoUnit
        anchors.baseline: odo.baseline;
        anchors.left: odoValue.right;
        anchors.leftMargin: 4;
        text: Units.longDistanceUnit;
        color: "#657080"
        font.pixelSize: 12;
        font.family: "Sarabun";
    }

    Text {
        id: range
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 27;
        x: 170
        text: "RANGE";
        color: "#657080"
        font.pixelSize: 12;
        font.family: "Sarabun";
    }

    Text {
        id: rangeValue
        anchors.baseline: range.baseline;
        anchors.left: range.right;
        anchors.leftMargin: 4;
        text: Units.toInt(Units.kilometersToLongDistanceUnit(MainModel.range));
        color: Style.lightPeriwinkle;
        font.pixelSize: 20;
        font.family: "Sarabun";
    }

    Text {
        id: rangeUnit
        anchors.baseline: range.baseline;
        anchors.left: rangeValue.right;
        anchors.leftMargin: 4;
        text: Units.longDistanceUnit;
        color: "#657080"
        font.pixelSize: 12;
        font.family: "Sarabun";
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
