CONFIG += c++11
QMAKE_CXXFLAGS+="-std=c++0x -Wall -Wextra"
mac:QMAKE_CXXFLAGS+="-stdlib=libc++"

TEMPLATE = app
QT += network xml widgets
TRANSLATIONS += $$PWD/../plugins/Languages/ar/translation.ts \
    $$PWD/../plugins/Languages/de/translation.ts \
    $$PWD/../plugins/Languages/el/translation.ts \
    $$PWD/../resources/Languages/en/translation.ts \
    $$PWD/../plugins/Languages/es/translation.ts \
    $$PWD/../plugins/Languages/fr/translation.ts \
    $$PWD/../plugins/Languages/hi/translation.ts \
    $$PWD/../plugins/Languages/hu/translation.ts \
    $$PWD/../plugins/Languages/id/translation.ts \
    $$PWD/../plugins/Languages/it/translation.ts \
    $$PWD/../plugins/Languages/ja/translation.ts \
    $$PWD/../plugins/Languages/ko/translation.ts \
    $$PWD/../plugins/Languages/nl/translation.ts \
    $$PWD/../plugins/Languages/no/translation.ts \
    $$PWD/../plugins/Languages/pl/translation.ts \
    $$PWD/../plugins/Languages/pt/translation.ts \
    $$PWD/../plugins/Languages/ru/translation.ts \
    $$PWD/../plugins/Languages/th/translation.ts \
    $$PWD/../plugins/Languages/tr/translation.ts \
    $$PWD/../plugins/Languages/zh/translation.ts \
    $$PWD/../plugins/Languages/zh_TW/translation.ts

TARGET = ultracopier
macx {
    ICON = $$PWD/../resources/ultracopier.icns
    #QT += macextras
}
FORMS += $$PWD/../HelpDialog.ui \
    $$PWD/../PluginInformation.ui \
    $$PWD/../OptionDialog.ui \
    $$PWD/../OSSpecific.ui
RESOURCES += \
    $$PWD/../resources/ultracopier-resources.qrc \
    $$PWD/../resources/ultracopier-resources_unix.qrc \
    $$PWD/../resources/ultracopier-resources_windows.qrc
win32 {
    RESOURCES += $$PWD/../resources/resources-windows-qt-plugin.qrc
    RC_FILE += $$PWD/../resources/resources-windows.rc
    #LIBS += -lpdh
        LIBS += -ladvapi32
}

HEADERS += $$PWD/../ResourcesManager.h \
    $$PWD/../ThemesManager.h \
    $$PWD/../SystrayIcon.h \
    $$PWD/../StructEnumDefinition.h \
    $$PWD/../EventDispatcher.h \
    $$PWD/../Environment.h \
    $$PWD/../DebugEngine.h \
    $$PWD/../Core.h \
    $$PWD/../OptionEngine.h \
    $$PWD/../HelpDialog.h \
    $$PWD/../PluginsManager.h \
    $$PWD/../LanguagesManager.h \
    $$PWD/../DebugEngineMacro.h \
    $$PWD/../PluginInformation.h \
    $$PWD/../lib/qt-tar-xz/xz.h \
    $$PWD/../lib/qt-tar-xz/QXzDecodeThread.h \
    $$PWD/../lib/qt-tar-xz/QXzDecode.h \
    $$PWD/../lib/qt-tar-xz/QTarDecode.h \
    $$PWD/../SessionLoader.h \
    $$PWD/../ExtraSocket.h \
    $$PWD/../CopyListener.h \
    $$PWD/../CopyEngineManager.h \
    $$PWD/../PlatformMacro.h \
    $$PWD/../interface/PluginInterface_Themes.h \
    $$PWD/../interface/PluginInterface_SessionLoader.h \
    $$PWD/../interface/PluginInterface_Listener.h \
    $$PWD/../interface/PluginInterface_CopyEngine.h \
    $$PWD/../interface/OptionInterface.h \
    $$PWD/../Variable.h \
    $$PWD/../PluginLoader.h \
    $$PWD/../interface/PluginInterface_PluginLoader.h \
    $$PWD/../OptionDialog.h \
    $$PWD/../LocalPluginOptions.h \
    $$PWD/../LocalListener.h \
    $$PWD/../CliParser.h \
    $$PWD/../interface/FacilityInterface.h \
    $$PWD/../FacilityEngine.h \
    $$PWD/../LogThread.h \
    $$PWD/../CompilerInfo.h \
    $$PWD/../StructEnumDefinition_UltracopierSpecific.h \
    $$PWD/../OSSpecific.h \
    $$PWD/../cpp11addition.h \
    $$PWD/../InternetUpdater.h
SOURCES += $$PWD/../ThemesManager.cpp \
    $$PWD/../ResourcesManager.cpp \
    $$PWD/../main.cpp \
    $$PWD/../EventDispatcher.cpp \
    $$PWD/../SystrayIcon.cpp \
    $$PWD/../DebugEngine.cpp \
    $$PWD/../OptionEngine.cpp \
    $$PWD/../HelpDialog.cpp \
    $$PWD/../PluginsManager.cpp \
    $$PWD/../LanguagesManager.cpp \
    $$PWD/../PluginInformation.cpp \
    $$PWD/../lib/qt-tar-xz/QXzDecodeThread.cpp \
    $$PWD/../lib/qt-tar-xz/QXzDecode.cpp \
    $$PWD/../lib/qt-tar-xz/QTarDecode.cpp \
    $$PWD/../lib/qt-tar-xz/xz_crc32.c \
    $$PWD/../lib/qt-tar-xz/xz_dec_stream.c \
    $$PWD/../lib/qt-tar-xz/xz_dec_lzma2.c \
    $$PWD/../lib/qt-tar-xz/xz_dec_bcj.c \
    $$PWD/../SessionLoader.cpp \
    $$PWD/../ExtraSocket.cpp \
    $$PWD/../CopyListener.cpp \
    $$PWD/../CopyEngineManager.cpp \
    $$PWD/../Core.cpp \
    $$PWD/../PluginLoader.cpp \
    $$PWD/../OptionDialog.cpp \
    $$PWD/../LocalPluginOptions.cpp \
    $$PWD/../LocalListener.cpp \
    $$PWD/../CliParser.cpp \
    $$PWD/../FacilityEngine.cpp \
    $$PWD/../LogThread.cpp \
    $$PWD/../OSSpecific.cpp \
    $$PWD/../cpp11addition.cpp \
    $$PWD/../DebugModel.cpp \
    $$PWD/../InternetUpdater.cpp \
    $$PWD/../cpp11additionstringtointcpp.cpp
INCLUDEPATH += \
    $$PWD/../lib/qt-tar-xz/

OTHER_FILES += $$PWD/../resources/resources-windows.rc