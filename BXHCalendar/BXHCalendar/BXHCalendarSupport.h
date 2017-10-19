//
//  BXHCalendarSupport.h
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#ifndef BXHCalendarSupport_h
#define BXHCalendarSupport_h

#import "NSDate+BXHCategory.h"
#import "NSDate+BXHCalendar.h"

typedef NS_ENUM(NSInteger, BXHCalendarDisplayType)
{
    BXHCalendarDisplayMonthType,
    BXHCalendarDisplayWeekType
};

@class BXHCalendarView,BXHCalendarMonthView,BXHCalendarDayView;
@protocol BXHCalendarViewDataSource <NSObject>

- (void)calendarView:(BXHCalendarView *)calendarView willShowMonthView:(BXHCalendarMonthView *)monthView;

- (void)calendarView:(BXHCalendarView *)calendarView dayViewHaveEvent:(BXHCalendarDayView *)dayView;

@end

@protocol BXHCalendarViewDelegate <NSObject>

- (void)calendarView:(BXHCalendarView *)calendarView didSelectDayView:(BXHCalendarDayView *)dayView;

@end

//==============color=================//
#define Calendar_DayView_SelectColor [UIColor redColor]
#define Calendar_DayView_PointColor [UIColor grayColor]
#define Calendar_DayView_TextColor [UIColor darkTextColor]
#define Calendar_DayView_NOMonthTextColor [UIColor grayColor]

#define Calendar_MonthView_BackgroundColor [UIColor whiteColor]

#define Calendar_WeekendView_TextColor [UIColor darkTextColor]

//===============Font=================//
#define CalendarFont(size) [UIFont systemFontOfSize:size]

#define Calendar_DayView_TextFont CalendarFont(14)

#define Calendar_WeekendView_TextFont CalendarFont(15)

//===============const=============//
#define CalendarScrollTime 0.2

#endif /* BXHCalendarSupport_h */
