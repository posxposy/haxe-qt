package qt.widgets;
import cpp.RawPointer;
import cpp.Reference;
import cpp.Star;
import qt.core.Font;
import qt.core.Font.QFont;
import qt.core.QString;
import qt.core.QStringTool;
import qt.widgets.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
class Label extends Widget {
    public function new() {
        super();
        untyped __cpp__('_ref = {0}', QLabel.create());
    }
    
    public function setText(value:String):Void {
        var str:QString = QStringTool.fromString(value);
        asLabel().setText(str);
    }
    
    public function setFont(font:Font):Void {
        untyped __cpp__('
            static_cast<QLabel*>(_ref)->setFont({0})
        ', @:privateAccess font.ref.ref );
    }

    private inline function asLabel():Star<QLabel> {
        return untyped __cpp__('static_cast<QLabel*>(_ref)');
    }
}

@:unreflective
@:include('QtWidgets/qlabel.h')
@:native('QLabel')
extern class QLabel extends QWidget {
    @:native('new QLabel') public static function create():RawPointer<QLabel>;
    public function setText(value:Reference<QString>):Void;
    public function setFont(value:Reference<QFont>):Void;
}