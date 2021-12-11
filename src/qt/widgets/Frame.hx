package qt.widgets;

import cpp.RawPointer;
import qt.widgets.Widget.QWidget;

class Frame extends Widget {
	public function new() {
		untyped __cpp__('
			if (_ref == nullptr) {
				_ref = {0};
			}
			', QFrame.create());

		super();
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qframe.h')
@:native('QFrame')
extern class QFrame extends QWidget {
	@:native('new QFrame')
	static function create():RawPointer<QFrame>;
}
