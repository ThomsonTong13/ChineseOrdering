//
//  Pinyin.h
//  Miban
//
//  Created by Thomson on 15/10/9.
//  Copyright © 2015年 Kemi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ALPHA	@"ABCDEFGHIJKLMNOPQRSTUVWXYZ#"

@interface Pinyin : NSObject

char pinyinFirstLetter(unsigned short hanzi);

@end
