//
//  EyeLayerManager.m
//  demo
//
//  Created by binghuang on 16/2/26.
//  Copyright © 2016年 binghuang. All rights reserved.
//

#import "EyeView.h"

@interface EyeView ()


@property (strong, nonatomic) CAShapeLayer *eyeFirstLightLayer;
@property (strong, nonatomic) CAShapeLayer *eyeSecondLightLayer;
@property (strong, nonatomic) CAShapeLayer *eyeballLayer;
@property (strong, nonatomic) CAShapeLayer *topEyesocketLayer;
@property (strong, nonatomic) CAShapeLayer *bottomEyesocketLayer;

@end


@implementation EyeView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		
		[self initLayer];
	    [self setupAnimation];
    }
    return self;
}


-(void)initLayer{
	//1
	_eyeFirstLightLayer = [CAShapeLayer layer];
	_eyeFirstLightLayer.backgroundColor = [UIColor greenColor].CGColor;
	_eyeFirstLightLayer.frame = self.layer.bounds;
	CGPoint center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
	UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
													radius:CGRectGetHeight(self.frame) * 0.1
													startAngle:(230.f / 180.f) * M_PI
						  
													endAngle:(265.f / 180.f) * M_PI
													clockwise:YES];
	_eyeFirstLightLayer.lineWidth   = 5.f;
	_eyeFirstLightLayer.path        = path.CGPath;
	_eyeFirstLightLayer.fillColor   = [UIColor clearColor].CGColor;
	_eyeFirstLightLayer.strokeColor = [UIColor whiteColor].CGColor;
	
	[self.layer addSublayer:_eyeFirstLightLayer];
	
	//2
	_eyeSecondLightLayer = [CAShapeLayer layer];
	CGPoint center2 = CGPointMake(CGRectGetWidth(self.frame)/2,CGRectGetHeight(self.frame) / 2);
	UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center2
														radius:CGRectGetHeight(self.frame)* 0.1 startAngle:(211.f / 180.f) * M_PI endAngle:(220.f / 180.f) * M_PI clockwise:YES];
	_eyeSecondLightLayer.lineWidth   = 5.f;
	_eyeSecondLightLayer.path        = path2.CGPath;
	_eyeSecondLightLayer.fillColor   = [UIColor clearColor].CGColor;
	_eyeSecondLightLayer.strokeColor = [UIColor whiteColor].CGColor;
	
	[self.layer addSublayer:_eyeSecondLightLayer];
	
	//3
	_eyeballLayer = [CAShapeLayer layer];
	CGPoint center3= CGPointMake(CGRectGetWidth(self.frame)/2,CGRectGetHeight(self.frame)/2);
	UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:center3
													  radius:CGRectGetHeight(self.frame) *0.2
													  startAngle:(0.f / 180.f) * M_PI
													  endAngle:(360.f / 180.f) * M_PI
													  clockwise:YES];
	
	_eyeballLayer.borderColor = [UIColor blackColor].CGColor;
	_eyeballLayer.lineWidth   = 1.f;
	_eyeballLayer.path        = path3.CGPath;
	_eyeballLayer.fillColor   = [UIColor clearColor].CGColor;
	_eyeballLayer.strokeColor = [UIColor whiteColor].CGColor;
	_eyeballLayer.anchorPoint = CGPointMake(0.5,0.5);
	[self.layer addSublayer:_eyeballLayer];
	
	//4_Top
	_topEyesocketLayer = [CAShapeLayer layer];
	CGPoint center4 = CGPointMake(CGRectGetWidth(self.frame)/2,CGRectGetHeight(self.frame)/2);
	UIBezierPath *path4 = [UIBezierPath bezierPath];
	[path4 moveToPoint:CGPointMake(CGRectGetWidth(self.frame)/3,CGRectGetHeight(self.frame)/2)];
	[path4 addQuadCurveToPoint:CGPointMake(CGRectGetWidth(self.frame) - CGRectGetWidth(self.frame)/3,CGRectGetHeight(self.frame) / 2) controlPoint:CGPointMake(CGRectGetWidth(self.frame)/2,center4.y - center4.y - 20)];
    _topEyesocketLayer.lineWidth   = 1.f;
	_topEyesocketLayer.path        = path4.CGPath;
	_topEyesocketLayer.fillColor   = [UIColor clearColor].CGColor;
	_topEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;
	[self.layer addSublayer:_topEyesocketLayer];
	
	//5_bottom
	_bottomEyesocketLayer = [CAShapeLayer layer];
	CGPoint center5 = CGPointMake(CGRectGetWidth(self.frame)/2,CGRectGetHeight(self.frame) / 2);
	UIBezierPath *path5 = [UIBezierPath bezierPath];
	[path5 moveToPoint:CGPointMake(CGRectGetWidth(self.frame)/3,CGRectGetHeight(self.frame) / 2)];
	[path5 addQuadCurveToPoint:CGPointMake(CGRectGetWidth(self.frame) - CGRectGetWidth(self.frame)/3,CGRectGetHeight(self.frame) / 2) controlPoint:CGPointMake(CGRectGetWidth(self.frame) / 2,center5.y + center5.y + 20)];
	_bottomEyesocketLayer.lineWidth   = 1.f;
	_bottomEyesocketLayer.path        = path5.CGPath;
	_bottomEyesocketLayer.fillColor   = [UIColor clearColor].CGColor;
	_bottomEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;
	
	[self.layer addSublayer:_bottomEyesocketLayer];
}

