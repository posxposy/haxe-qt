package qt.widgets;

import cpp.RawPointer;
import cpp.Star;
import qt.widgets.Widget.QWidget;

class Dialog extends Widget {
	public function new() {
		untyped __cpp__('_ref = {0}', QDialog.create());
		super();
	}

	public function setModal(modal:Bool):Void {
		asDialog().setModal(modal);
	}

	public function exec():Void {
		asDialog().exec();
	}

	inline function asDialog():Star<QDialog> {
		return untyped __cpp__('static_cast<QDialog*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qdialog.h')
@:native('QDialog')
extern class QDialog extends QWidget {
	@:native('new QDialog')
	static function create():RawPointer<QDialog>;

	function setModal(modal:Bool):Void;
	function exec():Void;
}
