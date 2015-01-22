//
//  ZJToast.h
//  ZJToolDemo
//
//  Created by Nick on 15-1-22.
//  Copyright (c) 2015年 onebyte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJToast : NSObject

//@property (nonatomic, assign) BOOL shouldWait;//是否等待前面的消息。。。不等待直接不提示，等待前面的显示完则立即显示 默认不等待

//+ (Toast *)makeText:(NSString *)text;
//- (void)show;
//- (void)showInView:(UIView *)view;
//- (void)cancel;

+(void)showToast;
@end


extern const NSUInteger ZJToastDurationShort;
extern const NSUInteger ZJToastDurationNormal;
extern const NSUInteger ZJToastDurationLong;