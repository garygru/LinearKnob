//
//  GGKnobCell.h
//  Spielomat
//
//  Created by Gary Grutzek on 26.02.16.
//  Copyright © 2016 Gary Grutzek. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GGKnobCell : NSSliderCell {
	
	BOOL _beginTracking;
}

@property double mouseFactor;
@property CGColorRef knobColor;
@property CGColorRef dotColor;
@property double dotSize;

@end
