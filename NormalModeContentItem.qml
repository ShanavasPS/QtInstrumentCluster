import QtQuick 2.12

Item {
    id: root;
    opacity: 0;
    visible: opacity != 0

    property bool activeMode: true; // if the mode is act
    property bool selected: false;

    states: [
        State {
            name: "hidden";
            when: activeMode && !selected;
        },
        State {
            name: "visible";
            when: activeMode && selected;
            PropertyChanges { target: root; opacity: 1.; }
        }
    ]
    transitions: [
        Transition {
            from: "hidden"; to: "visible";
            SequentialAnimation {
                PauseAnimation { duration: 250 } // time for the other page to hide
                PropertyAnimation { duration: 250; property: "opacity"; }
            }
        },
        Transition {
            from: "visible"; to: "hidden";
            PropertyAnimation { duration: 250; property: "opacity"; }
        }
    ]
}
