//
//  ViewController.m
//  ChineseOrdering
//
//  Created by Thomson on 15/12/2.
//  Copyright © 2015年 KEMI. All rights reserved.
//

#import "ViewController.h"

#import "SimpleModel.h"
#import "OrderingManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *models = @[
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"火女" }],
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"小牛" }],
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"大牛" }],
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"剑圣" }],
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"影魔" }],
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"阿卡莎" }],
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"沙王" }],
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"小小" }],
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"虚空假面" }],
                        [SimpleModel modelVOWithDictionary:@{ kUsername: @"白牛" }]
                        ];

    NSArray *sortModels = [OrderingManager orderingWithArray:models];
    NSArray *sortInitials = [OrderingManager orderingInitialsWithArray:models];
    NSLog(@"sortModels = %@, sortInitials = %@", sortModels, sortInitials);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
