//
//  BXHCalendarView.h
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BXHCalendarMonthView.h"
#import "BXHWeekendView.h"
#import "BXHCalendarSupport.h"

#define CalendarDayView_HW_Ration 0.7

@interface BXHCalendarView : UIView

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign, readonly) BXHCalendarDisplayType displayType;

@property (nonatomic, weak) id <BXHCalendarViewDataSource>dataSource;

@property (nonatomic, weak) id <BXHCalendarViewDelegate>delegate;

@property (nonatomic, strong) NSDate *calendarSelectDate; //can be nil

- (void)changeDisplayType:(BXHCalendarDisplayType)type animated:(BOOL)animated;

- (void)goToToday;

- (void)reloadEvent;

@end
