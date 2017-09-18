# haxe-qt

![Image of HaxeQt](https://i.imgur.com/Tqn42LB.png)

This is just an experiment or even idea about how to connect Qt with Haxe.
Also, sources may be changed at any time. 
Also, I almost found the solution for it, but there is still no slots and signals yet.

And only windows currently. Tested with Qt 5.9 and Visual Studio 2017, x64.

So, how to run it?
Just set the correct path to your Qt folder with selected compiler (msvc2017_64 in my case). 
Use the same compiler as HXCPP using. 

Here is an example:

`@:build(qt.HxQt.setup("E:/SDKs/QT/5.9/msvc2017_64", ["Qt5Core", "Qt5Widgets" , "Qt5Gui"]))`

Look at `sample/Sample.hx` for details. 

If you want to build x86 arch, then go to the FlashDevelop project settings and remomve `-D HXCPP_M64` from additional compiler options.
Or, if you do not using FlashDevelop, remove it from `build_windows.hxml` file.