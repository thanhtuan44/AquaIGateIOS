//
//  HYCircleLoadingView.m
//  HYCircleLoadingViewExample
//
//  Created by Shadow on 14-3-7.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "HYCircleLoadingView.h"

#define ANGLE(a) 2*M_PI/360*a

@interface HYCircleLoadingView ()

//0.0 - 1.0


@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HYCircleLoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.lineColor =[UIColor yellowColor];
        self.lineWidth = 3;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.lineColor = [UIColor yellowColor];
    }
    return self;
}


- (void)startAnimation
{
    if (self.isAnimating)
    {
        [self stopAnimation];
        [self.layer removeAllAnimations];
    }
    _isAnimating = YES;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02f
                                                  target:self
                                                selector:@selector(drawPathAnimation:)
                                                userInfo:nil
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
}

- (void)stopAnimation
{
    _isAnimating = NO;
    
    if ([self.timer isValid])
    {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self stopRotateAnimation];
}

- (void)drawPathAnimation:(NSTimer *)timer
{
    [timer invalidate];
    self.timer = nil;
    [self startRotateAnimation];
    
}

- (void)startRotateAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(2*M_PI);
    animation.duration = 0.7f;
    
    animation.repeatCount = INT_MAX;
    [self.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}

- (void)stopRotateAnimation
{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self.layer removeAllAnimations];
        self.alpha = 1;
    }];
}

- (void)drawRect:(CGRect)rect
{
    for (int i = 0 ; i<=40; ++i) {
        // int i =12;
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, self.lineWidth);
        CGContextSetStrokeColorWithColor(context, [[self getColorForStage:i WithAlpha:0.025 *i] CGColor]);
        CGContextAddArc(context,
                        CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds),
                        CGRectGetWidth(self.bounds)/2-self.lineWidth,
                        ANGLE((i)*8), ANGLE(8*(i+1)),
                        0);
        CGContextStrokePath(context);
    }
    
    
}

-(UIColor *) getColorForStage:(int) currentStage WithAlpha:(double) alpha
{
    return [UIColor colorWithRed:25.0/255.0 green:102.0/255.0 blue:167.0/255.0 alpha:alpha];
}



@end
