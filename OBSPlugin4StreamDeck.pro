#-------------------------------------------------
#
# Project created by QtCreator 2016-11-28T14:58:54
#
#-------------------------------------------------

QT       += widgets

TARGET   = StreamDeckPlugin
TEMPLATE = lib

DEFINES += OBSPLUGINSTREAMDECK_LIBRARY

SOURCES += \
    streamdeckplugin_module.cpp \
    infodialog.cpp \
    actionhelp.cpp \
    ipc_thread.cpp

HEADERS +=\
    obspluginstreamdeck_global.h \
    streamdeckplugin_module.h \
    infodialog.h \
    actionhelp.h \
    ipc_thread.h

CONFIG += c++11

VERSION = 0.1.2

QMAKE_TARGET_DESCRIPTION = "Stream Deck OBS Plugin"
QMAKE_TARGET_COMPANY = "Elgato Systems GmbH"
QMAKE_TARGET_COPYRIGHT = "Copyright \\251 2017, Elgato Systems GmbH"

DEFINES += VERSION_STR=\\\"$$VERSION\\\"

include(./SharedFile/SharedFile.pri)   # IPC
INCLUDEPATH += ./SharedFile/

win32 {
    # Qt 5.8.0-64bit VS2015
    # OBS 18.0.1
    #   https://github.com/jp9000/obs-studio/wiki/Install-Instructions#windows
    #   https://obsproject.com/forum/threads/install-instructions-windows-tips.44391/#post-228066

    CONFIG += dynamiclib
    INCLUDEPATH += $$PWD/obs-dev/win/obs-studio/libobs \
                += $$PWD/obs-dev/win/obs-studio/UI/obs-frontend-api \
                += $$PWD/obs-dev/win/obs-studio/deps


    !contains(QMAKE_TARGET.arch, x86_64) {
        message("x86 build")
        LIBS += -L$$PWD/obs-dev/win/obs-studio/build32/libobs/Release \
                -L$$PWD/obs-dev/win/obs-studio/build32/UI/obs-frontend-api/Release \
                -lobs \
                -lobs-frontend-api
        ## Windows x86 (32bit) specific build here

    } else {
        message("x86_64 build")
        LIBS += -L$$PWD/obs-dev/win/obs-studio/build64/libobs/Release \
                -L$$PWD/obs-dev/win/obs-studio/build64/UI/obs-frontend-api/Release \
                -lobs \
                -lobs-frontend-api
        ## Windows x64 (64bit) specific build here
    }


} else: macx {
    # Qt 5.8.0
    # OBS 18.0.1
    #   https://github.com/jp9000/obs-studio/wiki
    #   https://github.com/jp9000/obs-studio/wiki/Install-Instructions

    CONFIG += plugin
    QMAKE_LFLAGS_PLUGIN -= -dynamiclib
    QMAKE_LFLAGS_PLUGIN += -bundle
    QMAKE_EXTENSION_SHLIB = so
    INCLUDEPATH += $$PWD/obs-dev/mac/obs-studio/build-obs-studio/include \
                += $$PWD/obs-dev/mac/obs-studio/UI/obs-frontend-api/
    LIBS += -L$$PWD/obs-dev/mac/obs-studio/build-obs-studio/bin \
            -lobs \
            -lobs-frontend-api
}

FORMS += \
    infodialog.ui
