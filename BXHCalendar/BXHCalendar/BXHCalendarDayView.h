//
//  BXHCalendarDayView.h
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BXHCalendarDayView : UIControl

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, assign) BOOL haveEvent;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, assign) NSInteger month;

@end