/**
 *  开始动画
 *
 *  @return
 */

-(void)setupAnimation {
	
    self.eyeFirstLightLayer.lineWidth = 0.0f;
    self.eyeSecondLightLayer.lineWidth = 0.f;
    self.eyeballLayer.opacity          = 0.f;
    
    _bottomEyesocketLayer.strokeStart  = 0.5f;
    _bottomEyesocketLayer.strokeEnd    = 0.5f;
    
    _topEyesocketLayer.strokeStart     = 0.5f;
    _topEyesocketLayer.strokeEnd       = 0.5f;
    
}


/**
 *  动画
 *
 *  @param y
 */

-(void)animationtionWith:(CGFloat)y{
	
    CGFloat flag = -(self.frame.origin.y * 2.f - 50.f);
    //20*2 20
    if (y < flag) {
        if (self.eyeFirstLightLayer.lineWidth < 5.f) {
            self.eyeFirstLightLayer.lineWidth +=1.f;
            self.eyeSecondLightLayer.lineWidth +=1.f;
        }
        
    }
    //
    if (y< flag - 20) {
		if (self.eyeballLayer.opacity <=1.0f) {
			self.eyeballLayer.opacity += 0.1f;
		}
    }
    
    if (y<flag - 40) {
		
		if (self.topEyesocketLayer.strokeEnd <1.f &&self.topEyesocketLayer.strokeStart>0.f)
		{
			self.topEyesocketLayer.strokeEnd += 0.1f;
			self.topEyesocketLayer.strokeStart -= 0.1f;
			self.bottomEyesocketLayer.strokeEnd += 0.1f;
			self.bottomEyesocketLayer.strokeStart -= 0.1f;
		}
    }
	
    //
	if (y > flag) {
		if (self.eyeFirstLightLayer.lineWidth > 0.0f) {
			self.eyeFirstLightLayer.lineWidth -=1.f;
			self.eyeSecondLightLayer.lineWidth -=1.f;
		}
	}
	
	if (y > flag - 20) {
		if (self.eyeballLayer.opacity >0.0f) {
			self.eyeballLayer.opacity -= 0.1f;
		}
	}
	
	if (y >flag - 30) {
		if (self.topEyesocketLayer.strokeEnd >0.5f &&self.topEyesocketLayer.strokeStart <0.5f)
		{
			self.topEyesocketLayer.strokeEnd -= 0.1f;
			self.topEyesocketLayer.strokeStart += 0.1f;
			self.bottomEyesocketLayer.strokeEnd -= 0.1f;
			self.bottomEyesocketLayer.strokeStart += 0.1f;
		}
		
	}
	
}


@end
