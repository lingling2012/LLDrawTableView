//
//  CustomFooter.m
//  CoolTableView
//
//  Created by chenzefeng on 13-5-31.
//  Copyright (c) 2013年 com.lingling2012. All rights reserved.
//

#import "CustomFooter.h"
#import "Common.h"

@implementation CustomFooter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor *lightGrayColor = [UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1.0];
    UIColor *darkGrayColor = [UIColor colorWithRed:187.0f/255.0f green:187.0f/255.0f blue:187.0f/255.0f alpha:1.0];
    UIColor *shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    
    CGFloat paperMargin = 9.0;
    CGRect paperRect = CGRectMake(self.bounds.origin.x+paperMargin,
                                  self.bounds.origin.y,
                                  self.bounds.size.width-paperMargin*2,
                                  self.bounds.size.height);
    
    CGRect arcRect = paperRect;
    arcRect.size.height = 8;
    
    CGContextSaveGState(context);
    CGMutablePathRef arcPath = createArcPathFromBottomOfRect(arcRect, 4.0);
    CGContextAddPath(context, arcPath);
    CGContextClip(context);
    drawLinearGradient(context, paperRect, lightGrayColor.CGColor, darkGrayColor.CGColor);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGPoint pointA = CGPointMake(arcRect.origin.x, arcRect.origin.y + arcRect.size.height-1);
    CGPoint pointB = CGPointMake(arcRect.origin.x, arcRect.origin.y);
    CGPoint pointC = CGPointMake(arcRect.origin.x + arcRect.size.width-1, arcRect.origin.y);
    CGPoint pointD = CGPointMake(arcRect.origin.x + arcRect.size.width-1, arcRect.origin.y + arcRect.size.height-1);
    draw1PxStroke(context, pointA, pointB, whiteColor.CGColor);
    draw1PxStroke(context, pointC, pointD, whiteColor.CGColor);
    CGContextRestoreGState(context);
    

    CGContextAddRect(context, paperRect);
    CGContextAddPath(context, arcPath);
    CGContextEOClip(context);
    CGContextAddPath(context, arcPath);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor.CGColor);
    CGContextFillPath(context);

    CFRelease(arcPath);
}


@end
