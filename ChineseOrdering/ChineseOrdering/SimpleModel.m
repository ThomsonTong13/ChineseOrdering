//
//  SimpleModel.m
//  ChineseOrdering
//
//  Created by Thomson on 15/12/2.
//  Copyright © 2015年 KEMI. All rights reserved.
//

#import "SimpleModel.h"

@interface SimpleModel ()

@property (nonatomic, strong, readwrite) NSString *userID;
@property (nonatomic, strong, readwrite) NSString *nickname;
@property (nonatomic, strong, readwrite) NSString *avatar; // 缩略图
@property (nonatomic, strong, readwrite) NSNumber *friendship;

@end

@implementation SimpleModel

+ (instancetype)modelVOWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) return nil;

    SimpleModel *model = [[SimpleModel alloc] init];

    if (model)
    {
        model.userID = @"";
        model.avatar = @"";
        model.friendship = @(0);
        model.nickname = dictionary[kUsername];
    }

    return model;
}

- (NSString *)description
{
    return self.nickname;
}

@end
