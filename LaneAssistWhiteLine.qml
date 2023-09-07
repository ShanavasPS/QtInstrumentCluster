import QtQuick 2.12

Image {
    id: root

    enum Location { Left = 0, Right = 1 }

    property int location: LaneAssistWhiteLine.Left
    property real scale: 1

    property real t: 0

    // line animation
    property real s: 0.1 + t * t * 1.9

    source: location == LaneAssistWhiteLine.Left ? "images/lanes/white-line-left.png"
                                                 : "images/lanes/white-line-right.png"

    x: location == LaneAssistWhiteLine.Left ? 326 : 454
    y: 386

    opacity: Math.min(1 - (1 - s) * (1 - s), 1)

    transform: [
        // line animation
        Scale {
            xScale: s
            yScale: s

            origin.x: location == LaneAssistWhiteLine.Left ? 42 : -22
            origin.y: -86
        },
        // navi scale
        Scale {
            origin.x: 400 - root.x
            origin.y: 480 - root.y

            xScale: scale
            yScale: scale
        }
    ]
}
