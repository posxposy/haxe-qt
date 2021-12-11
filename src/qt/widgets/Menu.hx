package qt.widgets;

import cpp.RawPointer;
import cpp.Star;
import qt.core.QString;
import qt.gui.Action.QAction;
import qt.gui.Action;
import qt.widgets.Widget;

class Menu extends Widget {
	public function new(isSholdBeCreated:Bool = true) {
		if (isSholdBeCreated) {
			untyped __cpp__('_ref = {0}', QMenu.create());
		}
		super();
	}

	public function addAction(text:String):Action {
		final qStr = text.toQtString();
		final qAction = asMenu().addAction(qStr);
		final action = new Action(false);
		untyped __cpp__('{0}->_ref = {1}', action, qAction);
		return action;
	}

	public function addSeparator():Void {
		asMenu().addSeparator();
	}

	inline function asMenu():Star<QMenu> {
		return untyped __cpp__('static_cast<QMenu*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qmenu.h')
@:native('QMenu')
extern class QMenu extends QWidget {
	@:native('new QMenu')
	static function create():RawPointer<QMenu>;
	public function addAction(text:QString):Star<QAction>;
	public function addSeparator():Void;
}
