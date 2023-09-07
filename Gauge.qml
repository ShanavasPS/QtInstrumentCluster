import QtQuick 2.12
import Style 1.0

BaseGauge {
    id: root;
    property alias textLabel: label.text;
    property alias valueText: textValue.text;
    property real valueTextScale: 1;
    property double labelOpacity: 1
    property int labelHorizontalCenterOffset: 0
    property int labelVerticalOffset: 0
    property int valueVerticalCenterOffset: -7
    property int valueHorizontalCenterOffset: 0

    Repeater {
        model: 13;
        delegate: Text {
            id: entry
            visible: index <= Math.ceil(maxValue / interval); // Ideally, the model would be dynamic and this not needed
            property real angle: minAngle + 2 * Math.PI * index * interval / maxValue * (maxAngle - minAngle) / 360;
            x: (root.width - width) / 2 + (root.leftOrientation ? -1 : 1) * Math.sin(angle) * 135;
            y: (root.height - height) / 2 + Math.cos(angle) * 135;
            text: index * interval;
            color: Style.lightPeriwinkle;
            font.pixelSize: 12;
            font.bold: false;
            font.family: "Sarabun";
            opacity: {
                var distance = Math.abs(animatedValue/interval - index);
                var alphaResult = 1.5 - (distance / 1.25);
                return Math.min(Math.max(alphaResult, 0), 1);
            }
            Behavior on opacity { NumberAnimation { duration: 150; } }
            transform: Scale {
                origin.x: transformOriginX - entry.x
                origin.y: 340 - entry.y
                xScale: root.scale
                yScale: root.scale
            }
        }
    }

    Text {
        id: textValue
        anchors.centerIn: parent
        anchors.verticalCenterOffset: valueVerticalCenterOffset
        anchors.horizontalCenterOffset: valueHorizontalCenterOffset
        opacity: labelOpacity
        horizontalAlignment: Text.AlignHCenter
        text: animatedValue.toFixed(0);
        color: Style.lightPeriwinkle;
        font.pixelSize: 64;
        font.bold: true;
        font.family: "Sarabun";
        transform: [
            Scale {
                origin.x: transformOriginX - textValue.x
                origin.y: 340 - textValue.y
                xScale: root.scale
                yScale: root.scale
            },
            Scale {
                origin.x: textValue.width / 2
                origin.y: textValue.height / 2
                xScale: valueTextScale
                yScale: valueTextScale
            }
        ]
    }

    Text {
        id: label
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: labelHorizontalCenterOffset
        anchors.topMargin: labelVerticalOffset
        anchors.top: textValue.bottom;
        opacity: labelOpacity
        color: Style.lightPeriwinkle;
        font.pixelSize: 16;
        font.bold: false;
        font.family: "Sarabun";
        transform: Scale {
            origin.x: transformOriginX - label.x
            origin.y: 340 - label.y
            xScale: root.scale
            yScale: root.scale
        }
    }
}
