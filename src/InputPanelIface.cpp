#include "InputPanelIface.hpp"

struct InputPanelIface::InputPanelIfacePrivate {
    QStringList availableLanguageLayouts{};
    QString languageLayout{};
};

InputPanelIface::InputPanelIface(QObject *parent)
    : QObject(parent), pimpl(new InputPanelIfacePrivate) {}

InputPanelIface::~InputPanelIface() {
    if (pimpl != nullptr) {
        delete pimpl;
    }
}

QStringList InputPanelIface::availableLanguageLayouts() const {
    return pimpl->availableLanguageLayouts;
}

void InputPanelIface::setAvailableLanguageLayouts(
    const QStringList &availableLanguageLayouts) {
    if (pimpl->availableLanguageLayouts != availableLanguageLayouts) {
        pimpl->availableLanguageLayouts = availableLanguageLayouts;
        emit availableLanguageLayoutsChanged();
    }
}

QString InputPanelIface::languageLayout() const {
    return pimpl->languageLayout;
}

void InputPanelIface::setLanguageLayout(const QString &languageLayout) {
    if (pimpl->languageLayout != languageLayout) {
        pimpl->languageLayout = languageLayout;
        emit languageLayoutChanged();
    }
}
