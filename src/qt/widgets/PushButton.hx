package qt.widgets;

import cpp.RawPointer;
import cpp.Star;
import qt.core.QString;
import qt.widgets.Widget;
import qt.core.QStringTools;

class PushButton extends Widget {
	public var text(get, never):String;

	public function new() {
		untyped __cpp__('_ref = {0}', QPushButton.create());
		super();
	}

	public function setText(value:String):Void {
		final str = QStringTools.toQtString(value);
		asButton().setText(str);
	}

	public function clicked(cb:(checked:Bool) -> Void):Void {
		untyped __cpp__('
			QObject::connect(static_cast<QPushButton*>(_ref), 	&QPushButton::clicked, {0})
		', cb);
	}

	inline function asButton():Star<QPushButton> {
		return untyped __cpp__('static_cast<QPushButton*>({0}->_ref)', this);
	}

	function get_text():String {
		return asButton().text().toHaxeString();
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qpushbutton.h')
@:native('QPushButton')
extern class QPushButton extends QAbstractButton {
	@:native('new QPushButton')
	static function create():RawPointer<QPushButton>;
}

@:publicFields
@:unreflective
@:include('QtWidgets/qabstractbutton.h')
@:native('QAbstractButton')
extern class QAbstractButton extends QWidget {
	function setText(value:QString):Void;
	function text():QString;
}
