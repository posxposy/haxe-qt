package qt.widgets;

import qt.core.Alignment;
import qt.widgets.Widget.QWidget;
import cpp.Star;
import qt.widgets.Layout.QLayout;
import cpp.RawPointer;

class GridLayout extends Layout {
	public function new() {
		untyped __cpp__('_ref = {0}', QGridLayout.create());
		super();
	}

	public function addWidget(widget:Widget, row:Int, column:Int, alignment:Alignment):Void {
		final qLayout = asGrid();
		final qWidget:Star<QWidget> = untyped __cpp__('static_cast<QWidget*>({0}->_ref)', widget);
		untyped __cpp__('{0}->addWidget({1}, {2}, {3}, {4})', qLayout, qWidget, row, column, alignment);
	}

	inline function asGrid():Star<QGridLayout> {
		return untyped __cpp__('static_cast<QGridLayout*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qgridlayout.h')
@:native('QGridLayout')
extern class QGridLayout extends QLayout {
	@:native('new QGridLayout')
	static function create():RawPointer<QGridLayout>;
	function addWidget(widget:Star<QWidget>, row:Int, column:Int, alignment:QAlignment):Void;
}
