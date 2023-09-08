pragma Singleton
import QtQuick 2.15

QtObject {
    id: mediaplayermodel
    property bool mediaPlayback: true

    function play() {
        mediaplayermodel.mediaPlayback = true
    }
    function stop() {
        mediaplayermodel.mediaPlayback = false
    }
    function nextSong() {
        track = (track+1)%trackCount
    }
    function previousSong() {
        track = (track+trackCount-1)%trackCount
    }

    property int track: 0
    property int timePassed: 0 // sec
    readonly property int trackCount: 5
    readonly property int changeSongDuration: 300

    onTrackChanged: {
        timePassed = 0
    }

    onTimePassedChanged: {
        var duration = 0
        switch (track) {
            case 0: duration = 3.5 * 3600; break;
            case 1: duration = 3.8 * 3600; break;
            case 2: duration = 3.2 * 3600; break;
            case 3: duration = 3.5 * 3600; break;
            case 4: duration = 4.5 * 3600; break;
        }
        if (timePassed > duration) {
            nextSong()
        }
    }

    property Timer timePassedTimer: Timer {
        running: mediaplayermodel.mediaPlayback
        repeat: true
        interval: 1000
        onTriggered: { timePassed += 1 }
    }
}
