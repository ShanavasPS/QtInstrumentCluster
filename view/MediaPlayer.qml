import QtQuick 2.12
import Style 1.0
import MediaPlayerModel 1.0

NormalModeContentItem {
    Repeater {
        model: ListModel {
            // FIXME: https://bugreports.qt.io/browse/UL-597
            // Durations are used in MediaPlayerModel.qml
            ListElement {
                artist: "Thomas Lammer";
                song: "Setsuna";
                cover: "qrc:/images/albums/juno.png";
            }
            ListElement {
                artist: "Thievery Corporation";
                song: "Le Monde";
                cover: "qrc:/images/albums/thievery-corp.png";
            }
            ListElement {
                artist: "Tycho";
                song: "Aweke";
                cover: "qrc:/images/albums/tycho.png";
            }
            ListElement {
                artist: "De Phazz";
                song: "Chocolate";
                cover: "qrc:/images/albums/phazz.png";
            }
            ListElement {
                artist: "AK";
                song: "Discovery";
                cover: "qrc:/images/albums/ak.png";
            }
        }

        Item {
            anchors.fill: parent
            property int pos: -(-(10 + index - MediaPlayerModel.track%5 + 2) % 5) - 2

            Text {
                id: artistTxt
                anchors.horizontalCenter: parent.horizontalCenter;
                y: 77
                text: model.artist
                font.bold: true
                font.pixelSize: 16
                font.family: "Sarabun"
                color: Style.lightPeriwinkle
                opacity: pos === 0 ? 1 : 0;
                Behavior on opacity { NumberAnimation{ duration: MediaPlayerModel.changeSongDuration } }
            }
            Text {
                id: songTxt
                anchors.horizontalCenter: parent.horizontalCenter;
                y: 96
                text: model.song;
                font.pixelSize: 14
                font.family: "Sarabun"
                color: Style.lightPeriwinkle
                opacity: artistTxt.opacity
            }

            Image {
                id: img
                x: (parent.width - width) / 2 + Math.max(Math.min(pos, 1), -1) * 49
                Behavior on x {
                    NumberAnimation{
                        duration: MediaPlayerModel.changeSongDuration
                        easing.type: pos === 1 ? Easing.OutQuad : Easing.OutCubic
                    }
                }
                opacity: pos === 0 ? 1 : Math.abs(pos) == 1 ? 0.25 : 0
                Behavior on opacity { NumberAnimation{ duration: MediaPlayerModel.changeSongDuration } }
                y: 121
                source: model.cover
            }
            z: img.opacity > 0.90 ? 1 : -Math.abs(pos);
        }
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter;
        y: 262
        id: durationLabel
        visible: true
        Text {
            text: (MediaPlayerModel.timePassed / 60).toFixed(0)
            font.pixelSize: 14
            font.family: "Sarabun"
            color: Style.lightPeriwinkle
        }
        Text {
            text: (MediaPlayerModel.timePassed % 60) < 10 ? ":0" : ":"
            font.pixelSize: 14
            font.family: "Sarabun"
            color: Style.lightPeriwinkle
        }
        Text {
            text: (MediaPlayerModel.timePassed % 60).toFixed(0)
            font.pixelSize: 14
            font.family: "Sarabun"
            color: Style.lightPeriwinkle
        }
    }

    SequentialAnimation {
        running: !MediaPlayerModel.mediaPlayback && MainModel.introSequenceCompleted
        loops: Animation.Infinite
        alwaysRunToEnd: true
        PropertyAnimation {
            target: durationLabel
            property: "opacity"
            duration: 400
            from: 1.0
            to: 0.0
        }
        PauseAnimation {
            duration: 100
        }
        PropertyAnimation {
            target: durationLabel
            property: "opacity"
            duration: 400
            from: 0.0
            to: 1.0
        }
    }
}
