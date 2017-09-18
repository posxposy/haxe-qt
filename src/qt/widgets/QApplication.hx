package qt.widgets;
import cpp.Pointer;
import qt.core.QObject;
import qt.core.QString;
import qt.core.QStringTool;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
@:unreflective
@:include('QtWidgets/qapplication.h')
@:native('QApplication')
extern class QApplication extends QObject
{
    //@:native('new QApplication') public static function create():Pointer<QApplication>;
    public function setStyleSheet(style:QString):Void;
    public function exec():Void;
}

class Application extends HaxeQObject
{
    public inline function new()
    {
        super();
        untyped __cpp__('char *argv[] = {NULL};');
        untyped __cpp__('int argc = sizeof(argv) / sizeof(char*) - 1;');
        ref = untyped __cpp__('new QApplication(argc, argv)');
    }
    
    public inline function setStyleSheet(value:String):Void
    {
        var str:QString = QStringTool.fromString(value);
        var p:Pointer<QApplication> = ref.reinterpret();
        p.ptr.setStyleSheet(str);
    }
    
    public inline function exec():Void
    {
        var p:Pointer<QApplication> = ref.reinterpret();
        p.ptr.exec();
    }
    
    @:extern @:native('&QApplication::quit') public static function quit():Void {};
}