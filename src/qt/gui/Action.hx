package qt.gui;

import cpp.Star;
import cpp.RawPointer;
import qt.core.Object.QObject;
import qt.core.Object;

class Action extends Object {
	public function new(isSholdBeCreated:Bool = true) {
		if (isSholdBeCreated) {
			untyped __cpp__('this->_ref = {0}', QAction.create());
		}
		super();
	}

	public function triggered(trigger:(checked:Bool) -> Void):Void {
		untyped __cpp__('
			QObject::connect(static_cast<QAction*>(_ref), &QAction::triggered, {0})
		', trigger);
	}

	public function setEnabled(enabled:Bool):Void {
		asAction().setEnabled(enabled);
	}

	inline function asAction():Star<QAction> {
		return untyped __cpp__('static_cast<QAction*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtGui/qaction.h')
@:native('QAction')
extern class QAction extends QObject {
	@:native('new QAction')
	static function create():RawPointer<QAction>;

	function setEnabled(enabled:Bool):Void;
}
