package qt.widgets;

import qt.core.QString;
import qt.widgets.Widget.QWidget;
import cpp.RawPointer;
import cpp.Star;

class TabWidget extends Widget {
	public function new() {
		untyped __cpp__('_ref = {0}', QTabWidget.create());
		super();
	}

	public function addTab(widget:Widget, label:String):Int {
		final qStr = label.toQtString();
		final qTab = asTab();
		final qWidget:Star<QWidget> = untyped __cpp__('static_cast<QWidget*>({0}->_ref)', widget);
		return untyped __cpp__('{0}->addTab({1}, {2})', qTab, qWidget, qStr);
	}

	public function setMovable(movable:Bool):Void {
		asTab().setMovable(movable);
	}

	public function removeTab(index:Int):Void {
		asTab().removeTab(index);
	}

	public function setTabsClosable(closeable:Bool):Void {
		asTab().setTabsClosable(closeable);
	}

	public function setUsesScrollButtons(useButtons:Bool):Void {
		asTab().setUsesScrollButtons(useButtons);
	}

	public function clear():Void {
		asTab().clear();
	}

	inline function asTab():Star<QTabWidget> {
		return untyped __cpp__('static_cast<QTabWidget*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qtabwidget.h')
@:native('QTabWidget')
extern class QTabWidget extends QWidget {
	@:native('new QTabWidget')
	static function create():RawPointer<QTabWidget>;

	function addTab(widget:Star<QWidget>, label:QString):Int;
	function setMovable(movable:Bool):Void;
	function removeTab(index:Int):Void;
	function setTabsClosable(closeable:Bool):Void;
	function setUsesScrollButtons(useButtons:Bool):Void;
	function clear():Void;
}
