#include "tempClass.h"

tempClass::tempClass() :
  title("")
  ,buttonText("")
  ,information("")
{

}

tempClass::tempClass(const tempClass& rhs)
{
    this->title = rhs.title;
    this->buttonText = rhs.buttonText;
    this->information = rhs.information;
}

tempClass::~tempClass()
{

}

QString tempClass::getTitle()
{
    return title;
}

QString tempClass::getButtonText()
{
    return buttonText;
}

QString tempClass::getInformation()
{
    return information;
}

void tempClass::setTitle(QString title)
{
    this->title = title;
}

void tempClass::setButtonText(QString buttonText)
{
    this->buttonText = buttonText;
}

void tempClass::setInformation(QString information)
{
    this->information = information;
}
