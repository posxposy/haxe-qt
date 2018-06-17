package qt.widgets;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import cpp.Star;
import qt.core.Object;
import qt.core.QString;
import qt.core.QStringTool;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

class Widget extends Object {
    public function new():Void {
        super();
        untyped __cpp__('_ref = {0}', QWidget.create());
    }
    
    public function resize(width:Int, height:Int):Void {
        asWidget().resize(width, height);
    }
    
    public function show():Void {
        asWidget().show();
    }
    
    public function setWindowTitle(value:String):Void {
        var str:QString = QStringTool.fromString(value);
        asWidget().setWindowTitle(str);
    }
    
    public function setToolTip(value:String):Void {
        var str:QString = QStringTool.fromString(value);
        asWidget().setToolTip(str);
    }
    
    public function setParent(parent:Widget):Void {
        untyped __cpp__('
            QWidget* p = static_cast<QWidget*>({0}->_ref);
            static_cast<QWidget*>(_ref)->setParent(p)
        ', parent);
    }
    
    public function setGeometry(x:Int, y:Int, width:Int, height:Int):Void {
        asWidget().setGeometry(x, y, width, height);
    }

    private inline function asWidget():Star<QWidget> {
        return untyped __cpp__('static_cast<QWidget*>(_ref)');
    }
}

@:unreflective
@:include('QtWidgets/qwidget.h')
@:native('QWidget')
extern class QWidget extends QObject {
    @:native('new QWidget') public static function create():RawPointer<QWidget>;
    public function show():Void;
    public function resize(width:Int, height:Int):Void;
    public function setWindowTitle(value:Reference<QString>):Void;
    public function setToolTip(value:Reference<QString>):Void;
    public function setParent(parent:Star<QWidget>):Void;
    public function setGeometry(x:Int, y:Int, width:Int, height:Int):Void;
}