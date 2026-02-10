/**
 * \file VirtualKeyboardInputContextPlugin.h
 *
 * \brief Declaration of VirtualKeyboardInputContextPlugin
 *
 * \author Uwe Kindler
 * \date 08/01/2015
 *
 * Copyright (c) 2015 Uwe Kindler
 */

#pragma once

#include <qpa/qplatforminputcontextplugin_p.h>

#include "virtualkeyboard_global.h"

/**
 * Implementation of QPlatformInputContextPlugin
 */
class VirtualKeyboardInputContextPlugin : public QPlatformInputContextPlugin {
    Q_OBJECT

    Q_PLUGIN_METADATA(IID QPlatformInputContextFactoryInterface_iid FILE
                      "skeyboard.json")

   public:
    QPlatformInputContext *create(const QString &, const QStringList &);
};

