//
//  MultipleVariantTableViewCell.h
//  MultipleVariantCell
//
//  Created by Zeng on 23/12/2016.
//  Copyright © 2016 Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>


//基础cell，这里为了演示简便，定义这个cell，其他cell继承自这个cell
@interface MultipleVariantBasicTableViewCell : UITableViewCell
@property (nonatomic, weak) UILabel *titleTextLabel;
@end

//滚动图片
@interface CycleImagesTableViewCell : MultipleVariantBasicTableViewCell
@end

//正标题
@interface MainTitleTableViewCell : MultipleVariantBasicTableViewCell
@end

//副标题
@interface SubTitleTableViewCell : MultipleVariantBasicTableViewCell
@end

//价格
@interface PriceTableViewCell : MultipleVariantBasicTableViewCell
@end

//促销
@interface SalePromotionTableViewCell : MultipleVariantBasicTableViewCell
@end

//领券
@interface QuanTableViewCell : MultipleVariantBasicTableViewCell
@end

//已选规格
@interface SpecificationTableViewCell : MultipleVariantBasicTableViewCell
@end

//商品评价
@interface CommentSummaryTableViewCell : MultipleVariantBasicTableViewCell
@end

//评价条目
@interface CommentContentTableViewCell : MultipleVariantBasicTableViewCell
@end

//查看所有评价
@interface AllCommentTableViewCell : MultipleVariantBasicTableViewCell
@end

//暂无评价
@interface NoCommentTableViewCell : MultipleVariantBasicTableViewCell
@end

//为您推荐
@interface RecommentTableViewCell : MultipleVariantBasicTableViewCell
@end

//推荐内容
@interface RecommentContentTableViewCell : MultipleVariantBasicTableViewCell
@end
