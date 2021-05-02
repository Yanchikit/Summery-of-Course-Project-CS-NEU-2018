#-------------------------------------------------
#
# Project created by QtCreator 2019-12-25T14:47:16
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = wula
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    outtest.cpp \
    all.cpp

HEADERS  += mainwindow.h \
    all.h \
    outtest.h

FORMS    += mainwindow.ui \
    outtest.ui
CONFIG += C++11
