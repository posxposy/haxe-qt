package qt;

import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;

using haxe.macro.PositionTools;

class HxQt {
	public static macro function setup(path:String, libs:Array<String>):Array<Field> {
		final path = Path.normalize(path);
		final xmlInject = new StringBuf();
		xmlInject.add('
			<echo value="   _    _          __   ________             ____  _   "/>
			<echo value="  | |  | |   /\\    \\ \\ / /  ____|           / __ \\| |  "/>
			<echo value="  | |__| |  /  \\    \\ V /| |__     ______  | |  | | |_ "/>
			<echo value="  |  __  | / /\\ \\    > < |  __|   |______| | |  | | __|"/>
			<echo value="  | |  | |/ ____ \\  / . \\| |____           | |__| | |_ "/>
			<echo value="  |_|  |_/_/    \\_\\/_/ \\_\\______|           \\___\\_\\\\__|"/>
			<echo value="                                                       "/>
			<echo value="                                                       "/>
			<compiler id="MSVC" exe="cl.exe" if="windows">
				<flag value="/std:c++17"/>
				<flag value="/Zc:__cplusplus"/>
			</compiler>
			<files id="haxe">
				<compilerflag value="-I${path}/include/"/>
			</files>
			<files id="__main__">
				<compilerflag value="-I${path}/include/"/>
			</files>
			<target id="haxe">
		');

		for (libName in libs) {
			xmlInject.add('\n<lib name="' + path + '/lib/' + libName + '.lib" />');
		}
		xmlInject.add('\n</target>');

		final position = Context.currentPos();
		Context.getLocalClass().get().meta.add(":buildXml", [{expr: EConst(CString(xmlInject.toString())), pos: position}], position);
		return Context.getBuildFields();
	}
}
