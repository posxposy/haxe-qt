package qt.widgets;
import cpp.Pointer;
import cpp.RawPointer;
import qt.core.QString;
import qt.core.QStringTool;
import qt.widgets.QMenu.Menu;
import qt.widgets.QWidget.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
@:unreflective
@:include('QtWidgets/qmenubar.h')
@:native('QMenuBar')
extern class QMenuBar extends QWidget
{
    @:native('new QMenuBar') public static function create():RawPointer<QMenuBar>;
    public function addMenu(value:QString):Pointer<QMenu>;
}

class MenuBar extends Widget
{
    public inline function new()
    {
        super();
        ref = Pointer.fromRaw(QMenuBar.create()).reinterpret();
    }
    
    public inline function addMenu(value:String):Menu
    {
        var str:QString = QStringTool.fromString(value);
        var p:Pointer<QMenuBar> = ref.reinterpret();
        var mPtr:Pointer<QMenu> = p.ptr.addMenu(str);
        var m:Menu = new Menu();
        m.ref = mPtr.reinterpret();
        return m;
        
        /*var menu:Menu = new Menu();
        
        var p:Pointer<QMenuBar> = ref.reinterpret();
        
        var menuPtr:Pointer<QMenu> = p.ptr.addMenu(str);
        menu.ref = menuPtr.reinterpret();
        return menu;*/
        //return null;
    }
}