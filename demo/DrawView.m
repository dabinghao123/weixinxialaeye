//
//  DrawView.m
//  demo
//
//  Created by binghuang on 16/2/3.
//  Copyright © 2016年 binghuang. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // If you plan to do more drawing later, it's a good idea
    // to save the graphics state before clipping.
//    [NSGraphicsContext saveGraphicsState];
    
    //1
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSaveGState(context);

    UIBezierPath*  rectPath  = [UIBezierPath bezierPathWithRect:CGRectMake(10, 64, 100.0, 100.0)];
    CGContextRestoreGState(context);
    
    //2
    CGContextSaveGState(context);
    UIBezierPath*  ovalPath  = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(60.0, 114, 100.0,  100.0)];
    /**
     *  + (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
     */
    [ovalPath  appendPath:rectPath];
    [ovalPath closePath];
     ovalPath.lineWidth =10.0;
     ovalPath.lineCapStyle = kCGLineCapRound; //线条拐角
     ovalPath.lineJoinStyle = kCGLineCapRound; //终点处理
    // Add the path to the clip shape.
    
    // Create the path and add the shapes
    [[UIColor redColor]setFill];
    [[UIColor blueColor]setStroke];
    [ovalPath stroke];
    [ovalPath fill];
    CGContextRestoreGState(context);
    
}


@end
