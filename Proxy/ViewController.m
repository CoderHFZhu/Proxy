//
//  ViewController.m
//  Proxy
//
//  Created by zack on 2017/7/3.
//  Copyright © 2017年 CoderHF. All rights reserved.
//

#import "ViewController.h"
#import "ProxyDelegate.h"
#import "MoreDelegate.h"
#import "HFProxy.h"
#import "Cat.h"
#import "Dog.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];



    Cat *cat = [Cat new];
    Dog *dog = [Dog new];
    
    id<HFProxyDelegate, ProxyDelegate, MoreDelegate> proxy = XXDIProxyCreate();
    
//    HFProxy<HFProxyDelegate,ProxyDelegate> *proxy = [[HFProxy alloc]init];
    [proxy injectDependencyObject:cat forProtocol:@protocol(ProxyDelegate)];
    [proxy introduceSelf];
    [proxy moreJop];
    [proxy injectDependencyObject:dog forProtocol:@protocol(ProxyDelegate)];
    [proxy introduceSelf];
    [proxy moreJop];

    
    
    
    
    
    //    for(NSString *fontfamilyname in [UIFont familyNames])
    //    {
    //        NSLog(@"family:'%@'",fontfamilyname);
    //        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
    //        {
    //            NSLog(@"\tfont:'%@'",fontName);
    //        }
    //        NSLog(@"-------------");
    //    }
    
//    AmericanTypewriter-Bold
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 400)];
    label.text = @"汉体书写信息技术标准相容档案下载使用界面简单 支援服务升级资讯专业制作创意空间快速无线上网㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩AaBbCc ＡａＢｂＣｃ";
    label.numberOfLines = 0;
    UIFont *font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:40];
    if (font) {
        label.font = font;
        [self.view addSubview:label];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


