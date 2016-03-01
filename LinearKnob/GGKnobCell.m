//
//  GGKnobCell.m
//  Spielomat
//
//  Created by Gary Grutzek on 26.02.16.
//  Copyright © 2016 Gary Grutzek. All rights reserved.
//
#import "GGKnobCell.h"

@implementation GGKnobCell

@synthesize knobColor;
@synthesize dotColor;

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
		[self setupCell];
    }
    return self;
}


- (instancetype)init
{
	self = [super init];
	if (self) {
		[self setupCell];
	}
	return self;
}


- (void) setupCell {
	[self setMinValue:0.];
	[self setMaxValue:1.];
	[self setDotSize:5.];
	[self setMouseFactor:3.]; // extend tracking Range
	[self setSliderType:NSCircularSlider];
	knobColor = CGColorCreateGenericRGB(0.6, 0.6, 0.6, 1);
}


- (BOOL)startTrackingAt:(NSPoint)startPoint inView:(NSView *)controlView {
	_beginTracking = YES;
	return YES;
}


- (BOOL)continueTracking:(NSPoint)lastPoint at:(NSPoint)currentPoint inView:(NSView *)controlView
{
	double dy;
	if (_beginTracking) { dy = 0; } // don't jump on first click
	else { dy = (currentPoint.y - lastPoint.y)/_mouseFactor; }
	_beginTracking = NO;
	_value += dy/controlView.bounds.size.height;
	// clamp
	_value = fmax(_value, _minValue);
	_value = fmin(_value, _maxValue);
	
	[[self controlView] setNeedsDisplay:YES];
	return YES;
}

#define OFFSET -M_PI_2-M_PI_4	// -45° - +315°
#define RANGE 270./180. * M_PI	// 270°

- (void)drawInteriorWithFrame:(NSRect)aRect inView:(NSView *)controlView
{
	NSRect rect = CGRectInset(controlView.bounds, controlView.bounds.size.width/10., controlView.bounds.size.height/10.);
	CGSize size = rect.size;
	NSPoint center = NSMakePoint(rect.origin.x + size.width/2., rect.origin.y + size.height/2.);
	
	CGContextRef context = (CGContextRef) [[NSGraphicsContext currentContext] graphicsPort];
	CGContextSetFillColorWithColor(context, knobColor);
	CGContextFillEllipseInRect(context, aRect);
	CGContextSetFillColorWithColor(context, dotColor);
	NSRect dotRect = NSMakeRect(center.x + size.width/2 * sin(_value * RANGE + OFFSET) - _dotSize/2.,
								center.y + size.height/2 * cos(_value * RANGE + OFFSET) - _dotSize/2.,
								_dotSize, _dotSize);
	CGContextFillEllipseInRect(context, dotRect);
}

@end
