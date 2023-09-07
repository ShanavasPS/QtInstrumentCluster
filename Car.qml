import QtQuick 2.12

Item {
    Image {
        id: bg
        anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter; }
        source: "images/bg-mask.png"

        transform: Scale {
            origin.x: bg.implicitWidth / 2
            origin.y: bg.implicitHeight
        }
    }

    Image {
        id: highlights
        anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter; }
        source: "images/car-highlights.png"

        transform: Scale {
            origin.x: highlights.implicitWidth / 2
            origin.y: highlights.implicitHeight
        }
    }
}
