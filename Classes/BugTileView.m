//
//  BugTileView.m
//  HiveBoard
//
//  Created by Ben Scheirman on 10/9/10.
//  Copyright 2010 ChaiONE. All rights reserved.
//

#import "BugTileView.h"


@implementation BugTileView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:CGRectInset(frame, 1, 1)])) {
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	CAShapeLayer *shapeLayer = [self shapeLayer];
	
	shapeLayer.backgroundColor = [[UIColor clearColor] CGColor];
	shapeLayer.lineWidth = 3;
	shapeLayer.fillColor = [[UIColor blueColor] CGColor];
	shapeLayer.shadowPath = shapeLayer.path;
	shapeLayer.shadowOffset = CGSizeMake(1, 1);
	shapeLayer.shadowOpacity = .5f; 
}

-(void)outline:(BOOL)shouldOutline {
	UIColor *color = shouldOutline ? [UIColor yellowColor] : [UIColor clearColor];
	[[self shapeLayer] setStrokeColor:[color CGColor]];
}

- (void)dealloc {
    [super dealloc];
}


@end
