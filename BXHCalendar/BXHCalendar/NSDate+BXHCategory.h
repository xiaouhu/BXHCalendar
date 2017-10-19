//
//  NSDate+BXHCategory.h
//  BXHCategory
//
//  Created by 步晓虎 on 2017/9/11.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSDate (BXHCategory)
//年
@property (nonatomic, readonly, assign) NSInteger year;
//月
@property (nonatomic, readonly, assign) NSInteger month;
//日
@property (nonatomic, readonly, assign) NSInteger day;
//时
@property (nonatomic, readonly, assign) NSInteger hour;
//分
@property (nonatomic, readonly, assign) NSInteger minute;
//秒
@property (nonatomic, readonly, assign) NSInteger second;
//纳秒
@property (nonatomic, readonly, assign) NSInteger nanosecond;
//周几 1 - 7 first day is based on user setting
@property (nonatomic, readonly, assign) NSInteger weekday;
//第几周
@property (nonatomic, readonly, assign) NSInteger weekdayOrdinal;
//月包含几周 1~5
@property (nonatomic, readonly, assign) NSInteger weekOfMonth;
//年包含的周
@property (nonatomic, readonly, assign) NSInteger weekOfYear;
//
@property (nonatomic, readonly, assign) NSInteger yearForWeekOfYear;
//刻钟  1=15分钟
@property (nonatomic, readonly, assign) NSInteger quarter;

//是否是闰月
@property (nonatomic, readonly, assign) BOOL isLeapMonth;
//是否是闰年
@property (nonatomic, readonly, assign) BOOL isLeapYear;
//是否是今天
@property (nonatomic, readonly, assign) BOOL isToday;
//是否是昨天
@property (nonatomic, readonly, assign) BOOL isYesterDay;
//是否是明天
@property (nonatomic, readonly, assign) BOOL isTomorrowDay;

+ (NSDate *)bxh_dateWithJavaTimestamp:(NSTimeInterval)timestamp;

- (NSTimeInterval)bxh_javaTimestamp;

//=====================method formate==================//
//date转成string
- (NSString *)bxh_stringWithFormate:(NSString *)formate;
//dateStr从一个格式转成另一个格式
+ (NSString *)bxh_string:(NSString *)dateString
             fromFormate:(NSString *)fromFormate
               toFormate:(NSString *)toFormate;
// Returns a formatted string representing this date.see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
- (NSString *)bxh_stringWithFormate:(NSString *)formate timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
//date初始化根据dateStr
+ (NSDate *)bxh_dateWithString:(NSString *)dateString inFormate:(NSString *)formate;

+ (nullable NSDate *)bxh_dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;

//=====================method dateAdd ===========//
//当前日期加几年
- (NSDate *)bxh_dateByAddingYears:(NSInteger)years;
//当前日期减几年
- (NSDate *)bxh_dateByMinusYears:(NSInteger)years;
//当前日期加几月
- (NSDate *)bxh_dateByAddingMonths:(NSInteger)months;
//当前日期减几月
- (NSDate *)bxh_dateByMinusMonths:(NSInteger)months;
//当前日期加几周
- (NSDate *)bxh_dateByAddingWeeks:(NSInteger)weeks;
//当前日期减几周
- (NSDate *)bxh_dateByMinusWeeks:(NSInteger)weeks;
//当前日期加几天
- (NSDate *)bxh_dateByAddingDays:(NSInteger)days;
//当前日期减几天
- (NSDate *)bxh_dateByMinusDays:(NSInteger)days;
//当前日期加几小时
- (NSDate *)bxh_dateByAddingHours:(NSInteger)hours;
//当前日期减几小时
- (NSDate *)bxh_dateByMinusHours:(NSInteger)hours;
//当前日期加几分钟
- (NSDate *)bxh_dateByAddingMinutes:(NSInteger)minutes;
//当前日期减几分钟
- (NSDate *)bxh_dateByMinusMinutes:(NSInteger)minutes;
//当前日期加几秒
- (NSDate *)bxh_dateByAddingSeconds:(NSInteger)seconds;
//当前日期减几秒
- (NSDate *)bxh_dateByMinusSeconds:(NSInteger)seconds;

//=======================method compare================//
/**
 *  两个日期之间相差的年数
 *
 *  @param fromDateTime 开始日期
 *  @param toDateTime   结束日期
 *
 *  @return 天数
 */
+ (NSInteger)bxh_yearsBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime;

/**
 *  两个日期之间相差的月数
 *
 *  @param fromDateTime 开始日期
 *  @param toDateTime   结束日期
 *
 *  @return 天数
 */
+ (NSInteger)bxh_monthsBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime;

/**
 *  两个日期之间相差的天数
 *
 *  @param fromDateTime 开始日期
 *  @param toDateTime   结束日期
 *
 *  @return 天数
 */
+ (NSInteger)bxh_daysBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime;

/**
 *  两个日期之间相差的分钟
 *
 *  @param fromDateTime 开始日期
 *  @param toDateTime   结束日期
 *
 *  @return 分钟
 */
+ (NSInteger)bxh_minutesBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime;

/**
 *  两个日期之间相差的秒数
 *
 *  @param fromDateTime 开始日期
 *  @param toDateTime   结束日期
 *
 *  @return 秒数
 */
+ (NSInteger)bxh_secondsBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime;

@end
NS_ASSUME_NONNULL_END

