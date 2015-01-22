//
//  ZJToast.m
//  ZJToolDemo
//
//  Created by Nick on 15-1-22.
//  Copyright (c) 2015年 onebyte. All rights reserved.
//

#import "ZJToast.h"
#import "UIView+ZJFrame.h"

const NSUInteger ZJToastDurationShort  = 1;
const NSUInteger ZJToastDurationNormal = 2;
const NSUInteger ZJToastDurationLong   = 4;

static ZJToast *defaultToast = nil;

@interface ZJToast ()

@property (nonatomic, assign) NSUInteger duration;
@property (nonatomic, strong) UILabel *toastLb;
@property (nonatomic, strong) NSMutableArray *toastTexts;

@end


@implementation ZJToast

+(instancetype)shareToast
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultToast = [[self alloc] init];
    });
    return defaultToast;
}


-(void)showInView :(UIView *)parentView
{
    if (parentView == nil) {
        parentView  = [UIApplication sharedApplication].keyWindow;
    }
    
    [parentView addSubview:self.toastLb];
    self.toastLb.center = parentView.center;
    [self setToastLbText:@"您好您好您好您好您好您好您好您好!"];
    [self fadeToastIn];
    [self performSelector:@selector(fadeToastOut) withObject:nil afterDelay:self.duration];
}

-(void)setToastLbText:(NSString *)text
{
    
    self.toastLb.text = text;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:self.toastLb.font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize size = [text boundingRectWithSize:CGSizeMake(self.toastLb.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
   
    CGRect frame = self.toastLb.frame;
    frame.size.height = size.height < 100 ? 100 : size.height;
    self.toastLb.frame = frame;
}

#pragma mark -
#pragma mark - 动画效果

-(void)fadeToastIn
{
    [UIView animateWithDuration:0.5 animations:^{
        self.toastLb.alpha = 1;
    }];
}

-(void)fadeToastOut
{
    [UIView animateWithDuration:0.5 animations:^{
        self.toastLb.alpha = 0;
    } completion:^(BOOL finished) {
        self.duration = ZJToastDurationNormal;
    }];
}

#pragma mark -
#pragma mark - 类方法
+(void)showToast {
    if (defaultToast == nil) {
        [self shareToast];
    }
    [defaultToast showInView:nil];
}


#pragma mark -
#pragma mark - 属性初始化

-(UILabel *)toastLb
{
    if (_toastLb == nil)
    {
        UIFont *font;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            font = [UIFont systemFontOfSize:16];
        } else {
            font = [UIFont systemFontOfSize:30];
        }
        
        CGSize size = [UIScreen mainScreen].bounds.size;
        _toastLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,size.width/2 ,size.height/3)];
        _toastLb.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.7f];
        _toastLb.textColor = [UIColor whiteColor];
        _toastLb.layer.cornerRadius = 5;
        _toastLb.layer.borderWidth = 0.5;
        _toastLb.layer.masksToBounds = YES;
        _toastLb.numberOfLines = 0;
        _toastLb.font = font;
        _toastLb.textAlignment = NSTextAlignmentCenter;
    }
    
    return _toastLb;
}

-(NSMutableArray *)toastTexts
{
    if (_toastTexts == nil)
    {
        _toastTexts = [NSMutableArray arrayWithCapacity:1];
    }
    return _toastTexts;
}
@end


