package qt.core;

import cpp.Finalizable;
import cpp.Star;

@:headerCode('#include <QtCore/qobject.h>')
@:headerClassCode('QObject *_ref;')
class Object extends Finalizable {
	public function new() {
		super();
	}

	public function setObjectName(name:String):Void {
		final str = QStringTools.toQtString(name);
		asObject().setObjectName(str);
	}

	@:noCompletion
	override public function finalize() {
		untyped __cpp__('_ref->deleteLater()');
	}

	inline function asObject():Star<QObject> {
		return untyped __cpp__('{0}->_ref', this);
	}
}

@:publicFields
@:unreflective
@:include('QtCore/qobject.h')
@:native('QObject')
extern class QObject {
	function setObjectName(name:QString):Void;
}
