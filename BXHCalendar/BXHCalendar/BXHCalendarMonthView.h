//
//  BXHCalendarMothView.h
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BXHCalendarLayout.h"
#import "BXHCalendarDayView.h"

@interface BXHCalendarMonthView : UIView

@property (nonatomic, readonly, strong) NSArray <BXHCalendarDayView *>*allDayView;

@property (nonatomic, readonly, strong) BXHCalendarLayout *layout;
- (instancetype)initWithCalendarLayout:(BXHCalendarLayout *)layout;

- (void)changeDisplayTypeWithAnimate:(BOOL)animate;

@property (nonatomic, assign) NSInteger weekLine;

@property (nonatomic, strong) NSDate *beaginDate;
- (void)reload;
- (void)reloadWithBegainDate:(NSDate *)date;

- (BXHCalendarDayView *)dayViewWithIndexPath:(BXHCalenderIndexPath *)indexPath;

@end
