import QtQuick 2.12
import MainModel 1.0

Item {
    id: laneAssist

    property real redBorderOpacity: 0
    property real scale: 1

    Image {
        id: leftLaneAssist

        source: "images/lanes/red-border-left.png"
        opacity: redBorderOpacity
        x: 306
        y: 280
        width: 70
        height: 200

        transform: Scale {
            origin.x: laneAssist.width / 2 - leftLaneAssist.x
            origin.y: laneAssist.height - leftLaneAssist.y

            xScale: laneAssist.scale
            yScale: laneAssist.scale
        }
    }

    Image {
        id: rightLaneAssist

        source: "images/lanes/red-border-right.png"
        opacity: redBorderOpacity
        x: 424
        y: 280
        width: 70
        height: 200

        transform: Scale {
            origin.x: laneAssist.width / 2 - rightLaneAssist.x
            origin.y: laneAssist.height - rightLaneAssist.y

            xScale: laneAssist.scale
            yScale: laneAssist.scale
        }
    }

    SequentialAnimation {
        id: laneAssistAnimation
        loops: 4
        alwaysRunToEnd: true

        NumberAnimation {
            target: laneAssist
            property: "redBorderOpacity"
            from: 0
            to: 0.7
            easing.type: Easing.OutQuad
            duration: 600
        }

        NumberAnimation {
            target: laneAssist
            property: "redBorderOpacity"
            from: 0.7
            to: 0
            easing.type: Easing.InQuad
            duration: 600
        }

        PauseAnimation {
            duration: 300
        }
    }

    LaneAssistWhiteLine {
        t: t0
        scale: laneAssist.scale
        location: LaneAssistWhiteLine.Left
    }

    LaneAssistWhiteLine {
        t: t1 > 1 ? t1 - 1 : t1
        scale: laneAssist.scale
        location: LaneAssistWhiteLine.Left
    }

    LaneAssistWhiteLine {
        t: t0
        scale: laneAssist.scale
        location: LaneAssistWhiteLine.Right
    }

    LaneAssistWhiteLine {
        t: t1 > 1 ? t1 - 1 : t1
        scale: laneAssist.scale
        location: LaneAssistWhiteLine.Right
    }

    property real t0: 0
    property real t1: t0 + 0.5

    NumberAnimation on t0 {
        from: 0
        to: 1
        loops: Animation.Infinite
        duration: MainModel.speed > 0 ? 60000 / MainModel.speed : 0;
        running: MainModel.laneAssistCarMoving && MainModel.speed > 0
    }
}
