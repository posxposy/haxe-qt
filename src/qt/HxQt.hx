package qt;

import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;

using haxe.macro.PositionTools;

class HxQt {
	public static macro function setup():Array<Field> {
		final buildFields = Context.getBuildFields();
		final pos = Context.currentPos();
		final defines = Context.getDefines();

		if (!defines.exists('QT_PATH')) {
			Context.fatalError('Please, provide QT_PATH define', pos);
			return buildFields;
		}

		if (!defines.exists('QT_LIBS')) {
			Context.fatalError('Please, provide QT_LIBS define', pos);
			return buildFields;
		}

		final path = Path.normalize(defines.get('QT_PATH'));
		final libs:Array<String> = defines.get('QT_LIBS').split(',');
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

		final c = Context.getLocalClass();
		c.get().meta.add(":buildXml", [{expr: EConst(CString(xmlInject.toString())), pos: pos}], pos);
		return buildFields;
	}
}
