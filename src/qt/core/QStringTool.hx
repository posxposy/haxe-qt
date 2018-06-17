package qt.core;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
class QStringTool {
    public static function fromString(value:String):QString {
        return untyped __cpp__('(QString)value.c_str()');
    }
}