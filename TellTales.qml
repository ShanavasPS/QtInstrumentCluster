import QtQuick 2.12
import TellTalesModel 1.0
import Style 1.0

Row {
    id: telltales;

    TellTalesIndicator
    {
        source: "images/telltales/turn_left.png";
        activeColor: Style.highlighterGreen;
        active: TellTalesModel.turnLeftActive;
        indicatorOpacity: TellTalesModel.indicatorOpacity;
        blinking: TellTalesModel.turnLeftBlinking;
    }
    TellTalesIndicator
    {
        source: "images/telltales/beam.png";
        activeColor: Style.highlighterGreen;
        active: TellTalesModel.beamActive;
        indicatorOpacity: TellTalesModel.indicatorOpacity;
    }
    TellTalesIndicator
    {
        source: "images/telltales/high-beams.png";
        activeColor: Style.brightBlue;
        active: TellTalesModel.highBeamsActive;
        indicatorOpacity: TellTalesModel.indicatorOpacity;
    }
    TellTalesIndicator
    {
        source: "images/telltales/ready.png";
        activeColor: Style.highlighterGreen;
        active: true;
        indicatorOpacity: TellTalesModel.qtLogoOpacity;
    }
    TellTalesIndicator
    {
        source: "images/telltales/parked.png";
        activeColor: Style.highlighterRed;
        active: TellTalesModel.parkedActive;
        indicatorOpacity: TellTalesModel.indicatorOpacity;
    }
    TellTalesIndicator
    {
        source: "images/telltales/airbag.png";
        activeColor: Style.highlighterRed;
        active: TellTalesModel.airbagActive;
        indicatorOpacity: TellTalesModel.indicatorOpacity;
    }
    TellTalesIndicator
    {
        source: "images/telltales/turn_right.png";
        activeColor: Style.highlighterGreen;
        active: TellTalesModel.turnRightActive;
        indicatorOpacity: TellTalesModel.indicatorOpacity;
        blinking: TellTalesModel.turnRightBlinking;
    }
}
