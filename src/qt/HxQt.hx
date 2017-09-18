package qt;
import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;

using haxe.macro.PositionTools;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */

class HxQt 
{
    public static macro function setup(path:String, libs:Array<String>):Array<Field>
    {
        path = Path.normalize(path);
        var xmlInject:String = '
           <echo value="   _    _          __   ________             ____  _   "/>
           <echo value="  | |  | |   /\\    \\ \\ / /  ____|           / __ \\| |  "/>
           <echo value="  | |__| |  /  \\    \\ V /| |__     ______  | |  | | |_ "/>
           <echo value="  |  __  | / /\\ \\    > < |  __|   |______| | |  | | __|"/>
           <echo value="  | |  | |/ ____ \\  / . \\| |____           | |__| | |_ "/>
           <echo value="  |_|  |_/_/    \\_\\/_/ \\_\\______|           \\___\\_\\\\__|"/>
           <echo value="                                                       "/>
           <echo value="                                                       "/>
        
            <files id="haxe">
                <!--import name="'+ path + '/include/"/-->
                <compilerflag value="-I' + path + '/include/"/>
            </files>
            <files id="__main__">
                <compilerflag value="-I' + path + '/include/"/>
            </files>
            <target id="haxe">
        ';
        for (libName in libs) {
            xmlInject += '<lib name="' + path + '/lib/' + libName + '.lib" />'; //if mac/linux - .so?
        }
        xmlInject += '</target>';
        
        var position:Position = Context.currentPos();
        Context.getLocalClass().get().meta.add(":buildXml", [ { expr:EConst( CString( xmlInject ) ), pos:position } ], position  );
        return Context.getBuildFields();
    }
    
}