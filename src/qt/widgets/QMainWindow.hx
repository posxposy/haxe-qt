package qt.widgets;
import cpp.Pointer;
import cpp.RawPointer;
import qt.widgets.QMenuBar.MenuBar;
import qt.widgets.QWidget.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

@:unreflective
@:include('QtWidgets/qmainwindow.h')
@:native('QMainWindow')
extern class QMainWindow extends QWidget
{
    @:native('new QMainWindow') public static function create():RawPointer<QMainWindow>;
    public function menuBar():Pointer<QMenuBar>;
    public function setCentralWidget(widget:Pointer<QWidget>):Void;
}

class MainWindow extends Widget
{
    public inline function new()
    {
        super();
        ref = Pointer.fromRaw(QMainWindow.create()).reinterpret();
    }
    
    public function menuBar():MenuBar
    {
        var p:Pointer<QMainWindow> = ref.reinterpret();
        var mbPtr:Pointer<QMenuBar> = p.ptr.menuBar();
        var mb:MenuBar = new MenuBar();
        mb.ref = mbPtr.reinterpret();
        return mb;
    }
    
    public function setCentralWidget(widget:Widget):Void
    {
        var p:Pointer<QMainWindow> = ref.reinterpret();
        var p2:Pointer<QWidget> = widget.ref.reinterpret();
        p.ptr.setCentralWidget( p2 );
    }
}