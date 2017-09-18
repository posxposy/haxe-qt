package qt.widgets;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QFont;
import qt.core.QFont.Font;
import qt.core.QString;
import qt.core.QStringTool;
import qt.widgets.QWidget.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

@:unreflective
@:include('QtWidgets/qlabel.h')
@:native('QLabel')
extern class QLabel extends QWidget
{
    @:native('new QLabel') public static function create():RawPointer<QLabel>;
    public function setText(value:Reference<QString>):Void;
    public function setFont(value:Reference<QFont>):Void;
}

class Label extends Widget
{
    public inline function new()
    {
        super();
        ref = Pointer.fromRaw(QLabel.create()).reinterpret();
    }
    
    public inline function setText(value:String):Void
    {
        var str:QString = QStringTool.fromString(value);
        var p:Pointer<QLabel> = ref.reinterpret();
        p.ptr.setText(str);
    }
    
    public inline function setFont(font:Font):Void
    {
        var p:Pointer<QLabel> = ref.reinterpret();
        var r:Reference<QFont> = @:privateAccess font.ref.ref;
        p.ptr.setFont(r);
    }
}