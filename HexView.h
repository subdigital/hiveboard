//
//  HexView.h
//  HiveBoard
//
//  Created by Ben Scheirman on 10/9/10.
//  Copyright 2010 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface HexView : UIView {
	BOOL isHighlighted;
}

@property (nonatomic, assign) CGPoint p1;
@property (nonatomic, assign) CGPoint p2;
@property (nonatomic, assign) CGPoint p3;
@property (nonatomic, assign) CGPoint p4;
@property (nonatomic, assign) CGPoint p5;
@property (nonatomic, assign) CGPoint p6;

-(CAShapeLayer *)shapeLayer;
-(void)highlight;

@end
