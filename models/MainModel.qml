pragma Singleton
import QtQuick 2.15
import Units 1.0
import MainModelData 1.0

QtObject {
    id: mainmodel

    enum ClusterMode { ModeNormal, ModeSport, ModeEco }
    property int clusterMode: MainModel.ModeNormal
    property bool introSequenceStarted: false
    property bool introSequenceCompleted: false

    property int speedLimitWarning: SpeedLimitValues.Slow
    readonly property int initialOdo: 300
    property int odo: initialOdo

    readonly property int fullRange: 895
    property int range: fullRange - odo
    property real speed: 0
    property real rpm: 0
    property string gearShiftText: "P"
    property real temp: 0

    readonly property real initialFuelLevel: range / fullRange
    readonly property real initialBatteryLevel: 0.2

    property real fuelLevel: initialFuelLevel
    property real batteryLevel: initialBatteryLevel

    readonly property int maxSpeed: Units.longDistanceUnitToKilometers(Units.maximumSpeed)
    readonly property int maxRpm: 7000

    property bool telltalesVisible: true
    property bool clusterVisible: true
    property real clusterOpacity: 0
    property real gaugesOpacity: 0

    readonly property int clusterOpacityChangeDuration: 750
    readonly property int gaugesOpacityChangeDuration: 750;

    readonly property int gaugesValueChangeDurationNormal: 500
    readonly property int gaugesValueChangeDurationSlow: 1250
    property int gaugesValueChangeDuration: gaugesValueChangeDurationNormal

    property bool laneAssistCarMoving: true

    signal triggerLaneAssist(int side)
    signal triggerGuideArrow(int index)
}
