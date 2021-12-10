package qt.widgets;

import qt.widgets.Frame.QFrame;
import cpp.RawPointer;
import cpp.Star;
import qt.core.QString;
import qt.gui.Font;

class Label extends Frame {
	public function new() {
		untyped __cpp__('_ref = {0}', QLabel.create());
		super();
	}

	public function setText(value:String):Void {
		final str = value.toQtString();
		asLabel().setText(str);
	}

	public function setFont(font:Font):Void {
		final fontRef = @:privateAccess font.ref.ref;
		untyped __cpp__('static_cast<QLabel*>(_ref)->setFont({0})', fontRef);
	}

	inline function asLabel():Star<QLabel> {
		return untyped __cpp__('static_cast<QLabel*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qlabel.h')
@:native('QLabel')
extern class QLabel extends QFrame {
	@:native('new QLabel')
	static function create():RawPointer<QLabel>;
	function setText(value:QString):Void;
	function setFont(value:QFont):Void;
}
