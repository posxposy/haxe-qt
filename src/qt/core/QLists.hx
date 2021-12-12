package qt.core;

@:structAccess
@:publicFields
@:unreflective
@:include('QtCore/qlist.h')
@:native('QList<int>')
extern class QIntList {
	@:native('QList<int>')
	static function make():QIntList;

	@:native('push_back')
	function pushBack(v:Int):Void;
	function clear():Void;
}
