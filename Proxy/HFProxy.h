//
//  HFProxy.h
//  Proxy
//
//  Created by zack on 2017/7/3.
//  Copyright © 2017年 CoderHF. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol HFProxyDelegate <NSObject>

- (void)injectDependencyObject:(id)object forProtocol:(Protocol *)protocol;

@end
//@interface HFProxy : NSProxy<HFProxyDelegate>
//- (id)init;
//@end

extern id/**<HFProxyDelegate>*/ XXDIProxyCreate();
