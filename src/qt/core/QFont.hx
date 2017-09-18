package qt.core;
import cpp.Pointer;
import cpp.RawPointer;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
@:unreflective
@:include('QtGui/qfont.h')
@:native('QFont')
extern class QFont 
{
    
    @:native('new QFont') public static function create():RawPointer<QFont>;
    public function setBold(value:Bool):Void;
    public function setPointSize(value:Int):Void;
}

class Font
{
    private var ref:Pointer<QFont>;
    public inline function new():Void
    {
        ref = Pointer.fromRaw(QFont.create());
    }
    
    public inline function setBold(value:Bool):Void
    {
        ref.ptr.setBold(value);
        
    }
    
    public inline function setPointSize(value:Int):Void
    {
        ref.ptr.setPointSize(value);
    }
}