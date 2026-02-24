#include "KeyboardTheme.h"

KeyboardTheme::KeyboardTheme(QObject* parent) : QObject(parent) {}

QString KeyboardTheme::themeName() const { return m_themeName; }

void KeyboardTheme::setThemeName(const QString& name)
{
    if (m_themeName != name)
    {
        m_themeName = name;
        emit themeNameChanged();
    }
}
