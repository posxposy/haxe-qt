package qt.widgets;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Star;
import qt.core.QString;
import qt.core.QStringTool;
import qt.widgets.Menu;
import qt.widgets.Widget;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

class MenuBar extends Widget {
    public function new() {
        super();
        untyped __cpp__('_ref = {0}', QMenuBar.create());
    }
    
    public function addMenu(value:String):Menu {
        var str:QString = QStringTool.fromString(value);
        return Menu.fromStar( asMenuBar().addMenu(str) );
    }

    private inline function asMenuBar():Star<QMenuBar> {
        return untyped __cpp__('static_cast<QMenuBar*>(_ref)');
    }
}

@:unreflective
@:include('QtWidgets/qmenubar.h')
@:native('QMenuBar')
extern class QMenuBar extends QWidget {
    @:native('new QMenuBar') public static function create():RawPointer<QMenuBar>;
    public function addMenu(value:QString):Star<QMenu>;

/**
    QAction *addMenu(QMenu *menu);
    QMenu *addMenu(const QString &title);
    QMenu *addMenu(const QIcon &icon, const QString &title);
 */
}