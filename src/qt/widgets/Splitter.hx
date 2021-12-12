package qt.widgets;

import qt.core.QLists.QIntList;
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

	public function setSizes(sizes:Array<Int>):Void {
		final list = QIntList.make();
		for (size in sizes) {
			list.pushBack(size);
		}
		asSplitter().setSizes(list);
	}

	public function setStretchFactor(index:Int, stretch:Int):Void {
		asSplitter().setStretchFactor(index, stretch);
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
	function setSizes(list:QIntList):Void;
	function setStretchFactor(index:Int, stretch:Int):Void;
}
