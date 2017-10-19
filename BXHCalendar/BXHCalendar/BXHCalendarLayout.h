//
//  BXHCalendarLayout.h
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BXHCalenderIndexPath.h"


@class BXHCalendarMonthView;

@interface BXHCalendarLayout : NSObject

@property (nonatomic, assign) CGFloat lineSpace;//default 1

@property (nonatomic, assign) CGFloat interimSpace; // default 1

//default width = (monthView.width - line * 6) / 7  height = (monthView.height - interimspace * 6) / 7
@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic, weak) BXHCalendarMonthView *monthView;

- (CGRect)dayViewFrameAtIndexPath:(BXHCalenderIndexPath *)indexPath;

@end
