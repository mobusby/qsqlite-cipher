// Based on QtSources/4.7.4/src/plugins/sqldrivers/sqlite/smain.cpp

#include <qsqldriverplugin.h>
#include <qstringlist.h>
#include "driver/qsql_sqlite-cipher.h"
 
QT_BEGIN_NAMESPACE
 
class QSQLiteCipherDriverPlugin : public QSqlDriverPlugin
{
public:
    QSQLiteCipherDriverPlugin();
 
    QSqlDriver* create(const QString &);
    QStringList keys() const;
};
 
QSQLiteCipherDriverPlugin::QSQLiteCipherDriverPlugin()
    : QSqlDriverPlugin()
{
}
 
QSqlDriver* QSQLiteCipherDriverPlugin::create(const QString &name)
{
    if (name == QLatin1String("QSQLITECIPHER")) {
        QSQLiteDriver* driver = new QSQLiteDriver();
        return driver;
    }
    return 0;
}
 
QStringList QSQLiteCipherDriverPlugin::keys() const
{
    QStringList l;
    l  << QLatin1String("QSQLITECIPHER");
    return l;
}
 
Q_EXPORT_STATIC_PLUGIN(QSQLiteCipherDriverPlugin)
Q_EXPORT_PLUGIN2(qsqlite, QSQLiteCipherDriverPlugin)
 
QT_END_NAMESPACE

