//
//  HFProxy.m
//  Proxy
//
//  Created by zack on 2017/7/3.
//  Copyright © 2017年 CoderHF. All rights reserved.
//

#import "HFProxy.h"
@import ObjectiveC;

@interface HFProxy : NSProxy<HFProxyDelegate>
@property (nonatomic, strong) NSMutableDictionary *implementations;
- (id)init;
@end

//@interface HFProxy()
//@property (nonatomic, strong) NSMutableDictionary *implementations;
//@end

@implementation HFProxy


- (id)init
{
    self.implementations = [NSMutableDictionary dictionary];
    return self;
}

- (void)injectDependencyObject:(id)object forProtocol:(Protocol *)protocol
{
    NSParameterAssert(object && protocol);
    NSAssert([object conformsToProtocol:protocol], @"object %@ does not conform to protocol: %@", object, protocol);
    self.implementations[NSStringFromProtocol(protocol)] = object;
}

#pragma mark - Message forwarding

- (BOOL)conformsToProtocol:(Protocol *)aProtocol
{
    for (NSString *protocolName in self.implementations.allKeys) {
        if (protocol_isEqual(aProtocol, NSProtocolFromString(protocolName))) {
            return YES;
        }
    }
    return [super conformsToProtocol:aProtocol];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    for (id object in self.implementations.allValues) {
        if ([object respondsToSelector:sel]) {
            return [object methodSignatureForSelector:sel];
        }
    }
    return [super methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    for (id object in self.implementations.allValues) {
        if ([object respondsToSelector:invocation.selector]) {
            [invocation invokeWithTarget:object];
            return;
        }
    }
    [super forwardInvocation:invocation];
}

@end


id XXDIProxyCreate()
{
    return [[HFProxy alloc] init];
}

