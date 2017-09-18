package qt.widgets;
import cpp.ConstCharStar;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QObject;
import qt.core.QString;
import qt.core.QStringTool;
import qt.widgets.QWidget.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

@:unreflective
@:include('QtWidgets/qwidget.h')
@:native('QWidget')
extern class QWidget extends QObject
{
    @:native('new QWidget') public static function create():RawPointer<QWidget>;
    public function show():Void;
    public function resize(width:Int, height:Int):Void;
    public function setWindowTitle(value:Reference<QString>):Void;
    public function setToolTip(value:Reference<QString>):Void;
    public function setParent(parent:Pointer<QWidget>):Void;
    public function setGeometry(x:Int, y:Int, width:Int, height:Int):Void;
}

class Widget extends HaxeQObject
{
    public inline function new():Void
    {
        super();
        ref = Pointer.fromRaw(QWidget.create()).reinterpret();
    }
    
    public inline function resize(width:Int, height:Int):Void
    {
        var p:Pointer<QWidget> = ref.reinterpret();
        p.ptr.resize(width, height);
    }
    
    public inline function show():Void
    {
        var p:Pointer<QWidget> = ref.reinterpret();
        p.ptr.show();
    }
    
    public inline function setWindowTitle(value:String):Void
    {
        var str:QString = QStringTool.fromString(value);
        var p:Pointer<QWidget> = ref.reinterpret();
        p.ptr.setWindowTitle(str);
    }
    
    public inline function setToolTip(value:String):Void
    {
        var str:QString = QStringTool.fromString(value);
        var p:Pointer<QWidget> = ref.reinterpret();
        p.ptr.setToolTip(str);
    }
    
    public inline function setParent(parent:Widget):Void
    {
        var p:Pointer<QWidget> = ref.reinterpret();
        p.ptr.setParent( @:privateAccess parent.ref.reinterpret() );
    }
    
    public inline function setGeometry(x:Int, y:Int, width:Int, height:Int):Void
    {
        var p:Pointer<QWidget> = ref.reinterpret();
        p.ptr.setGeometry(x, y, width, height);
    }
}