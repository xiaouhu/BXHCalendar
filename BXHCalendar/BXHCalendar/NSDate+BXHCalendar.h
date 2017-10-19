//
//  NSDate+BXHCalendar.h
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BXHCalendar)

- (NSInteger)dayNumOfCurrentMonth;

- (NSDate *)dateWithMonthBegainDate;

- (NSDate *)dateWithWeekBegainDate;

- (BOOL)isSameDayToDate:(NSDate *)date;

@end
