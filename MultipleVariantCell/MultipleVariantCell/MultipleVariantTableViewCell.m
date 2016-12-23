//
//  MultipleVariantTableViewCell.m
//  MultipleVariantCell
//
//  Created by Zeng on 23/12/2016.
//  Copyright © 2016 Zeng. All rights reserved.
//

#import "MultipleVariantTableViewCell.h"

@implementation MultipleVariantBasicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
		label.numberOfLines = 0;
		[self.contentView addSubview:label];
		self.titleTextLabel = label;
	}
	return self;
}

@end

@implementation CycleImagesTableViewCell
@end

@implementation MainTitleTableViewCell
@end

@implementation SubTitleTableViewCell
@end

@implementation PriceTableViewCell
@end

@implementation SalePromotionTableViewCell
@end

@implementation QuanTableViewCell
@end

@implementation SpecificationTableViewCell
@end

@implementation CommentSummaryTableViewCell
@end

// 评论内容cell使用Auto Layout，配合iOS 8 TableView的自动算高，实现内容自适应
@implementation CommentContentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.titleTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.titleTextLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 8;
		NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.titleTextLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:4.0f];
		NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.titleTextLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-4.0f];
		NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.titleTextLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:4.0f];
		NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.titleTextLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-4.0f];
		[self.contentView addConstraints:@[leftConstraint, rightConstraint, topConstraint, bottomConstraint]];
	}
	return self;
}

@end

@implementation AllCommentTableViewCell
@end

@implementation NoCommentTableViewCell
@end

@implementation RecommentTableViewCell
@end

@implementation RecommentContentTableViewCell
@end
