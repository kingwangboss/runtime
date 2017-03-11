//
//  UIImage+Image.m
//  方法交换
//
//  Created by One'J on 2017/3/11.
//  Copyright © 2017年 One'J. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>

@implementation UIImage (Image)

+(void)load {
    //交换方法
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method oj_imageNamedMethod = class_getClassMethod(self, @selector(oj_ImageNamed:));
    method_exchangeImplementations(imageNamedMethod, oj_imageNamedMethod);
}

+(UIImage *)oj_ImageNamed:(NSString *)name {
    
    UIImage *image = [UIImage oj_ImageNamed:name];
    if (image) {
        NSLog(@"加载成功");
    }else {
        NSLog(@"加载失败");
    }
    return image;
}

@end
