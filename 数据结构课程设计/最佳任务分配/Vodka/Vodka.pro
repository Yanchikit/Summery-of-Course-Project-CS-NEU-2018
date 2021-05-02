#-------------------------------------------------
#
# Project created by QtCreator 2019-12-28T15:36:35
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Vodka
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    km.cpp \
    input.cpp \
    output.cpp

HEADERS  += mainwindow.h \
    km.h \
    input.h \
    output.h

FORMS    += mainwindow.ui \
    output.ui
CONFIG += C++11
