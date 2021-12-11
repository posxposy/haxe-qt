package qt.widgets;

import qt.core.Object;
import qt.widgets.Widget.QWidget;
import qt.core.Object.QObject;
import cpp.Star;

class Layout extends Object {
	public function new() {
		super();
	}

	public function removeWidget(widget:Widget):Void {
		final qLayout = asLayout();
		final qWidget:Star<QWidget> = untyped __cpp__('static_cast<QWidget*>({0}->_ref)', widget);
		untyped __cpp__('{0}->removeWidget({1})', qLayout, qWidget);
	}

	inline function asLayout():Star<QLayout> {
		return untyped __cpp__('static_cast<QLayout*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qlayout.h')
@:native('QLayout')
extern class QLayout extends QObject {
	function setEnabled(enable:Bool):Void;
	function removeWidget(widget:Star<QWidget>):Void;
}
