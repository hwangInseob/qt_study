#ifndef TEMPCLASS_H
#define TEMPCLASS_H

#include <QObject>

class tempClass : public QObject
{
    Q_OBJECT;
public:
    tempClass(QObject *parent = nullptr);
    tempClass(const tempClass& rhs);
    ~tempClass();

    QString getTitle();
    QString getButtonText();
    QString getInformation();

    void setTitle(QString title);
    void setButtonText(QString buttonText);
    void setInformation(QString information);
private:
    QString title;
    QString buttonText;
    QString information;
signals:

};

#endif // TEMPCLASS_H
