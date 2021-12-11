package qt.widgets;

import cpp.RawPointer;
import cpp.Star;
import qt.widgets.Frame.QFrame;
import qt.widgets.Widget.QWidget;

class Splitter extends Frame {
	public function new() {
		untyped __cpp__('_ref = {0}', QSplitter.create());
		super();
	}

	public function addWidget(widget:Widget):Void {
		final qSplitter = asSplitter();
		final qWidget:Star<QWidget> = untyped __cpp__('static_cast<QWidget*>({0}->_ref)', widget);
		untyped __cpp__('{0}->addWidget({1})', qSplitter, qWidget);
	}

	inline function asSplitter():Star<QSplitter> {
		return untyped __cpp__('static_cast<QSplitter*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qsplitter.h')
@:native('QSplitter')
extern class QSplitter extends QFrame {
	@:native('new QSplitter')
	static function create():RawPointer<QSplitter>;
	function addWidget(widget:Star<QWidget>):Void;
}
