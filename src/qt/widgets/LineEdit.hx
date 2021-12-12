package qt.widgets;

import qt.core.Alignment;
import cpp.Star;
import qt.core.QString;
import qt.core.Alignment.QAlignment;
import cpp.RawPointer;

using qt.core.QStringTools;

class LineEdit extends Widget {
	public var text(get, never):String;
	public var selectedText(get, never):String;
	public var hasSelectedText(get, never):Bool;
	public var isModified(get, never):Bool;

	public function new() {
		untyped __cpp__('_ref = {0}', QLineEdit.create());
		super();
	}

	public function setAlignment(alignment:Alignment):Void {
		asLineEdit().setAlignment(alignment);
	}

	public function setFrame(value:Bool):Void {
		asLineEdit().setFrame(value);
	}

	public function setMaxLength(value:Int):Void {
		asLineEdit().setMaxLength(value);
	}

	public function setModified(value:Bool):Void {
		asLineEdit().setModified(value);
	}

	public function setPlaceholderText(text:String):Void {
		final qStr = text.toQtString();
		asLineEdit().setPlaceholderText(qStr);
	}

	public function setReadOnly(value:Bool):Void {
		asLineEdit().setReadOnly(value);
	}

	public function setTextMargins(left:Int, top:Int, right:Int, bottom:Int):Void {
		asLineEdit().setTextMargins(left, top, right, bottom);
	}

	public function setEchoMode(mode:EchoMode):Void {
		asLineEdit().setEchoMode(mode);
	}

	function get_text():String {
		final qStr = asLineEdit().text();
		return qStr.toHaxeString();
	}

	function get_selectedText():String {
		final qStr = asLineEdit().selectedText();
		return qStr.toHaxeString();
	}

	function get_hasSelectedText():Bool {
		return asLineEdit().hasSelectedText();
	}

	function get_isModified():Bool {
		return asLineEdit().isModified();
	}

	inline function asLineEdit():Star<QLineEdit> {
		return untyped __cpp__('static_cast<QLineEdit*>({0}->_ref)', this);
	}
}

@:publicFields
@:unreflective
@:include('QtWidgets/qlineedit.h')
@:native('QLineEdit')
extern class QLineEdit {
	@:native('new QLineEdit')
	static function create():RawPointer<QLineEdit>;

	function setAlignment(alignment:QAlignment):Void;
	function setFrame(value:Bool):Void;
	function setMaxLength(value:Int):Void;
	function setModified(value:Bool):Void;
	function setPlaceholderText(text:QString):Void;
	function setReadOnly(value:Bool):Void;
	function setTextMargins(left:Int, top:Int, right:Int, bottom:Int):Void;
	function setEchoMode(mode:QEchoMode):Void;

	function text():QString;
	function selectedText():QString;
	function isModified():Bool;
	function hasSelectedText():Bool;
}

@:unreflective
extern enum abstract EchoMode(QEchoMode) to QEchoMode from QEchoMode {
	@:native('QLineEdit::EchoMode::Normal')
	var Normal;
	@:native('QLineEdit::EchoMode::NoEcho')
	var NoEcho;
	@:native('QLineEdit::EchoMode::Password')
	var Password;
	@:native('QLineEdit::EchoMode::PasswordEchoOnEdit')
	var PasswordEchoOnEdit;
}

@:unreflective
@:include('QtWidgets/qlineedit.h')
@:native('QLineEdit::EchoMode')
extern class QEchoMode {
}
