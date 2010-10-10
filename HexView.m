//
//  HexView.m
//  HiveBoard
//
//  Created by Ben Scheirman on 10/9/10.
//  Copyright 2010 ChaiONE. All rights reserved.
//

#import "HexView.h"
#import <QuartzCore/QuartzCore.h>

#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)
#define RADIANS_TO_DEGREES(r) (r * 180 / M_PI)

@implementation HexView

@synthesize p1, p2, p3, p4, p5, p6;

- (CGColorRef)normalColor {
	return [[UIColor colorWithWhite:.8 alpha:1.0f] CGColor];
}

- (CGColorRef)highlightColor {
	return [[UIColor colorWithRed:.5 green:1.0f blue:.6 alpha:.8] CGColor];
}

- (CAShapeLayer *)shapeLayer {
	return (CAShapeLayer *)self.layer;
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		CAShapeLayer *shapeLayer = [self shapeLayer];
		shapeLayer.lineWidth = 1;
		shapeLayer.lineCap = kCALineCapRound;
		shapeLayer.shouldRasterize = YES;
		shapeLayer.backgroundColor = [[UIColor clearColor] CGColor];
		shapeLayer.fillColor = [self normalColor];
		shapeLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
		self.userInteractionEnabled = YES;
		
//		self.gestureRecognizers = [NSArray arrayWithObject:
//								   [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)] autorelease]];
    }
    return self;
}
																
- (void)tap:(UIGestureRecognizer *)recognizer {
	[self highlight];
}

+ (Class)layerClass {
	return [CAShapeLayer class];
}

- (void)highlight {
	isHighlighted = !isHighlighted;
	
	if(isHighlighted) {
		[[self shapeLayer] setFillColor:[self normalColor]];
	} else {
		[[self shapeLayer] setFillColor:[self highlightColor]];
	}
	
	[self setNeedsLayout];
}

- (void)setupPath {
	CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
	
	CGFloat w = self.frame.size.width;
	CGFloat h = self.frame.size.height;
	CGFloat sideSize = w / 2;
	
	CGMutablePathRef path = CGPathCreateMutable();
	
	CGFloat c = sideSize;
	CGFloat a = c/2.0f;
	CGFloat b = h / 2.0f;
	
	self.p1 = CGPointMake(0, b);
	self.p2 = CGPointMake(a, 0);
	self.p3 = CGPointMake(a+c, 0);
	self.p4 = CGPointMake(2*c, b);
	self.p5 = CGPointMake(a+c, 2*b);
	self.p6 = CGPointMake(a, 2*b);
	
	CGPathMoveToPoint(path, NULL,	self.p1.x, self.p1.y);
	CGPathAddLineToPoint(path, NULL, self.p2.x, self.p2.y);
	CGPathAddLineToPoint(path, NULL, self.p3.x, self.p3.y);
	CGPathAddLineToPoint(path, NULL, self.p4.x, self.p4.y);
	CGPathAddLineToPoint(path, NULL, self.p5.x, self.p5.y);
	CGPathAddLineToPoint(path, NULL, self.p6.x, self.p6.y);
	CGPathAddLineToPoint(path, NULL, self.p1.x, self.p1.y);
	
	shapeLayer.path = path;
	
	CGPathRelease(path);
}

- (void)layoutSubviews {
	[super layoutSubviews];
	[self setupPath];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
