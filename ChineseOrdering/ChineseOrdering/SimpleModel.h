//
//  SimpleModel.h
//  ChineseOrdering
//
//  Created by Thomson on 15/12/2.
//  Copyright © 2015年 KEMI. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kUsername @"username"

@interface SimpleModel : NSObject

@property (nonatomic, strong, readonly) NSString *userID;
@property (nonatomic, strong, readonly) NSString *nickname;
@property (nonatomic, strong, readonly) NSString *avatar; // 缩略图
@property (nonatomic, strong, readonly) NSNumber *friendship;

+ (instancetype)modelVOWithDictionary:(NSDictionary *)dictionary;

@end
