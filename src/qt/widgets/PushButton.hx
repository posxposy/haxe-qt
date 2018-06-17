package qt.widgets;
import cpp.Callable;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import cpp.Star;
import qt.core.Object;
import qt.core.QString;
import qt.core.QStringTool;
import qt.widgets.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

class PushButton extends Widget {
    private var callbacks:Array<Void->Void> = [];
    
    public function new() {
        super();
        untyped __cpp__('_ref = {0}', QPushButton.create());
        untyped __cpp__ ('
        QObject::connect(
            static_cast<QPushButton*>(_ref),
            &QPushButton::clicked, [=]() {
                {0}();
            }
        )', untyped clickHandler);
    }
    
    public function setText(value:String):Void {
        var str:QString = QStringTool.fromString(value);
        asButton().setText(str);
    }
    
    public function autoDefault():Bool {
        return asButton().autoDefault();
    }
    
    public function setAutoDefault(value:Bool):Void {
        asButton().setAutoDefault(value);
    }
    
    public function isDefault():Bool {
        return asButton().isDefault();
    }
    
    public function setDefault(value:Bool):Void {
        asButton().setDefault(value);
    }
    
    public function isFlat():Bool {
        return asButton().isFlat();
    }
    
    public function setFlat(value:Bool):Void {
        asButton().setFlat(value);
    }
    
    public function clicked(cb:Void->Void):Void {
        callbacks.push(cb);
    }

    private function clickHandler():Void {
        for (cb in callbacks) {
            cb();
        }
    }

    public override function destroy():Void {
        super.destroy();
        while (callbacks.length > 0) {
            callbacks.pop();
        }
        callbacks = null;
    }

    private inline function asButton():Star<QPushButton> {
        return untyped __cpp__('static_cast<QPushButton*>(_ref)');
    }
}

@:unreflective
@:include('QtWidgets/qpushbutton.h')
@:native('QPushButton')
extern class QPushButton extends QWidget {
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