//
//  HJTNotification.h
//  safePro
//
//  Created by Keje on 2017/4/5.
//  Copyright © 2017年 kj. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HJTNotificationDelegate <NSObject>

@optional
- (void)HJTNotificationDidClickWithMsg:(NSString *)msg;
- (void)HJTNotificationClickWithKey:(NSString *)key;

@end



@interface HJTNotification : NSObject
/**
 *  通知
 *
 *  @param title    通知的标题
 *  @param msg      通知的内容
 */
+ (void)HJT_notificationWithTitle:(NSString *)title msg:(NSString *)msg;
/**
 *  dismiss 通知
 */
+ (void)dismiss;
/**
 *  设置代理
 *
 *  @param delegate 代理对象
 */
+ (void)setDelegate:(id<HJTNotificationDelegate>)delegate;

/**
 *  设置通知栏是否显示(容易递归,建议使用默认)
 *
 *  @param enable 默认为不显示
 */
+ (void)setBackgroundNotiEnable:(BOOL)enable;

/**
 *  设置是否播放系统声音
 *
 *  @param enable 默认为播放
 */
+ (void)setPlaySystemSound:(BOOL)enable;

@property (nonatomic, copy) NSString *clicKey;
+(void)setClicKey:(NSString *)clicKey;

@end
