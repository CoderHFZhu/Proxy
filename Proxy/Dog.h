//
//  Dog.h
//  Proxy
//
//  Created by zack on 2017/7/3.
//  Copyright © 2017年 CoderHF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProxyDelegate.h"
#import "MoreDelegate.h"
@interface Dog : NSObject<ProxyDelegate,MoreDelegate>

@end
