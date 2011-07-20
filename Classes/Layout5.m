//
//  Layout1.m
//  FlipView
//
//  Created by Reefaq Mohammed on 16/07/11.
//  Copyright 2010 raw eng. All rights reserved.
//

#import "Layout5.h"
#import "UIViewExtention.h"

@implementation Layout5

@synthesize view1;
@synthesize view2;
@synthesize view3;
@synthesize view4;
@synthesize view5;

-(void)initalizeViews:(NSDictionary*)viewCollectionDictonary{
		view1 = (UIViewExtention*)[viewCollectionDictonary objectForKey:@"view1"];
		view2 = (UIViewExtention*)[viewCollectionDictonary objectForKey:@"view2"];
		view3 = (UIViewExtention*)[viewCollectionDictonary objectForKey:@"view3"];		
		view4 = (UIViewExtention*)[viewCollectionDictonary objectForKey:@"view4"];
		view5 = (UIViewExtention*)[viewCollectionDictonary objectForKey:@"view5"];
		
		self.isFullScreen= FALSE;
		view1.isFullScreen = FALSE;
		view2.isFullScreen = FALSE;
		view3.isFullScreen = FALSE;
		view4.isFullScreen = FALSE;
		view5.isFullScreen = FALSE;
	
	
		view1.isMediaAndTextCapable = FALSE;
		view2.isMediaAndTextCapable = TRUE;
		view3.isMediaAndTextCapable = FALSE;
		view4.isMediaAndTextCapable = TRUE;
		view5.isMediaAndTextCapable = TRUE;
	
		
	[view1 setBackgroundColor:[UIColor whiteColor]];
	[view2 setBackgroundColor:[UIColor whiteColor]];
	[view3 setBackgroundColor:[UIColor whiteColor]];
	[view4 setBackgroundColor:[UIColor whiteColor]];
	[view5 setBackgroundColor:[UIColor whiteColor]];
	
		
		[self addSubview:view1];
		[self addSubview:view2];
		[self addSubview:view3];
		[self addSubview:view4];
		[self addSubview:view5];		
}

 
-(void)rotate:(UIInterfaceOrientation)orientation animation:(BOOL)animation {
	
	
	[view1 setBackgroundColor:[UIColor whiteColor]];
	[view2 setBackgroundColor:[UIColor whiteColor]];
	[view3 setBackgroundColor:[UIColor whiteColor]];
	[view4 setBackgroundColor:[UIColor whiteColor]];
	[view5 setBackgroundColor:[UIColor whiteColor]];
	
	for (UIView* myview in [self subviews]) {
		if ([myview isKindOfClass:[UIViewExtention class]]) {
			if (self.isFullScreen) {
				if (!((UIViewExtention*)myview).isFullScreen) {
					[((UIViewExtention*)myview) setAlpha:0];
				}
			}else {
				[((UIViewExtention*)myview) setAlpha:1];
			}
		}
	}
	
	
	
	if (animation) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.50];
	}
	
	if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
		if (view1 != nil) {
			[view4 setFrame:CGRectMake(0, 50, 768 /2, 954 /2 -10)];
			[view5 setFrame:CGRectMake(0, (954 /2) + 40, 768 /2, 954/2-10)];
			
			[view1 setFrame:CGRectMake(768 /2, 50, 768 /2, (954/3) - 55)];
			[view2 setFrame:CGRectMake(768 /2, (954/3)-5, 768 /2, 954/3 + 90)];
			[view3 setFrame:CGRectMake(768 /2, ((954/3)*2) + 85, 768 /2, (954/3) - 55)];
		}
	}else {
		if (view1 != nil) {		
			[view1 setFrame:CGRectMake(0, 50, (1024 /3) - 50, 698/2 - 10)];
			[view2 setFrame:CGRectMake((1024 /3) - 50, 50, 1024 /3 + 100, 698/2 - 10)];
			[view3 setFrame:CGRectMake((1024 /3)*2 + 50, 50, (1024/3) -50 , 698/2 - 10)];
			
			[view4 setFrame:CGRectMake(0, 698/2 + 40, 1024 /2, 698/2 - 10)];
			[view5 setFrame:CGRectMake(1024 /2, 698/2+ 40, 1024 /2, 698/2 - 10)];
		}
	}
	
	if (animation) {
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(animationEnd:finished:context:)];	
		[UIView commitAnimations];
	}else {
		for (UIView* myview in [self subviews]) {
			if ([myview isKindOfClass:[UIViewExtention class]]) {
				[((UIViewExtention*)myview) setAlpha:1];
			}
		}

		[view1 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];
		[view2 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];
		[view3 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];
		[view4 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];
		[view5 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];			
		
	}
	
	//rotate/adjust inner view
	for (UIView* myview in [self subviews]) {
		if ([myview isKindOfClass:[UIViewExtention class]]) {
			[((UIViewExtention*)myview) rotate:orientation animation:YES];
		}
	}
	
}

- (void)animationEnd:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context {	
	for (UIView* myview in [self subviews]) {
		if ([myview isKindOfClass:[UIViewExtention class]]) {
				[((UIViewExtention*)myview) setAlpha:1];
		}
	}
	[view1 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];
	[view2 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];
	[view3 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];
	[view4 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];
	[view5 setBackgroundColor:[UIColor colorWithRed:213.0f/255.0f green:213.0f/255.0f blue:213.0f/255.0f alpha:0.9]];	
	
}

- (void) dealloc{
	[view1 release];
	[view2 release];
	[view3 release];
	[view4 release];
	[view5 release];
	[super dealloc];
}

@end
