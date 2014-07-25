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
    
    
    
    
    
}

@end
