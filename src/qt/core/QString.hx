package qt.core;
import cpp.Pointer;
import cpp.RawPointer;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

@:unreflective
@:include('QtCore/qstring.h')
@:native('QString')
extern class QString 
{
    @:native('new QString') public static function create():RawPointer<QString>;
}