# Based on QtSources/4.7.4/src/sql/drivers/sqlite/qsql_sqlite.pri

HEADERS += $$PWD/qsql_sqlite-cipher.h
SOURCES += $$PWD/qsql_sqlite-cipher.cpp

# set this to the path to libsqlite3-cipher.so.0 (ex: /usr/lib)
SQLCIPHER_LIB_PATH=$$PWD/lib

!system-sqlite:!contains(LIBS, .*sqlite.*) {
    message('Not using system sqlite, which is a good thing.')
    CONFIG(release, debug|release):DEFINES *= NDEBUG
    DEFINES += SQLITE_OMIT_LOAD_EXTENSION SQLITE_OMIT_COMPLETE SQLITE_HAS_CODEC
    INCLUDEPATH += $$PWD/include
    LIBS += -Wl,-rpath -Wl,$$SQLCIPHER_LIB_PATH -L$$SQLCIPHER_LIB_PATH -lsqlite3-cipher -lcrypto
    QMAKE_RPATHDIR += $$SQLCIPHER_LIB_PATH
} else {
    message('Something went wrong, we are using the system sqlite.')
    LIBS *= $$QT_LFLAGS_SQLITE
    QMAKE_CXXFLAGS *= $$QT_CFLAGS_SQLITE
}

# In order to use libqsqlite-cipher you may have to add the propper
# LIBDIR (of libsqlite3-cipher) to the `LD_LIBRARY_PATH' environment 
# variable prior to launching your app.
