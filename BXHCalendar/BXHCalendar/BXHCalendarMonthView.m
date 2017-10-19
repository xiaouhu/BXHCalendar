//
//  BXHCalendarMothView.m
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHCalendarMonthView.h"
#import "NSDate+BXHCategory.h"
#import "BXHCalendarManager.h"
#import <objc/runtime.h>

static int DayViewIndexPath;

@interface BXHCalendarDayView (BXHCalendarIndexPath)

@property (nonatomic, strong) BXHCalenderIndexPath *indexPath;

@end

@implementation BXHCalendarDayView (BXHCalendarIndexPath)

- (void)setIndexPath:(BXHCalenderIndexPath *)indexPath
{
    objc_setAssociatedObject(self, &DayViewIndexPath, indexPath, OBJC_ASSOCIATION_RETAIN);
}

- (BXHCalenderIndexPath *)indexPath
{
    return objc_getAssociatedObject(self, &DayViewIndexPath);
}

@end

@interface BXHCalendarMonthView ()
{
    NSMutableArray *_showDaysAry;
}
@property (nonatomic, strong) NSMutableDictionary <NSString *, BXHCalendarDayView *>*dayViewMap;

@end


@implementation BXHCalendarMonthView

- (void)dealloc
{
    _showDaysAry = nil;
    self.dayViewMap = nil;
}

- (instancetype)initWithCalendarLayout:(BXHCalendarLayout *)layout
{
    if (self = [super init])
    {
        _layout = layout;
        _layout.monthView = self;
        _showDaysAry = [NSMutableArray arrayWithCapacity:42];

        self.clipsToBounds = YES;
        self.backgroundColor = Calendar_MonthView_BackgroundColor;
        self.weekLine = 0;
        self.dayViewMap = [NSMutableDictionary dictionaryWithCapacity:42];
        [self creatDayView];
        [self fetchShowDayView];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    [self reload];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeTouches)
    {
        BOOL inside = [super pointInside:point withEvent:event];
        if (!inside) return nil;
        for (BXHCalendarDayView *dayView in _showDaysAry)
        {
            CGPoint dayPoint = [self convertPoint:point toView:dayView];
            if ([dayView pointInside:dayPoint withEvent:event])
            {
                return dayView;
            }
        }
        return [super hitTest:point withEvent:event];
    }
    else
    {
        return [super hitTest:point withEvent:event];
    }
}

#pragma mark - public
- (void)reload
{
    [self prepareLayout];
}

- (void)reloadWithBegainDate:(NSDate *)date
{
    _beaginDate = date;
    [self prepareLayout];
}

- (BXHCalendarDayView *)dayViewWithIndexPath:(BXHCalenderIndexPath *)indexPath
{
   return [self.dayViewMap objectForKey:[self mapKeyWithIndexPath:indexPath]];
}

- (void)changeDisplayTypeWithAnimate:(BOOL)animate
{
    CGRect frame = self.frame;
    if ([BXHCalendarManager defaultManager].displayType == BXHCalendarDisplayMonthType)
    {
        frame.size.height = _layout.itemSize.height * 6;
    }
    else
    {
        frame.size.height = _layout.itemSize.height;
    }
    if (animate)
    {
        [UIView animateWithDuration:0.3 animations:^{
            [self fetchShowDayView];
            self.frame = frame;
            [self prepareLayout];
        }];
    }
    else
    {
        [self fetchShowDayView];
        self.frame = frame;
        [self prepareLayout];
    }
}

#pragma mark - private
- (void)fetchShowDayView
{
    [_showDaysAry removeAllObjects];
    if ([BXHCalendarManager defaultManager].displayType == BXHCalendarDisplayMonthType)
    {
        [self.dayViewMap enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, BXHCalendarDayView * _Nonnull obj, BOOL * _Nonnull stop) {
            [_showDaysAry addObject:obj];
        }];
    }
    else
    {
        [self.dayViewMap enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, BXHCalendarDayView * _Nonnull obj, BOOL * _Nonnull stop) {
            BOOL show = obj.indexPath.line == self.weekLine;
            if (show)
            {
               [_showDaysAry addObject:obj];
            }
            else
            {
                CGRect frame = obj.frame;
                frame.origin = CGPointMake(self.center.x - frame.size.width / 2, self.center.y - frame.size.height / 2);
                    obj.frame = frame;
            }
        }];
    }
}

- (void)prepareLayout
{
    self.weekLine = 0;
    NSInteger weekDay = _beaginDate.weekday;
    for (BXHCalendarDayView *dayView in _showDaysAry)
    {
        dayView.month = _beaginDate.month;
        if ([BXHCalendarManager defaultManager].displayType == BXHCalendarDisplayMonthType)
        {
            dayView.date = [_beaginDate bxh_dateByAddingDays:dayView.indexPath.line * 7 + dayView.indexPath.row - weekDay + 1];
            dayView.selected = [dayView.date isSameDayToDate:[BXHCalendarManager defaultManager].selectDate] && dayView.date.month == _beaginDate.month;
        }
        else
        {
            dayView.date = [_beaginDate bxh_dateByAddingDays:dayView.indexPath.row];
            dayView.selected = [dayView.date isSameDayToDate:[BXHCalendarManager defaultManager].selectDate];
        }
   
        if ([[BXHCalendarManager defaultManager].dataSource respondsToSelector:@selector(calendarView:dayViewHaveEvent:)])
        {
            [[BXHCalendarManager defaultManager].dataSource calendarView:[BXHCalendarManager defaultManager].calendarView dayViewHaveEvent:dayView];
        }
        if (dayView.selected)
        {
            self.weekLine = dayView.indexPath.line;
        }
        dayView.frame = [self.layout dayViewFrameAtIndexPath:dayView.indexPath];
    }
}

- (void)creatDayView
{
    for (int i = 0; i < 6; i++)
    {
        for (int j = 0; j < 7; j++)
        {
            BXHCalenderIndexPath *indexPath = [BXHCalenderIndexPath indextPathWithLine:i andRow:j];
            BXHCalendarDayView *dayView = [[BXHCalendarDayView alloc] init];
            [dayView addTarget:self action:@selector(dayViewAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:dayView];
            [dayView setIndexPath:indexPath];
            [self.dayViewMap setObject:dayView forKey:[self mapKeyWithIndexPath:indexPath]];
        }
    }
}

- (NSString *)mapKeyWithIndexPath:(BXHCalenderIndexPath *)indexPath
{
    return [NSString stringWithFormat:@"line = %ld row = %ld",indexPath.line,indexPath.row];
}

#pragma mark - action
- (void)dayViewAction:(BXHCalendarDayView *)dayView
{
    if(dayView.selected || ([BXHCalendarManager defaultManager].displayType == BXHCalendarDisplayMonthType && dayView.date.month != self.beaginDate.month)) return;
    dayView.selected = YES;
    self.weekLine = dayView.indexPath.line;
    if ([[BXHCalendarManager defaultManager].delegate respondsToSelector:@selector(calendarView:didSelectDayView:)])
    {
        [[BXHCalendarManager defaultManager].delegate calendarView:[BXHCalendarManager defaultManager].calendarView didSelectDayView:dayView];
    }
}

#pragma mark - get
- (NSArray<BXHCalendarDayView *> *)allDayView
{
    return _showDaysAry.copy;
}

@end
