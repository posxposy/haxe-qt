package qt.widgets;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Star;
import qt.core.Object;
import qt.core.QString;
import qt.core.QStringTool;
import qt.widgets.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

class Menu extends Widget {
    public function new() {
        super();
        untyped __cpp__('_ref = {0}', QMenu.create());
    }

    public static inline function fromStar(s:Star<QMenu>):Menu {
        var m:Menu = new Menu();
        m.destroy();
        untyped __cpp__('{0}->_ref = s', m, s);
        return m;
    }
    
    public function addAction(text:String):Void {
        var str:QString = QStringTool.fromString(text);
        asMenu().addAction(str);
    }
    
    public function addSeparator():Void {
        asMenu().addSeparator();
    }

    private inline function asMenu():Star<QMenu> {
        return untyped __cpp__('static_cast<QMenu*>(_ref)');
    }
}

@:unreflective
@:include('QtWidgets/qmenu.h')
@:native('QMenu')
extern class QMenu extends QWidget {
    
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