QT += qml quick quick-private gui-private

CONFIG += plugin

TARGET = somcokeyboard

CONFIG(debug, debug|release) {
    TARGET = $$TARGET"d"
}

TEMPLATE = lib

SOURCES += \
    EnterKeyAction.cpp \
    EnterKeyActionAttachedType.cpp \
    VirtualKeyboardInputContextPlugin.cpp \
    VirtualKeyboardInputContext.cpp \
    DeclarativeInputEngine.cpp \
    ThemeManager.cpp \
    KeyboardTheme.cpp

HEADERS += \
    EnterKeyAction.hpp \
    EnterKeyActionAttachedType.hpp \
    VirtualKeyboardInputContextPlugin.h \
    VirtualKeyboardInputContext.h \
    DeclarativeInputEngine.h \
    ThemeManager.h \
    KeyboardTheme.h

RESOURCES += \
    icons/icons.qrc

QML_FILES += \
    qml/qmldir \
    qml/*.qml

OTHER_FILES += $$QML_FILES

INSTALLS += \
    target \
    deployment

!defined(INSTALL_PREFIX, var):INSTALL_PREFIX = $$[QT_INSTALL_PREFIX]

INSTALL_QML = $$INSTALL_PREFIX/$$relative_path($$[QT_INSTALL_QML], $$[QT_INSTALL_PREFIX])
INSTALL_PLUGINS = $$INSTALL_PREFIX/$$relative_path($$[QT_INSTALL_PLUGINS], $$[QT_INSTALL_PREFIX])

deployment.files = $$QML_FILES
deployment.path = $$INSTALL_QML/QtQuick/SomcoKeyboard
target.path = $$INSTALL_PLUGINS/platforminputcontexts
