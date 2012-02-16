# test program for qsqlcipher

TARGET = qsqlitecipher-test
TEMPLATE = app
HEADERS += connection.h customsqlmodel.h editablesqlmodel.h
SOURCES += main.cpp editablesqlmodel.cpp customsqlmodel.cpp

# include Qt sql support
QT += sql

# defines required by sqlcipher
DEFINES += SQLITE_HAS_CODEC "SQLITE_TEMP_STORE=2"

