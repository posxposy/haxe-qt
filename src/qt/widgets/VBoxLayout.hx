package qt.widgets;

import cpp.Star;
import cpp.RawPointer;
import qt.widgets.BoxLayout.QBoxLayout;

class VBoxLayout extends BoxLayout {
	public function new() {
		untyped __cpp__('_ref = {0}', QVBoxLayout.create());
		super();
	}

	inline function asVBox():Star<QVBoxLayout> {
		return untyped __cpp__('static_cast<QVBoxLayout*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qboxlayout.h')
@:native('QVBoxLayout')
extern class QVBoxLayout extends QBoxLayout {
	@:native('new QVBoxLayout')
	static function create():RawPointer<QVBoxLayout>;
}
