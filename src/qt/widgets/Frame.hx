package qt.widgets;

import cpp.RawPointer;
import qt.widgets.Widget;

class Frame extends Widget {
	public function new() {
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
