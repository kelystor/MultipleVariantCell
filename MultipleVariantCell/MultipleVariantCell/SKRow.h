//
//  SKRow.h
//  SectionAndRow
//
//  Created by Mr.He on 2016/9/23.
//  Copyright © 2016年 HomeKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKRow : NSObject

@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, strong) id data;
@property (nonatomic, assign) float rowHeight;

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier
                                  data:(id)data
                             rowHeight:(float)rowHeight;

@end
