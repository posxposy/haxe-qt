package qt.gui;

import cpp.Finalizable;
import cpp.Pointer;
import cpp.RawPointer;

class Font extends Finalizable {
	final ref:Pointer<QFont>;

	public function new() {
		super();
		ref = Pointer.fromRaw(QFont.create());
	}

	public function setBold(value:Bool):Void {
		ref.ptr.setBold(value);
	}

	public function setPointSize(value:Int):Void {
		ref.ptr.setPointSize(value);
	}

	override public function finalize():Void {
		ref.destroy();
	}
}

@:publicFields
@:unreflective
@:include('QtGui/qfont.h')
@:native('QFont')
extern class QFont {
	@:native('new QFont')
	static function create():RawPointer<QFont>;
	function setBold(value:Bool):Void;
	function setPointSize(value:Int):Void;
}
