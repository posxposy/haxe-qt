package qt.widgets;
import cpp.Pointer;
import cpp.RawPointer;
import qt.core.QObject.HaxeQObject;
import qt.core.QString;
import qt.core.QStringTool;
import qt.widgets.QWidget.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

@:unreflective
@:include('QtWidgets/qmenu.h')
@:native('QMenu')
extern class QMenu extends QWidget
{
    
    @:native('new QMenu') public static function create():RawPointer<QMenu>;
    
    /* PUBLIC */
    public function addAction(text:QString):Pointer<QAction>;
    public function addSeparator():Void;
    /*
    using QWidget::addAction;
    QAction *addAction(const QString &text);
    QAction *addAction(const QIcon &icon, const QString &text);
    QAction *addAction(const QString &text, const QObject *receiver, const char* member, const QKeySequence &shortcut = 0);
    QAction *addAction(const QIcon &icon, const QString &text, const QObject *receiver, const char* member, const QKeySequence &shortcut = 0);
    */
}

class Menu extends Widget
{
    public inline function new()
    {
        super();
        ref = Pointer.fromRaw(QMenu.create()).reinterpret();
    }
    
    public inline function addAction(text:String):Void
    {
        var str:QString = QStringTool.fromString(text);
        var p:Pointer<QMenu> = ref.reinterpret();
        p.ptr.addAction(str);
    }
    
    public inline function addSeparator():Void
    {
        var p:Pointer<QMenu> = ref.reinterpret();
        p.ptr.addSeparator();
    }
}