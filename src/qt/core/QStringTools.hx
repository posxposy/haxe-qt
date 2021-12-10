package qt.core;

import cpp.ConstCharStar;

@:publicFields
final class QStringTools {
	static inline function toQtString(value:String):QString {
		return untyped __cpp__('QString({0}.c_str())', value);
	}

	static inline function toHaxeString(value:QString):String {
		final str:ConstCharStar = untyped __cpp__('{0}.toUtf8().constData()', value);
		return str.toString();
	}
}
