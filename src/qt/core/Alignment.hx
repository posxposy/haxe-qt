package qt.core;

@:unreflective
extern enum abstract Alignment(QAlignment) to QAlignment from QAlignment {
	@:native('Qt::AlignLeft')
	var AlignLeft;
	@:native('Qt::AlignLeading')
	var AlignLeading;
	@:native('Qt::AlignRight')
	var AlignRight;
	@:native('Qt::AlignTrailing')
	var AlignTrailing;
	@:native('Qt::AlignHCenter')
	var AlignHCenter;
	@:native('Qt::AlignJustify')
	var AlignJustify;
	@:native('Qt::AlignAbsolute')
	var AlignAbsolute;
	@:native('Qt::AlignHorizontal_Mask')
	var AlignHorizontalMask;
	@:native('Qt::AlignTop')
	var AlignTop;
	@:native('Qt::AlignBottom')
	var AlignBottom;
	@:native('Qt::AlignVCenter')
	var AlignVCenter;
	@:native('Qt::AlignBaseline')
	var AlignBaseline;
	@:native('Qt::AlignVertical_Mask')
	var AlignVerticalMask;
	@:native('Qt::AlignCenter')
	var AlignCenter;
	@:native('Qt::Alignment()')
	var Default;
}

@:unreflective
@:include('QtCore/qnamespace.h')
@:native("Qt::Alignment")
extern class QAlignment {
}
