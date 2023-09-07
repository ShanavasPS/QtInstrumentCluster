import QtQuick 2.12
import Style 1.0

Item {
    property alias image: img.source
    property alias emptyText: t1.text
    property alias fullText: t2.text
    property real value
    property real animatedValue: value
    Behavior on animatedValue { NumberAnimation {
        easing.type: Easing.OutQuad;
        duration: MainModel.gaugesValueChangeDuration;
    }}

    width: 110
    height: 32
    Image {
        id: img
        anchors.bottom: parent.bottom;
    }
    Rectangle {
        id: rect
        color: "#002b66"
        height: 6;
        y: 20;
        anchors.left: parent.left;
        anchors.leftMargin: 28;
        anchors.right: parent.right;
        anchors.rightMargin: 12;

        Rectangle {
            color: Style.highlighterGreen;
            height: parent.height;
            width: parent.width * animatedValue;
        }
    }
    Text {
        id: t1;
        anchors.horizontalCenter: rect.left ;
        anchors.bottom: rect.top;
        anchors.bottomMargin: 4
        color: Style.lightPeriwinkle;
        anchors.rightMargin: 30
        y: 22;
        height: 16;
        font.pixelSize: 12;
        font.family: "Sarabun";
        horizontalAlignment: Text.AlignHCenter;
    }
    Text {
        id: t2;
        text: "1/1"
        anchors.horizontalCenter: rect.right;
        anchors.bottom: rect.top;
        anchors.bottomMargin: 4
        color: Style.lightPeriwinkle;
        anchors.rightMargin: 30
        y: 22;
        height: 16;
        font.pixelSize: 12;
        font.family: "Sarabun";
        horizontalAlignment: Text.AlignHCenter;
    }
}
