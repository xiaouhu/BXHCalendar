//
//  BXHCalendarLayout.m
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHCalendarLayout.h"
#import "BXHCalendarManager.h"

@implementation BXHCalendarLayout

- (instancetype)init
{
    if (self = [super init])
    {
        self.lineSpace = 0;
        self.interimSpace = 0;
    }
    return self;
}

- (CGRect)dayViewFrameAtIndexPath:(BXHCalenderIndexPath *)indexPath
{
    if ([BXHCalendarManager defaultManager].displayType == BXHCalendarDisplayMonthType)
    {
        return CGRectMake(indexPath.row * (self.itemSize.width + self.interimSpace), indexPath.line * (self.itemSize.height + self.lineSpace), self.itemSize.width, self.itemSize.height);
    }
    else
    {
        return CGRectMake(indexPath.row * (self.itemSize.width + self.interimSpace), 0, self.itemSize.width, self.itemSize.height);
    }
}

@end
