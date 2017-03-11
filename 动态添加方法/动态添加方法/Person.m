//
//  Person.m
//  动态添加方法
//
//  Created by One'J on 2017/3/11.
//  Copyright © 2017年 One'J. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>


@implementation Person

void eat(id self,SEL _cmd) {
    NSLog(@"person eat");
}
void eat1(id self,SEL _cmd,NSString *str) {
    NSLog(@"吃了%@次",str);
}



//只要调用未实现的实例方法就会调用这个方法
+(BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == NSSelectorFromString(@"eat")) {
        class_addMethod(self, sel, (IMP)eat, "v@:");
        return YES;
    }else if (sel == NSSelectorFromString(@"eat:")) {
        class_addMethod(self, sel, (IMP)eat1, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

//只要调用未实现的类方法就会调用这个方法
+(BOOL)resolveClassMethod:(SEL)sel {
    if (sel == NSSelectorFromString(@"pao")) {
        IMP imp = imp_implementationWithBlock(^(Class class,SEL sel){
            NSLog(@"pao");
        });
        
        //类方法中objc_getMetaClass(NSStringFromClass(self).UTF8String)拿到原类
        class_addMethod(objc_getMetaClass(NSStringFromClass(self).UTF8String), sel, imp, "v@:");
        return YES;
    }else if (sel == NSSelectorFromString(@"pao:")) {
        
        IMP imp = imp_implementationWithBlock(^(Class class,SEL sel,NSString *str){
            NSLog(@"pao了%@米",str);
        });
        class_addMethod(objc_getMetaClass(NSStringFromClass(self).UTF8String), sel, imp, "v@:@");
        return YES;
    }
    return [super resolveClassMethod:sel];
}



@end
