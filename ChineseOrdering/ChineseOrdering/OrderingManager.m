//
//  OrderingManager.m
//  ChineseOrdering
//
//  Created by Thomson on 15/12/2.
//  Copyright © 2015年 KEMI. All rights reserved.
//

#import "OrderingManager.h"

@interface OrderingManager ()

@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSString *pinYin;

@end

@implementation OrderingManager

#pragma mark - Public Methods

+ (NSMutableArray *)orderingInitialsWithArray:(NSArray *)array
{
    NSMutableArray *models = [self orderingModels:array];
    NSMutableArray *orderedModels = [[NSMutableArray alloc] initWithCapacity:0];

    NSString *tempStr;

    for (OrderingManager *manager in models)
    {
        NSString *pinyin = [manager.pinYin substringToIndex:1];
        //不同
        if (![tempStr isEqualToString:pinyin])
        {
            [orderedModels addObject:pinyin];

            tempStr = pinyin;
        }
    }

    return orderedModels;
}

+ (NSMutableArray *)orderingWithArray:(NSArray *)array
{
    NSMutableArray *models = [self orderingModels:array];
    NSMutableArray *orderedModels = [[NSMutableArray alloc] initWithCapacity:0];

    NSString *tempStr;

    for (OrderingManager *manager in models)
    {
        SimpleModel *model = manager.model;
        [orderedModels addObject:model];

        NSString *pinyin = [manager.pinYin substringToIndex:1];
        if (![tempStr isEqualToString:pinyin]) tempStr = pinyin;
    }

    return orderedModels;
}

#pragma mark - Private Methods

/**
 *  返回排序好的字符拼音
 *
 */
+ (NSMutableArray *)orderingModels:(NSArray *)models
{
    //获取字符串中文字的拼音首字母并与字符串共同存放
    NSMutableArray *modelsM = [NSMutableArray array];

    for (int i = 0; i < [models count]; i++)
    {
        OrderingManager *manager = [[OrderingManager alloc] init];

        SimpleModel *model = [models objectAtIndex:i];
        manager.model = model;
        manager.string = [NSString stringWithString:model.nickname];
        if (manager.string == nil) manager.string=@"";

        //去除两端空格和回车
        manager.string = [manager.string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        manager.string = [OrderingManager removeSpecialCharacter:manager.string];

        //判断首字符是否为字母
        NSString *regex = @"[A-Za-z]+";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];

        NSString *initialStr = [manager.string length] ? [manager.string substringToIndex:1] : @"";
        if ([predicate evaluateWithObject:initialStr])
        {
            manager.pinYin = [manager.string capitalizedString] ;
        }
        else
        {
            if (![manager.string isEqualToString:@""])
            {
                NSString *pinYinResult=[NSString string];

                for (int j = 0; j < manager.string.length; j++)
                {
                    NSString *singlePinyinLetter = [[NSString stringWithFormat:@"%c",
                                                     pinyinFirstLetter([manager.string characterAtIndex:j])] uppercaseString];
                    pinYinResult = [pinYinResult stringByAppendingString:singlePinyinLetter];
                }

                manager.pinYin = pinYinResult;
            }
            else
            {
                manager.pinYin = @"";
            }
        }

        [modelsM addObject:manager];
    }

    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
    [modelsM sortUsingDescriptors:sortDescriptors];

    return modelsM;
}

/**
 * 过滤指定字符串里面的指定字符根据自己的需要添加
 */
+ (NSString *)removeSpecialCharacter:(NSString *)character
{
    NSRange urgentRange = [character rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@",.？、 ~￥#&<>《》()[]{}【】^@/￡¤|§¨「」『』￠￢￣~@#&*（）——+|《》$_€"]];

    if (urgentRange.location != NSNotFound)
    {
        return [self removeSpecialCharacter:[character stringByReplacingCharactersInRange:urgentRange withString:@""]];
    }

    return character;
}

@end
