package qt.core;

import cpp.RawPointer;

@:using(qt.core.QStringTools)
@:unreflective
@:include('QtCore/qstring.h')
@:native('QString')
extern class QString {
	@:native('new QString')
	public static function create():RawPointer<QString>;
}
