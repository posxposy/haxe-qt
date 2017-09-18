package qt.widgets;
import cpp.Callable;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import cpp.Star;
import qt.core.QObject;
import qt.core.QString;
import qt.core.QStringTool;
import qt.widgets.QWidget.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
@:unreflective
@:include('QtWidgets/qpushbutton.h')
@:native('QPushButton')
extern class QPushButton extends QWidget
{
    @:native('new QPushButton') public static function create():RawPointer<QPushButton>;
    public function setText(value:Reference<QString>):Void;
    
    /* PUBLIC */
    public function autoDefault():Bool;
    public function setAutoDefault(value:Bool):Void;
    public function isDefault():Bool;
    public function setDefault(value:Bool):Void;
    
    public function setFlat(value:Bool):Void;
    public function isFlat():Bool;
    
    /*
    QSize sizeHint() const Q_DECL_OVERRIDE;
    QSize minimumSizeHint() const Q_DECL_OVERRIDE;
    
#ifndef QT_NO_MENU
    void setMenu(QMenu* menu);
    QMenu* menu() const;
#endif
    */
}

class PushButton extends Widget
{
    public inline function new()
    {
        super();
        ref = Pointer.fromRaw(QPushButton.create()).reinterpret();
    }
    
    public inline function setText(value:String):Void
    {
        var str:QString = QStringTool.fromString(value);
        var p:Pointer<QPushButton> = ref.reinterpret();
        p.ptr.setText(str);
    }
    
    public inline function autoDefault():Bool
    {
        var p:Pointer<QPushButton> = ref.reinterpret();
        return p.ptr.autoDefault();
    }
    
    public inline function setAutoDefault(value:Bool):Void
    {
        var p:Pointer<QPushButton> = ref.reinterpret();
        return p.ptr.setAutoDefault(value);
    }
    
    public inline function isDefault():Bool
    {
        var p:Pointer<QPushButton> = ref.reinterpret();
        return p.ptr.isDefault();
    }
    
    public inline function setDefault(value:Bool):Void
    {
        var p:Pointer<QPushButton> = ref.reinterpret();
        return p.ptr.setDefault(value);
    }
    
    public inline function isFlat():Bool
    {
        var p:Pointer<QPushButton> = ref.reinterpret();
        return p.ptr.isFlat();
    }
    
    public inline function setFlat(value:Bool):Void
    {
        var p:Pointer<QPushButton> = ref.reinterpret();
        return p.ptr.setFlat(value);
    }
    
    @:extern @:native('&QPushButton::clicked') public static function clicked():Callable<cpp.Void->cpp.Void> { return null; };
}