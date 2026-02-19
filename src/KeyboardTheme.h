#pragma once

#include <qnamespace.h>
#include <qqmlintegration.h>

namespace KeyboardTheme {
Q_NAMESPACE

QML_ELEMENT
enum KeyboardTheme {
    Light = 0,
    Dark = 1
};

Q_ENUM_NS(KeyboardTheme);
} // namespace KeyboardTheme
