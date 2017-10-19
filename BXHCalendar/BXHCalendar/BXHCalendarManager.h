//
//  BXHCalendarManager.h
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/19.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BXHCalendarSupport.h"
#import "BXHCalendarDayView.h"
#import "BXHCalendarMonthView.h"

@interface BXHCalendarManager : NSObject

@property (nonatomic, assign) BXHCalendarDisplayType displayType;

@property (nonatomic, weak) id <BXHCalendarViewDelegate>delegate;

@property (nonatomic, weak) id <BXHCalendarViewDataSource>dataSource;

@property (nonatomic, weak) BXHCalendarDayView *selectDayView;

@property (nonatomic, strong) NSDate *selectDate;

@property (nonatomic, weak) BXHCalendarView *calendarView;

+ (BXHCalendarManager *)defaultManager;

+ (void)releaseManage;

@end
