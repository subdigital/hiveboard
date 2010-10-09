//
//  HiveBoardAppDelegate.h
//  HiveBoard
//
//  Created by Ben Scheirman on 10/9/10.
//  Copyright 2010 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HiveBoardViewController;

@interface HiveBoardAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HiveBoardViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HiveBoardViewController *viewController;

@end

