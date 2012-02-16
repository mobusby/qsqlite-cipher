#!/bin/bash

QSQLPATH=$1
SQLCPATH=$2

echo "sqlcipher is in $SQLCPATH"
echo "qsqlcipher is in $QSQLPATH"
echo "If either of these is not correct, press [ctrl]+[C] now and try again."
echo "Otherwise, press [enter] to continue building sqlite3-cipher."
read dummy

cd $SQLCPATH 
patch -p 0 < $QSQLPATH/Makefile.in.patch
patch -p 0 < $QSQLPATH/sqlite3.pc.in.patch
./configure --enable-tempstore=yes --disable-tcl CFLAGS="-DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2" LDFLAGS="-lcrypto" --prefix="$QSQLPATH/driver"
make
make install

echo "sqlite3-cipher is built and installed."
echo "Press [enter] to continue building qsqlite-cipher."
read dummy

cd $QSQLPATH
qmake
make
make install

echo "qsqlite-cipher is built."
echo "Press [enter] to continue building the test application."
read dummy

cd $QSQLPATH/test
qmake
make

echo "The test program has been built and is ready to run."
echo "All done."


