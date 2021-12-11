package qt.widgets;

import cpp.Star;
import cpp.RawPointer;
import qt.widgets.BoxLayout.QBoxLayout;

class HBoxLayout extends BoxLayout {
	public function new() {
		untyped __cpp__('_ref = {0}', QHBoxLayout.create());
		super();
	}

	inline function asVBox():Star<QHBoxLayout> {
		return untyped __cpp__('static_cast<QHBoxLayout*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qboxlayout.h')
@:native('QHBoxLayout')
extern class QHBoxLayout extends QBoxLayout {
	@:native('new QHBoxLayout')
	static function create():RawPointer<QHBoxLayout>;
}
