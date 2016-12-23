//
//  SKRow.m
//  SectionAndRow
//
//  Created by Mr.He on 2016/9/23.
//  Copyright © 2016年 HomeKing. All rights reserved.
//

#import "SKRow.h"

@implementation SKRow

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier data:(id)data rowHeight:(float)rowHeight {
    if (self = [super init]) {
        self.cellIdentifier = cellIdentifier;
        self.data = data;
        self.rowHeight = rowHeight;
    }
    return self;
}

@end
