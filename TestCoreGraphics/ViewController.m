//
//  ViewController.m
//  TestCoreGraphics
//
//  Created by Alexander on 27.10.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"


UIImage* colorizeImage(UIImage *image, UIColor* color){
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -area.size.height);
    CGContextSaveGState(context);
    
    CGContextClipToMask(context, area, image.CGImage);
    [color set];
    CGContextFillRect(context, area);
    
    CGContextRestoreGState(context);
    
    CGContextSetBlendMode(context, kCGBlendModeLighten);
    CGContextDrawImage(context, area, image.CGImage);
    
    UIImage *colorizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return colorizedImage;
}


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *img = [UIImage imageNamed:@"3.jpg"];
    img = colorizeImage(img, [UIColor redColor]);
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
//    [self.view addSubview:imgView];
}


+ (UIImage*)verticalGradientWithColor1:(UIColor*)color1 color2:(UIColor*)color2
{
    CGSize sizeImage = CGSizeMake(10, 10);
    UIGraphicsBeginImageContextWithOptions(sizeImage, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat r1, g1, b1, a1, r2, g2, b2, a2;
    [color1 getRed: &r1 green:&g1 blue:&b1 alpha:&a1];
    [color2 getRed: &r2 green:&g2 blue:&b2 alpha:&a2];
    CGFloat colors [] = {
        r1, g1, b1, a1,
        r2, g2, b2, a2
    };
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors, NULL, 2);
    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(5, 0), CGPointMake(5, 10), 0);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGGradientRelease(gradient);
    
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
