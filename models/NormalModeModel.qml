pragma Singleton
import QtQuick 2.15

QtObject {
    id: normalmodemodel

    enum Menu { MediaPlayerMenu, NavigationMenu, PhoneMenu, CarStatusMenu, MenuCount }
    property int menu: NormalModeModel.MediaPlayerMenu

    function nextMenu() {
        if (menu === NormalModeModel.MediaPlayerMenu) {
            menu = NormalModeModel.NavigationMenu
        }
        else if (menu === NormalModeModel.NavigationMenu ) {
            menu = NormalModeModel.PhoneMenu
        }
        else if (menu === NormalModeModel.PhoneMenu ) {
            menu = NormalModeModel.CarStatusMenu
        }
        else if (menu === NormalModeModel.CarStatusMenu ) {
            menu = NormalModeModel.MediaPlayerMenu
        }
    }

    function previousMenu() {
        if (menu === NormalModeModel.MediaPlayerMenu) {
            menu = NormalModeModel.CarStatusMenu
        }
        else if (menu === NormalModeModel.NavigationMenu ) {
            menu = NormalModeModel.MediaPlayerMenu
        }
        else if (menu === NormalModeModel.PhoneMenu ) {
            menu = NormalModeModel.NavigationMenu
        }
        else if (menu === NormalModeModel.CarStatusMenu ) {
            menu = NormalModeModel.PhoneMenu
        }
    }
}
