//
//  OrderingManager.h
//  ChineseOrdering
//
//  Created by Thomson on 15/12/2.
//  Copyright © 2015年 KEMI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pinyin.h"
#import "SimpleModel.h"

@interface OrderingManager : NSObject

@property (nonatomic, strong) SimpleModel *model;

+ (NSMutableArray *)orderingInitialsWithArray:(NSArray *)array;
+ (NSMutableArray *)orderingWithArray:(NSArray *)array;

@end
