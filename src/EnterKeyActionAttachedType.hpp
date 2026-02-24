#pragma once

#include <QObject>
#include <qqml.h>

class EnterKeyActionAttachedType : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(bool enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)

public:
    explicit EnterKeyActionAttachedType(QObject* parent = nullptr);

    bool enabled() const;
    void setEnabled(bool enabled);

signals:
    void enabledChanged();

private:
    bool m_enabled;
};
