//
//  AppDelegate.m
//  LinearKnob
//
//  Created by Gary Grutzek on 01.03.16.
//  Copyright © 2016 Gary Grutzek. All rights reserved.
//

#import "AppDelegate.h"
#import "GGLinearKnob.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet GGLinearKnob *bigKnob;

@end

@implementation AppDelegate
@synthesize bigKnob;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
	
	[[bigKnob cell] setKnobColor: [NSColor orangeColor].CGColor];
	[[bigKnob cell] setDotColor:[NSColor blueColor].CGColor];
	[[bigKnob cell] setDotSize:8.];
	
	// should be a better way for default
	[bigKnob setFloatValue:0.5];
	[self doSomething:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}


- (IBAction)doSomething:(id)sender {
	NSLog(@"Value: %f", bigKnob.floatValue);
	
	NSColor *backColor = [NSColor colorWithCalibratedHue:0.6
											  saturation:bigKnob.floatValue
											  brightness:0.5
												   alpha:1.0];
	[_window setBackgroundColor:backColor];
}

@end
