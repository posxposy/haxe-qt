package qt.widgets;

import cpp.RawPointer;
import cpp.Star;
import qt.widgets.Widget.QWidget;

class Application extends Widget {
	public function new() {
		final app = QApplication.create();
		untyped __cpp__('this->_ref = {0}', app);
		super();
	}

	public function exec():Void {
		asApp().exec();
	}

	public function aboutQt():Void {
		asApp().aboutQt();
	}

	public function quit():Void {
		asApp().quit();
	}

	inline function asApp():Star<QApplication> {
		return untyped __cpp__('static_cast<QApplication*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qapplication.h')
@:native('QApplication')
extern class QApplication extends QWidget {
	static inline function create():RawPointer<QApplication> {
		untyped __cpp__('
				char *argv[] = {NULL};
				int argc = sizeof(argv) / sizeof(char*) - 1;
		');
		return untyped __cpp__('new QApplication(argc, argv)');
	}

	function exec():Void;
	function aboutQt():Void;
	function quit():Void;
}
