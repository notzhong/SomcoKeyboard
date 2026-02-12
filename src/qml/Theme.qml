pragma Singleton

import QtQuick 2.0

QtObject {
    id: root

    enum Theme {
        Light = 0,
        Dark = 1
    }

    readonly property var availableThemes: [lightTheme, darkTheme]

    property QtObject currentTheme: availableThemes[Theme.Dark]

    function setTheme(style) {
        currentTheme = availableThemes[style]
    }

    function getAvailableThemeNames() {
        return availableThemes.map(theme => theme.themeName)
    }

    function getThemedUrl(fileName) {
        return "qrc:/icons/SKeyboard/" + currentTheme.themeName + "/" + fileName
    }

    readonly property QtObject darkTheme: QtObject {
        readonly property string themeName: "dark"

        readonly property color overlayBackgroundColor: "#000000"
        readonly property color backgroundColor: "#000000"
        readonly property color btnBackgroundColor: "#2A3139"
        readonly property color btnSpecialBackgroundColor: "#4B545E"
        readonly property color btnEnterBackgroundColor: "#1DCA9B"
        readonly property color btnTextColor: "#FFFFFF"
    }

    readonly property QtObject lightTheme: QtObject {
        readonly property string themeName: "light"

        readonly property color overlayBackgroundColor: "#D4E3EE"
        readonly property color backgroundColor: "#C2D4EA"
        readonly property color btnBackgroundColor: "#DEECFB"
        readonly property color btnSpecialBackgroundColor: "#ADC3DB"
        readonly property color btnEnterBackgroundColor: "#1DCA9B"
        readonly property color btnTextColor: "#000000"
    }

    // Proxy properties
    readonly property color overlayBackgroundColor: currentTheme.overlayBackgroundColor
    readonly property color backgroundColor: currentTheme.backgroundColor
    readonly property color btnBackgroundColor: currentTheme.btnBackgroundColor
    readonly property color btnSpecialBackgroundColor: currentTheme.btnSpecialBackgroundColor
    readonly property color btnEnterBackgroundColor: currentTheme.btnEnterBackgroundColor
    readonly property color btnTextColor: currentTheme.btnTextColor

    readonly property string btnTextFontFamily: "Inter"
    readonly property int btnTextFontSize: 21
}
