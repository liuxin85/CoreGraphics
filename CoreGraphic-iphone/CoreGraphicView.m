//
//  CoreGraphicView.m
//  CoreGraphic-iphone
//
//  Created by liuxin on 14-7-25.
//  Copyright (c) 2014年 liu xin. All rights reserved.
//

#import "CoreGraphicView.h"

@implementation CoreGraphicView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)drawEllipseWithGradient: (CGContextRef)context
{
    CGContextSaveGState(context);
    UIGraphicsBeginImageContextWithOptions((self.frame.size), NO, 0.0);
    
    
    CGContextRef newContext = UIGraphicsGetCurrentContext();
    
    // Trnaslate and scale image to compensate for Quartz's inverted coordinate system
    CGContextTranslateCTM(newContext, 0.0, self.frame.size.height);
    CGContextScaleCTM(newContext, 1.0, -1.0);
    
    // Set color of current context
    [[UIColor blackColor]set];
    
    // Draw ellipse
    CGRect ellipseRect = CGRectMake(110.f, 200.f, 100.f, 100.f);
    CGContextFillEllipseInRect(newContext, ellipseRect);
    
    CGImageRef mask = CGBitmapContextCreateImage(UIGraphicsGetCurrentContext());
    UIGraphicsEndImageContext();
    
    CGContextClipToMask(context, self.bounds, mask);
    [self drawGradient:context];
    
    CGContextRestoreGState(context);
    
    
}
- (void)drawGradient: (CGContextRef)context
{
    // Define start and end colors
    CGFloat colors [8] = {
        0.0, 0.0, 1.0, 1.0, // Blue
        0.0, 1.0, 0.0, 1.0}; // Green
    // Setup a color space and gradient space
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors, NULL, 2);
    
    // Define the gradient direction
    CGPoint startPoint = CGPointMake(160.0f, 100.0f);
    CGPoint endPoint = CGPointMake(160.0f, 360.0f);
    
    // Create and Draw the gradient
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
}
- (void)drawTextAtTopOfScreen: (CGContextRef)context
{
    CGContextSaveGState(context);
    
    // Create UIColor to pass into text attributes
    UIColor *textColor = [UIColor colorWithRed:0.80f green:0.85f blue:0.95f alpha:1.0f];
    
    // Set shadow and color of shadow
    CGContextSetShadowWithColor(context, CGSizeZero, 10.0f, [[UIColor blackColor]CGColor]);
    
    // Set font
    UIFont *customFont = [UIFont systemFontOfSize:20.0f];
    
    // Set titleText
    NSString *titleText = @"iOS Graphics!";
    
    [titleText drawAtPoint: CGPointMake(80, 5)
            withAttributes:@{NSFontAttributeName: customFont,
                             NSForegroundColorAttributeName: textColor}];
    CGContextRestoreGState(context);
    
    
}
- (void)drawTriagle: (CGContextRef)context
{
    CGContextSaveGState(context);
    
    // Set color of current context
    [[UIColor colorWithRed: 0.80f green:0.85f blue:0.95f alpha:1.0f]set];
    
    // Draw Triangle
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 140.0, 380.0f);
    CGContextAddLineToPoint(context, 190.0f, 400.0f);
    CGContextAddLineToPoint(context, 140.0f, 420.0f);
    CGContextClosePath(context);
    
    CGContextSetGrayFillColor(context, 0.1f, 0.85f);
    CGContextSetGrayStrokeColor(context, 0.0, 0.0);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
}

- (void)drawArc: (CGContextRef)context
{
    CGContextSaveGState(context);
    
    // Set color of current context
    [[UIColor colorWithRed: 0.30f green:0.30f blue:0.30f alpha:1.0f]set];
    
    // Draw Arc
    CGContextAddArc(context, 160.0f, 250.0f, 70.0f, 0.0f, 3.14, 0);
    CGContextSetLineWidth(context, 50.0f);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextRestoreGState(context);
}
- (void) drawRectangleAtTopOfScreen: (CGContextRef)context
{
    CGContextSaveGState(context);
    
    // Set color of current context
    [[UIColor lightGrayColor]set];
    // Draw rectangle
    CGRect drawingRect = CGRectMake(0.f, 0.f, 320.f, 60.f);
    CGContextFillRect(context, drawingRect);
    
    CGContextRestoreGState(context);
}
- (void) drawEllipse: (CGContextRef)context
{
    CGContextSaveGState(context);
    
    // Set color of current context
    [[UIColor whiteColor]set];
    
    // Set shadow and color of shadow
    CGContextSetShadowWithColor(context, CGSizeZero, 10.0f, [[UIColor blackColor]CGColor]);
    
    
    // Draw ellipse
    CGRect ellipseRect = CGRectMake(60.f, 150.f, 200.f, 200.f);
    CGContextFillEllipseInRect(context, ellipseRect);
    CGContextRestoreGState(context);
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawRectangleAtTopOfScreen: context];
    [self drawEllipse:context];
    [self drawTriagle: context];
    [self drawArc: context];
    [self drawTextAtTopOfScreen: context];
    
    // call function to draw gradient
    //[self drawGradient: context];
    
    // call function to draw ellipse filled with a gradient
    [self drawEllipseWithGradient: context];
    
    if (self.image) {
        CGFloat imageWidth = self.frame.size.width /2;
        CGFloat imageHeight = self.frame.size.height /2;
        CGRect imageRect = CGRectMake(imageWidth, imageHeight, imageWidth, imageHeight);
        
        [self.image drawInRect: imageRect];
    }
      
}

@end
