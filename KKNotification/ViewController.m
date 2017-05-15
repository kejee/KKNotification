//
//  ViewController.m
//  KKNotification
//
//  Created by Keje on 2017/4/5.
//  Copyright © 2017年 Keje. All rights reserved.
//

#import "ViewController.h"
#import "HJTNotification.h"
@interface ViewController ()<HJTNotificationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    // 监听设备朝向变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChangeNotification) name:UIDeviceOrientationDidChangeNotification object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        [self hjtCallNoti:@"hello"];
    });
}

-(void)hjtCallNoti:(NSString *)message and:(BOOL)is{

//    [HJTNotification setBackgroundNotiEnable:YES];//默认NO
    [HJTNotification HJT_notificationWithTitle:@"你好" msg:message];
    
    if (is) {
        
        [HJTNotification setDelegate:self];//点击代理
    }else{
        [HJTNotification setDelegate:nil];
    }
    
    [HJTNotification setClicKey:@"hiiii"];
}
#pragma mark delegate
-(void)HJTNotificationDidClickWithMsg:(NSString *)msg{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"test" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertController animated:YES completion:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alertController dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

-(void)HJTNotificationClickWithKey:(NSString *)key{
    NSLog(@"%@",key);
}


-(void)orientationDidChangeNotification{
    [HJTNotification dismiss];
}

- (IBAction)didClickDeleg:(id)sender {
    [self hjtCallNoti:@"hello" and:YES];
}


- (IBAction)didClickNone:(id)sender {
    [self hjtCallNoti:@"hello这是一个在前台模仿系统通知样式" and:NO];
}






@end
