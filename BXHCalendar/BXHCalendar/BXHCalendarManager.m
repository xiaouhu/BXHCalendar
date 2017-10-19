//
//  BXHCalendarManager.m
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/19.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHCalendarManager.h"

@implementation BXHCalendarManager
static BXHCalendarManager *manager;
+ (BXHCalendarManager *)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BXHCalendarManager alloc] init];
    });
    return manager;
}

+ (void)releaseManage
{
    manager = nil;
}

@end
