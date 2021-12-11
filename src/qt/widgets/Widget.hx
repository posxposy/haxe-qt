package qt.widgets;

import qt.widgets.Layout.QLayout;
import cpp.Finalizable;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import cpp.Star;
import qt.core.Object;
import qt.core.QString;
import qt.core.QStringTools;

class Widget extends Object {
	public function new() {
		super();
		untyped __cpp__('
			if (_ref == nullptr) {
				_ref = {0};
			}
			', QWidget.create());
	}

	public function resize(width:Int, height:Int):Void {
		asWidget().resize(width, height);
	}

	/**
		Shows the widget and its child widgets.
	 */
	public function show():Void {
		asWidget().show();
	}

	/**
		Closes this widget. Returns true if the widget was closed; otherwise returns false.
		@return Bool
	 */
	public function close():Bool {
		return asWidget().close();
	}

	/**
		Hides the widget. This function is equivalent to `setVisible(false)`.
	 */
	public function hide():Void {
		asWidget().hide();
	}

	/**
		Lowers the widget to the bottom of the parent widget's stack.
		After this call the widget will be visually behind (and therefore obscured by) any overlapping sibling widgets.
	 */
	public function lower():Void {
		asWidget().lower();
	}

	/**
		Raises this widget to the top of the parent widget's stack.
		After this call the widget will be visually in front of any overlapping sibling widgets.
	 */
	public function raise():Void {
		asWidget().raise();
	}

	/**
		Repaints the widget directly by calling `paintEvent()` immediately, unless updates are disabled or the widget is hidden.
		We suggest only using `repaint()` if you need an immediate repaint, for example during animation. In almost all circumstances `update()` is better, as it permits Qt to optimize for speed and minimize flicker.
	 */
	public function repaint():Void {
		asWidget().repaint();
	}

	/**
		Disables widget input events if `disable` is true; otherwise enables input events
	 */
	public function setDisabled(disable:Bool):Void {
		asWidget().setDisabled(disable);
	}

	public function setWindowTitle(value:String):Void {
		final str = value.toQtString();
		asWidget().setWindowTitle(str);
	}

	public function setToolTip(value:String):Void {
		final str = value.toQtString();
		asWidget().setToolTip(str);
	}

	public function setGeometry(x:Int, y:Int, width:Int, height:Int):Void {
		asWidget().setGeometry(x, y, width, height);
	}

	/**
		Enables widget input events if `enable` is true; otherwise disables input events
	 */
	public function setEnabled(enable:Bool):Void {
		asWidget().setEnabled(enable);
	}

	/**
		Gives the keyboard input focus to this widget (or its focus proxy) if this widget or one of its parents is the active window.
	 */
	public function setFocus():Void {
		asWidget().setFocus();
	}

	public function setHidden(hidden:Bool):Void {
		asWidget().setHidden(hidden);
	}

	public function setStyleSheet(styleSheet:String):Void {
		final str = styleSheet.toQtString();
		asWidget().setStyleSheet(str);
	}

	public function setVisible(visible:Bool):Void {
		asWidget().setVisible(visible);
	}

	public function setWindowModified(modified:Bool):Void {
		asWidget().setWindowModified(modified);
	}

	/**
		Shows the widget in full-screen mode.
	 */
	public function showFullScreen():Void {
		asWidget().showFullScreen();
	}

	/**
		Shows the widget maximized.
	 */
	public function showMaximized():Void {
		asWidget().showMaximized();
	}

	/**
		Shows the widget minimized, as an icon.
	 */
	public function showMinimized():Void {
		asWidget().showMinimized();
	}

	/**
		Restores the widget after it has been maximized or minimized.
	 */
	public function showNormal():Void {
		asWidget().showNormal();
	}

	public function setLayout(widget:Layout):Void {
		final qLayout = @:privateAccess widget.asLayout();
		asWidget().setLayout(qLayout);
	}

	public function setParent(parent:Widget):Void {
		untyped __cpp__('static_cast<QWidget*>(this->_ref)->setParent(	static_cast<QWidget*>({0}->_ref))', parent);
	}

	/**
		Adjusts the size of the widget to fit its contents.
	 */
	public function adjustSize():Void {
		asWidget().adjustSize();
	}

	public function setContentsMargins(left:Int, top:Int, right:Int, bottom:Int):Void {
		asWidget().setContentsMargins(left, top, right, bottom);
	}

	inline function asWidget():Star<QWidget> {
		return untyped __cpp__('static_cast<QWidget*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qwidget.h')
@:native('QWidget')
extern class QWidget extends QObject {
	@:native('new QWidget')
	static function create():RawPointer<QWidget>;

	function close():Bool;
	function hide():Void;
	function lower():Void;
	function raise():Void;
	function repaint():Void;
	function setDisabled(disable:Bool):Void;
	function setEnabled(enable:Bool):Void;
	function setFocus():Void;
	function setHidden(hidden:Bool):Void;
	function setStyleSheet(styleSheet:QString):Void;
	function setVisible(visible:Bool):Void;
	function setWindowModified(modified:Bool):Void;
	function setWindowTitle(title:QString):Void;
	function show():Void;
	function showFullScreen():Void;
	function showMaximized():Void;
	function showMinimized():Void;
	function showNormal():Void;
	function update():Void;
	function resize(width:Int, height:Int):Void;
	function setToolTip(value:QString):Void;
	function setGeometry(x:Int, y:Int, width:Int, height:Int):Void;
	function setParent(parent:Star<QWidget>):Void;
	function setLayout(layout:Star<QLayout>):Void;
	function adjustSize():Void;
	function setContentsMargins(left:Int, top:Int, right:Int, bottom:Int):Void;
}
