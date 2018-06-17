package qt.widgets;
import cpp.Star;
import cpp.Pointer;
import qt.core.Object;
import qt.core.Object.QObject;
import qt.core.QString;
import qt.core.QStringTool;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

class Application extends Object {
    public function new() {
        super();
        untyped __cpp__('
            char *argv[] = {NULL};
            int argc = sizeof(argv) / sizeof(char*) - 1;
            _ref = new QApplication(argc, argv);
        ');
    }
    
    public function setStyleSheet(value:String):Void {
        var str:QString = QStringTool.fromString(value);
        asApp().setStyleSheet(str);
    }
    
    public function exec():Void {
        asApp().exec();
    }

    private inline function asApp():Star<QApplication> {
        return untyped __cpp__('static_cast<QApplication*>(_ref)');
    }
    
    @:extern @:native('&QApplication::quit') public static function quit():Void {};
}

@:unreflective
@:include('QtWidgets/qapplication.h')
@:native('QApplication')
extern class QApplication extends QObject {
    public function setStyleSheet(style:QString):Void;
    public function exec():Void;
}