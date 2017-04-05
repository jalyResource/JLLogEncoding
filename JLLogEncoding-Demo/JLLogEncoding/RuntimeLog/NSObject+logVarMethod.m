//
//  NSObject+logVarMethod.m
//  Effective OC 52
//
//  Created by kfz on 2017/3/22.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "NSObject+logVarMethod.h"
#import <objc/objc-runtime.h>

//#define DEBUG 2

@implementation NSObject (logVarMethod)

+ (void)logMethodList {
#if defined(DEBUG)
    NSLog(@" ------- %@ MethodList------- ", NSStringFromClass([self class]));
    
    unsigned int count = 0;
    Method *methods = class_copyMethodList([self class], &count);
    
    for (unsigned int i = 0; i<count; i++) {
        Method method = methods[i];
        SEL sel = method_getName(method);
        NSString *name = NSStringFromSelector(sel);
        NSLog(@"\t%@", name);
    }
    free(methods);
#endif
}

+ (void)logPropertyList {
#if defined(DEBUG)
    NSLog(@" ------- %@ PropertyList------- ", NSStringFromClass([self class]));
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &count);
    
    for (unsigned int i = 0; i<count; i++) {
        objc_property_t property = propertys[i];
        const char * cName = property_getName(property);
        NSLog(@"\t%s", cName);
    }
    free(propertys);
#endif
}

+ (void)logIvars {
#if defined(DEBUG)
    NSLog(@" ------- %@ Ivars------- ", NSStringFromClass([self class]));
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    for (unsigned int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        const char * cName = ivar_getName(ivar);
        NSLog(@"\t%s", cName);
    }
    free(ivars);
#endif
}

@end
