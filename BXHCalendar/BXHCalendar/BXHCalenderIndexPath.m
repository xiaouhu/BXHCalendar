//
//  BXHCalenderIndexPath.m
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHCalenderIndexPath.h"

@implementation BXHCalenderIndexPath

+ (BXHCalenderIndexPath *)indextPathWithLine:(NSInteger)line andRow:(NSInteger)row
{
    BXHCalenderIndexPath *indexPath = [[BXHCalenderIndexPath alloc] init];
    indexPath -> _line = line;
    indexPath -> _row = row;
    return indexPath;
}

@end
