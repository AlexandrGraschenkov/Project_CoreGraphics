//
//  CustomView.m
//  TestCoreGraphics
//
//  Created by Alexander on 27.10.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "CustomView.h"



@implementation CustomView

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor redColor] set];
//    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillRect(context, CGRectMake(10, 10, 20, 20));
    
    CGPoint center = CGPointMake(50, 50);
    
//    CGContextConcatCTM(context, CGAffineTransformMakeTranslation(center.x, center.y));
//    CGContextConcatCTM(context, CGAffineTransformMakeRotation(M_PI_4));
//    CGContextConcatCTM(context, CGAffineTransformMakeTranslation(-center.x, -center.y));
    
    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 100, 100);
    
//    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextAddArc(context, 50, 50, 48, M_PI_4, -M_PI_2, 1);
    
    
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
}


@end
