package qt.widgets;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Star;
import qt.widgets.MenuBar;
import qt.widgets.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

@:headerCode('
#include <QtWidgets/qmainwindow.h>
')

class MainWindow extends Widget {
    public function new() {
        super();
        untyped __cpp__('_ref = {0}', QMainWindow.create());
    }
    
    public function menuBar():MenuBar {
        var m:MenuBar = new MenuBar();
        m.destroy();
        untyped __cpp__('
        {0}->_ref = {1}
        ', m, asMainWindow().menuBar());
        return m;
    }
    
    public function setCentralWidget(widget:Widget):Void {
        asMainWindow().setCentralWidget(untyped  __cpp__('{0}->_ref',widget));
    }

    private inline function asMainWindow():Star<QMainWindow> {
        return untyped __cpp__('static_cast<QMainWindow*>(_ref)');
    }
}

@:unreflective
@:include('QtWidgets/qmainwindow.h')
@:native('QMainWindow')
extern class QMainWindow extends QWidget
{
    @:native('new QMainWindow') public static function create():RawPointer<QMainWindow>;
    public function menuBar():Star<QMenuBar>;
    public function setCentralWidget(widget:Pointer<QWidget>):Void;
}