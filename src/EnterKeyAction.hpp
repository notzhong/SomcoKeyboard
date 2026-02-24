#pragma once

#include <QObject>
#include <qqml.h>

class EnterKeyActionAttachedType;

class EnterKeyAction : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_ATTACHED(EnterKeyActionAttachedType)

public:
    static EnterKeyActionAttachedType* qmlAttachedProperties(QObject* object);
};
