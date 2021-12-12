package qt.widgets;

import qt.core.Alignment;
import qt.core.Alignment.QAlignment;
import cpp.Star;
import qt.widgets.Layout.QLayout;
import qt.widgets.Widget.QWidget;

class BoxLayout extends Layout {
	public function new() {
		super();
	}

	public function addWidget(widget:Widget, alignment:Alignment, stretch:Int = 0):Void {
		final qLayout = asBox();
		final qWidget:Star<QWidget> = untyped __cpp__('static_cast<QWidget*>({0}->_ref)', widget);
		untyped __cpp__('{0}->addWidget({1}, {2}, {3})', qLayout, qWidget, stretch, alignment);
	}

	public function addStretch(stretch:Int = 0):Void {
		asBox().addStretch(stretch);
	}

	public function setStretch(index:Int, stretch:Int):Void {
		asBox().setStretch(index, stretch);
	}

	inline function asBox():Star<QBoxLayout> {
		return untyped __cpp__('static_cast<QBoxLayout*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qboxlayout.h')
@:native('QBoxLayout')
extern class QBoxLayout extends QLayout {
	function addStretch(stretch:Int):Void;
	function addWidget(widget:Star<QWidget>, stretch:Int, alignment:QAlignment):Void;
	function setStretch(index:Int, stretch:Int):Void;
}
