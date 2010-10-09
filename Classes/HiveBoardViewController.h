//
//  HiveBoardViewController.h
//  HiveBoard
//
//  Created by Ben Scheirman on 10/9/10.
//  Copyright 2010 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HiveBoardViewController : UIViewController <UIScrollViewDelegate> {
	UIView *gameBoardView;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end

