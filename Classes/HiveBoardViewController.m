//
//  HiveBoardViewController.m
//  HiveBoard
//
//  Created by Ben Scheirman on 10/9/10.
//  Copyright 2010 ChaiONE. All rights reserved.
//

#import "HiveBoardViewController.h"
#import "HexView.h"
#import "BugTileView.h"

@implementation HiveBoardViewController

@synthesize scrollView, tileContainerView;

const CGFloat tileSize = 100;

- (void)addHexAtCoordinate:(CGPoint) coord {
	
	CGPoint center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
	
	CGFloat horizontalOffset = 1.5 * tileSize / 2;
	CGFloat verticalOffset = tileSize;
	CGFloat x = center.x + (coord.x * horizontalOffset);
	CGFloat y = center.y + (coord.y * verticalOffset);
	
	//shift all of them left so that 0,0 is centered around the center of the view's frame
	x -= tileSize / 2;
	
	//shift up odd numbered columns
	BOOL shiftedUp = ((int)coord.x % 2) == 0;
	if (shiftedUp) 
		y -= tileSize / 2;
	
	HexView *hex = [[HexView alloc] initWithFrame:CGRectMake(x, y, tileSize, tileSize)];
	[gameBoardView addSubview:hex];
	[hex release];
}

- (void)setupTileContainer {
	self.tileContainerView.backgroundColor = [UIColor darkGrayColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupTileContainer];
	
	gameBoardView = [[UIView alloc] initWithFrame:self.view.bounds];	
	[self.scrollView addSubview:gameBoardView];
	self.scrollView.delegate = self;
		
	for(int a = -8; a <= 8; a++) {
		for(int b = -8; b <= 8; b++) {
			[self addHexAtCoordinate:CGPointMake(a, b)];
		}
	}
}

CGRect moveRect(CGRect sourceRect, CGPoint newOrigin, CGPoint offsetByPoint) {
	sourceRect.origin = newOrigin;
	sourceRect.origin.x -= offsetByPoint.x;
	sourceRect.origin.y -= offsetByPoint.y;
	return sourceRect;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	if([touch.view isKindOfClass:[BugTileView class]]) {
		NSLog(@"picked it up");
		currentDraggingView = (BugTileView*)touch.view;
		[currentDraggingView outline:YES];
		dragOffset = [touch locationInView:touch.view];
		currentDraggingView.frame = moveRect(currentDraggingView.frame, [touch locationInView:self.view], dragOffset);
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[currentDraggingView outline:NO];
	currentDraggingView = nil;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[currentDraggingView outline:NO];
	currentDraggingView = nil;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	if(currentDraggingView) {
		NSLog(@"dragging");
		currentDraggingView.frame = moveRect(currentDraggingView.frame, [touch locationInView:self.view], dragOffset);
	}
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return gameBoardView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
	[gameBoardView.subviews makeObjectsPerformSelector:@selector(setNeedsDisplay)];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	[super viewDidUnload];
	self.scrollView = nil;
	self.tileContainerView = nil;
}


- (void)dealloc {
	[gameBoardView release];
    [super dealloc];
}

@end
