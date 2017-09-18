package qt.core;
import cpp.ArrayBase;
import cpp.Callable;
import cpp.ConstCharStar;
import cpp.Finalizable;
import cpp.Function;
import cpp.Object;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QObject.HaxeQObject;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
@:unreflective
@:include('QtCore/qobject.h')
@:native('QObject')
extern class QObject 
{
    @:native('QObject::connect') public static function connect(sender:Pointer<QObject>, signal:Callable<cpp.Void->cpp.Void>, receiver:Pointer<QObject>, member:Callable<cpp.Void->cpp.Void>):Void;
    
    public function setObjectName(name:QString):Void;
}

class HaxeQObject
{
    private var ref:Pointer<QObject>;
    
    public inline function new():Void
    {
        
    }
    
    public inline function setObjectName(name:String):Void
    {
        var str:QString = QStringTool.fromString(name);
        ref.ptr.setObjectName(str);
    }
    
    /*@:macro
    public function connect(sender:HObject, signal:Callable<cpp.Void->cpp.Void>, receiver:HObject, member:Void->Void):Void
    {
        //var _signal:ConstCharStar = ConstCharStar.fromString(signal);
        //var _member:ConstCharStar = ConstCharStar.fromString(member);
        
        //var o = untyped __cpp__ ('Qt::AutoConnection');
        //ref.ptr.connect(sender.ref, _signal, receiver.ref, _member, o);
        //untyped __cpp__('  ref->ptr->connect(sender->ref, signal, receiver->ref, _member, Qt::AutoConnection) ');
        untyped __cpp__('QObject::connect(sender->ref, SIGNAL(signal()), receiver->ref, SLOT(member), Qt::AutoConnection) ');
        //QObject.connect(sender.ref, signal, receiver.ref, member);
    }*/
    
    public function destroy():Void 
    {
        if (ref != null) {
            ref.destroy();
            ref = null;
        }
    }
}