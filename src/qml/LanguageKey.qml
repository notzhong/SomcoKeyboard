import QtQuick 2.0
import SomcoKeyboard 1.0

// Decorative language key: kept for UI parity with the multi-language
// edition. It performs no action in this English-only branch.
// 仅作占位展示的“语言”按键（保留多语言版的观感），本分支中无切换功能。
Key {
    objectName: inputPanelRef.objectName + "Key_Language"
    weight: 112
    btnIcon: ThemeManager.currentTheme.languageIcon
    functionKey: true
    showPreview: false
    btnIconSize: Qt.size(24, 24)
    btnBackground: ThemeManager.currentTheme.btnSpecialBackgroundColor
}
