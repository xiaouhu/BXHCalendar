//
//  ViewController.m
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/17.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "ViewController.h"
#import "BXHCalendarView.h"
#import "NSDate+BXHCalendar.h"
#import "NSDate+BXHCategory.h"

@interface ViewController () <BXHCalendarViewDataSource,BXHCalendarViewDelegate>

@property (nonatomic, strong) BXHCalendarView *calendarView;

@property (nonatomic, strong) UIButton *todayBtn;

@property (nonatomic, strong) UIButton *typeButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = [[NSDate date] bxh_stringWithFormate:@"yyyy-MM-dd"];
    
    CGFloat itemWH = self.view.frame.size.width / 7;
    self.calendarView = [[BXHCalendarView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, itemWH * CalendarDayView_HW_Ration * 6 + 30)];
    self.calendarView.dataSource = self;
    self.calendarView.delegate = self;
    [self.view addSubview:self.calendarView];
    
    self.todayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.todayBtn setTitle:@"Today" forState:UIControlStateNormal];
    [self.todayBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.todayBtn addTarget:self action:@selector(todayButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.todayBtn];
    
    self.typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.typeButton setTitle:@"Type" forState:UIControlStateNormal];
    [self.typeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.typeButton addTarget:self action:@selector(typeBUttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.typeButton];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillLayoutSubviews
{
    self.todayBtn.frame = CGRectMake(30, CGRectGetMaxY(self.calendarView.frame) + 10, 80, 30);
    self.typeButton.frame = CGRectMake(150, CGRectGetMaxY(self.calendarView.frame) + 10, 80, 30);

    [super viewWillLayoutSubviews];
}

- (void)todayButtonAction
{
    [self.calendarView goToToday];
}

- (void)typeBUttonAction
{
    CGFloat itemWH = self.view.frame.size.width / 7;
    BXHCalendarDisplayType type = self.calendarView.displayType == BXHCalendarDisplayWeekType ? BXHCalendarDisplayMonthType : BXHCalendarDisplayWeekType;
    [self.calendarView changeDisplayType:type animated:YES];
    CGRect frame = self.calendarView.frame;
    if (type == BXHCalendarDisplayWeekType)
    {
        frame.size.height = itemWH + 30;
    }
    else
    {
        frame.size.height = itemWH * CalendarDayView_HW_Ration * 6 + 30;
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.calendarView.frame = frame;
    }];

}

- (void)calendarView:(BXHCalendarView *)calendarView willShowMonthView:(BXHCalendarMonthView *)monthView
{
    self.title = [NSString stringWithFormat:@"%@",[monthView.beaginDate bxh_stringWithFormate:@"yyyy-MM"]];
}

- (void)calendarView:(BXHCalendarView *)calendarView dayViewHaveEvent:(BXHCalendarDayView *)dayView
{
    dayView.haveEvent = dayView.date.day % 3 == 0;
}

- (void)calendarView:(BXHCalendarView *)calendarView didSelectDayView:(BXHCalendarDayView *)dayView
{
        
    NSLog(@"select %@",[dayView.date bxh_stringWithFormate:@"yyyy-MM-dd"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
