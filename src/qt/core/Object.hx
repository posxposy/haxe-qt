package qt.core;
import cpp.RawPointer;
import cpp.Callable;
import cpp.Pointer;
import cpp.Star;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
@:headerCode('
#include <QtCore/qobject.h>
')
@:headerClassCode('
    QObject *_ref;
')

class Object {
    public function new():Void {
        
    }
    
    public function setObjectName(name:String):Void {
        var str:QString = QStringTool.fromString(name);
        untyped  __cpp__('_ref->setObjectName({0})', str);
    }
    
    public function destroy():Void {
        untyped __cpp__('delete _ref');
    }
}

@:unreflective
@:include('QtCore/qobject.h')
@:native('QObject')
extern class QObject {
    public function setObjectName(name:QString):Void;
}
