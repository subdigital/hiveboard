//
//  HiveBoardViewController.m
//  HiveBoard
//
//  Created by Ben Scheirman on 10/9/10.
//  Copyright 2010 ChaiONE. All rights reserved.
//

#import "HiveBoardViewController.h"
#import "HexView.h"

@implementation HiveBoardViewController

@synthesize scrollView;

const CGFloat tileSize = 100;

- (void)addHexAtCoordinate:(CGPoint) coord {
	
	CGPoint center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
	
	CGFloat side = tileSize / 2;
	
	BOOL shiftedUp = ((int)coord.x % 2) == 0;
	CGFloat x = center.x + (coord.x * 1.5 * side);
	CGFloat y = center.y + (coord.y * tileSize);
	
	x -= tileSize / 2;
	
	if (shiftedUp) 
		y -= tileSize / 2;
	
	HexView *hex = [[HexView alloc] initWithFrame:CGRectMake(x, y, tileSize, tileSize)];
	[gameBoardView addSubview:hex];
	[hex release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	gameBoardView = [[UIView alloc] initWithFrame:self.view.bounds];
	[self.scrollView addSubview:gameBoardView];
	
	self.scrollView.delegate = self;
		
	for(int a = -8; a <= 8; a++) {
		for(int b = -8; b <= 8; b++) {
			[self addHexAtCoordinate:CGPointMake(a, b)];
		}
	}
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return gameBoardView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
	gameBoardView.autoresizesSubviews = YES;
	[gameBoardView setNeedsLayout];
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
	self.scrollView = nil;
}


- (void)dealloc {
	[gameBoardView release];
    [super dealloc];
}

@end
