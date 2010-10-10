//
//  HiveBoardViewController.h
//  HiveBoard
//
//  Created by Ben Scheirman on 10/9/10.
//  Copyright 2010 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BugTileView.h"

@interface HiveBoardViewController : UIViewController <UIScrollViewDelegate> {
	UIView *gameBoardView;
	BugTileView *currentDraggingView;
	CGPoint dragOffset;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIView *tileContainerView;

@end

