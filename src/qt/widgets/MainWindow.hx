package qt.widgets;

import qt.widgets.MenuBar.QMenuBar;
import cpp.RawPointer;
import qt.widgets.Widget;
import cpp.Star;

@:headerCode('#include <QtWidgets/qmainwindow.h>')
class MainWindow extends Widget {
	public function new() {
		untyped __cpp__('this->_ref = {0}', QMainWindow.create());
		super();
	}

	public function setCentralWidget(widget:Widget):Void {
		untyped __cpp__('static_cast<QMainWindow*>(_ref)->setCentralWidget(static_cast<QWidget*>({0}->_ref))', widget);
	}

	inline function asMainWindow():Star<QMainWindow> {
		return untyped __cpp__('static_cast<QMainWindow*>({0}->_ref)', this);
	}

	public function menuBar():MenuBar {
		final qMenuBar = asMainWindow().menuBar();
		final menuBar = new MenuBar(false);
		untyped __cpp__('{0}->_ref = {1}', menuBar, qMenuBar);
		return menuBar;
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qmainwindow.h')
@:native('QMainWindow')
extern class QMainWindow extends QWidget {
	@:native('new QMainWindow')
	static function create():RawPointer<QMainWindow>;
	function menuBar():Star<QMenuBar>;
	function setCentralWidget(widget:Star<QWidget>):Void;
}
