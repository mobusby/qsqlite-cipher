# Build qsqlcipher plugin and driver for Qt, 
# based on the default sqlite plugin and driver

# based on QtSources/4.7.4/src/plugins/sqldrivers/sqlite/sqlite.pro
TARGET = qsqlite-cipher
SOURCES = smain.cpp
OTHER_FILES += README Makefile.in.patch sqlite3.pc.in.patch
include($$PWD/driver/qsql_sqlite-cipher.pri)

# based on QtSources/4.7.4/src/plugins/sqldrivers/qsqldriverbase.pri
QT = core sql
DEFINES += QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

# based on QtSources/4.7.4/src/plugins/qpluginbase.pri
TEMPLATE = lib
CONFIG += qt plugin
win32|mac:!wince*:!win32-msvc:!macx-xcode:CONFIG += debug_and_release
TARGET = $$qtLibraryTarget($$TARGET)
contains(QT_CONFIG, reduce_exports):CONFIG += hide_symbols

target.path=$$PWD/test/qtplugins/sqldrivers
INSTALLS += target

message("TARGET: $$TARGET")
message("TEMPLATE: $$TEMPLATE")
message("SOURCES: $$SOURCES")
message("HEADERS: $$HEADERS")
message("QT: $$QT")
message("CONFIG: $$CONFIG")
message("INCLUDEPATH: $$INCLUDEPATH")
message("LIBS: $$LIBS")
message("QMAKE_RPATHDIR: $$QMAKE_RPATHDIR")
message("DEFINES: $$DEFINES")
message("INSTALLS: $$INSTALLS")

