//
//  BXHCalenderIndexPath.h
//  BXHCalendar
//
//  Created by 步晓虎 on 2017/10/18.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BXHCalenderIndexPath : NSObject

@property (nonatomic, assign, readonly) NSInteger line;

@property (nonatomic, assign, readonly) NSInteger row;

+ (BXHCalenderIndexPath *)indextPathWithLine:(NSInteger)line andRow:(NSInteger)row;

@end
