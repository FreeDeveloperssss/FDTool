//
//  NSNull+Safe.h
//  FDTool
//
//  Created by ddSoul on 2019/7/30.
//  Copyright © 2019 dxl. All rights reserved.
//


#import "NSNull+Safe.h"

@implementation NSNull (Safe)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *signature = [super methodSignatureForSelector:sel];
    if (!signature) {
        signature = [NSMethodSignature signatureWithObjCTypes:@encode(void)];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
}

@end
