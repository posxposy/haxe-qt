package qt.core;
import cpp.Pointer;
import cpp.RawPointer;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

class Font {
    private var ref:Pointer<QFont>;
    public function new():Void {
        ref = Pointer.fromRaw(QFont.create());
    }
    
    public function setBold(value:Bool):Void {
        ref.ptr.setBold(value);
        
    }
    
    public function setPointSize(value:Int):Void {
        ref.ptr.setPointSize(value);
    }

    public function destroy() {
        ref.destroy();
        ref = null;
    }
}

@:unreflective
@:include('QtGui/qfont.h')
@:native('QFont')
extern class QFont {
    @:native('new QFont') public static function create():RawPointer<QFont>;
    public function setBold(value:Bool):Void;
    public function setPointSize(value:Int):Void;
}