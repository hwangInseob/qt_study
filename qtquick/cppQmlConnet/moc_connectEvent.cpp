/****************************************************************************
** Meta object code from reading C++ file 'connectEvent.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "connectEvent.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'connectEvent.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ConnectEvent_t {
    QByteArrayData data[11];
    char stringdata0[130];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ConnectEvent_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ConnectEvent_t qt_meta_stringdata_ConnectEvent = {
    {
QT_MOC_LITERAL(0, 0, 12), // "ConnectEvent"
QT_MOC_LITERAL(1, 13, 17), // "cppSignalTestData"
QT_MOC_LITERAL(2, 31, 0), // ""
QT_MOC_LITERAL(3, 32, 3), // "var"
QT_MOC_LITERAL(4, 36, 17), // "cppSlotStringData"
QT_MOC_LITERAL(5, 54, 10), // "stringData"
QT_MOC_LITERAL(6, 65, 14), // "cppSlotIntData"
QT_MOC_LITERAL(7, 80, 7), // "intData"
QT_MOC_LITERAL(8, 88, 11), // "getInstance"
QT_MOC_LITERAL(9, 100, 13), // "ConnectEvent*"
QT_MOC_LITERAL(10, 114, 15) // "invokableMethod"

    },
    "ConnectEvent\0cppSignalTestData\0\0var\0"
    "cppSlotStringData\0stringData\0"
    "cppSlotIntData\0intData\0getInstance\0"
    "ConnectEvent*\0invokableMethod"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ConnectEvent[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    1,   42,    2, 0x0a /* Public */,
       6,    1,   45,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       8,    0,   48,    2, 0x02 /* Public */,
      10,    0,   49,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QVariant,    3,

 // slots: parameters
    QMetaType::Void, QMetaType::QVariant,    5,
    QMetaType::Void, QMetaType::QVariant,    7,

 // methods: parameters
    0x80000000 | 9,
    QMetaType::Void,

       0        // eod
};

void ConnectEvent::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ConnectEvent *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->cppSignalTestData((*reinterpret_cast< QVariant(*)>(_a[1]))); break;
        case 1: _t->cppSlotStringData((*reinterpret_cast< QVariant(*)>(_a[1]))); break;
        case 2: _t->cppSlotIntData((*reinterpret_cast< QVariant(*)>(_a[1]))); break;
        case 3: { ConnectEvent* _r = _t->getInstance();
            if (_a[0]) *reinterpret_cast< ConnectEvent**>(_a[0]) = std::move(_r); }  break;
        case 4: _t->invokableMethod(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ConnectEvent::*)(QVariant );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConnectEvent::cppSignalTestData)) {
                *result = 0;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject ConnectEvent::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_ConnectEvent.data,
    qt_meta_data_ConnectEvent,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ConnectEvent::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ConnectEvent::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ConnectEvent.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ConnectEvent::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void ConnectEvent::cppSignalTestData(QVariant _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
