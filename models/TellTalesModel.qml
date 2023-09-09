pragma Singleton
import QtQuick 2.15

QtObject {
    id: telltalesmodel;

    property bool turnLeftActive: true;
    property bool beamActive: true;
    property bool highBeamsActive: true;
    property bool parkedActive: true;
    property bool airbagActive: true;
    property bool turnRightActive: true;

    property bool turnLeftBlinking: true;
    property bool turnRightBlinking: true;

    readonly property int opacityChangeDuration: 500;
    property double qtLogoOpacity: 1;
    property double indicatorOpacity: 1;
}
