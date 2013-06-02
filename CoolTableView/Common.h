//
//  Common.h
//  CoolTableView
//
//  Created by chenzefeng on 13-5-29.
//  Copyright (c) 2013年 com.lingling2012. All rights reserved.
//

#import <Foundation/Foundation.h>

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);
CGRect rectFor1PxStroke(CGRect rect);
void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color);
void drawGlossAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor);

static inline double radians(double degress) {
    return degress * M_PI/180;
}

CGMutablePathRef createArcPathFromBottomOfRect(CGRect rect, CGFloat arcHeight);