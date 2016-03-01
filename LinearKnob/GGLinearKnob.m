//
//  GGLinearKnob.m
//  Spielomat
//
//  Created by Gary Grutzek on 26.02.16.
//  Copyright © 2016 Gary Grutzek. All rights reserved.
//
#import "GGLinearKnob.h"

@implementation GGLinearKnob

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
		_cell = [[GGKnobCell alloc] init];
		[self setCell:_cell];
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		_cell = [[GGKnobCell alloc] init];
		[self setCell:_cell];
	}
	return self;
}

@end
