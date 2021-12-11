package qt.widgets;

import cpp.RawPointer;
import cpp.Star;
import qt.core.QString;
import qt.widgets.Menu;
import qt.widgets.Widget;

class MenuBar extends Widget {
	public function new(isShouldBeCreated:Bool = true) {
		if (isShouldBeCreated) {
			untyped __cpp__('_ref = {0}', QMenuBar.create());
		}
		super();
	}

	public function addMenu(value:String):Menu {
		final qStr = value.toQtString();
		final qMenu = asMenuBar().addMenu(qStr);
		final menu = new Menu(false);
		untyped __cpp__('{0}->_ref = {1}', menu, qMenu);
		return menu;
	}

	private inline function asMenuBar():Star<QMenuBar> {
		return untyped __cpp__('static_cast<QMenuBar*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qmenubar.h')
@:native('QMenuBar')
extern class QMenuBar extends QWidget {
	@:native('new QMenuBar')
	static function create():RawPointer<QMenuBar>;
	function addMenu(value:QString):Star<QMenu>;
}
