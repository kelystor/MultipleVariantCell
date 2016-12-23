//
//  ViewController.m
//  MultipleVariantCell
//
//  Created by Zeng on 23/12/2016.
//  Copyright © 2016 Zeng. All rights reserved.
//

#import "ViewController.h"
#import "SKRow.h"
#import "MultipleVariantTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIButton *loadDataButton;
@property (nonatomic, strong) NSMutableArray<NSArray<SKRow *> *> *tableSections;

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setupInitData];
	[self setupView];
}

- (void)setupView {
	UIButton *loadDataButton = [UIButton buttonWithType:UIButtonTypeSystem];
	loadDataButton.frame = CGRectMake(120, 20, 160, 44);
	[loadDataButton setTitle:@"随机加载数据" forState:UIControlStateNormal];
	[loadDataButton addTarget:self action:@selector(loadDataFromNetwork) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:loadDataButton];
	self.loadDataButton = loadDataButton;
	
	CGRect tableViewFrame = self.view.bounds;
	tableViewFrame.origin.y = CGRectGetMaxY(self.loadDataButton.frame);
	tableViewFrame.size.height -= CGRectGetMaxY(self.loadDataButton.frame);
	UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStyleGrouped];
	tableView.delegate = self;
	tableView.dataSource = self;
	tableView.estimatedRowHeight = 44;
	tableView.sectionFooterHeight = CGFLOAT_MIN;
	tableView.tableFooterView = [[UIView alloc] init];
	[tableView registerClass:[CycleImagesTableViewCell class] forCellReuseIdentifier:@"CycleImagesCellIdentifier"];
	[tableView registerClass:[MainTitleTableViewCell class] forCellReuseIdentifier:@"MainTitleCellIdentifier"];
	[tableView registerClass:[SubTitleTableViewCell class] forCellReuseIdentifier:@"SubTitleCellIdentifier"];
	[tableView registerClass:[PriceTableViewCell class] forCellReuseIdentifier:@"PriceCellIdentifier"];
	[tableView registerClass:[SalePromotionTableViewCell class] forCellReuseIdentifier:@"SalePromotionCellIdentifier"];
	[tableView registerClass:[QuanTableViewCell class] forCellReuseIdentifier:@"QuanCellIdentifier"];
	[tableView registerClass:[SpecificationTableViewCell class] forCellReuseIdentifier:@"SpecificationCellIdentifier"];
	[tableView registerClass:[CommentSummaryTableViewCell class] forCellReuseIdentifier:@"CommentSummaryCellIdentifier"];
	[tableView registerClass:[CommentContentTableViewCell class] forCellReuseIdentifier:@"CommentContentCellIdentifier"];
	[tableView registerClass:[AllCommentTableViewCell class] forCellReuseIdentifier:@"AllCommentCellIdentifier"];
	[tableView registerClass:[NoCommentTableViewCell class] forCellReuseIdentifier:@"NoCommentCellIdentifier"];
	[tableView registerClass:[RecommentTableViewCell class] forCellReuseIdentifier:@"RecommentCellIdentifier"];
	[tableView registerClass:[RecommentContentTableViewCell class] forCellReuseIdentifier:@"RecommentContentCellIdentifier"];
	[self.view addSubview:tableView];
	self.tableView = tableView;
}

- (void)setupInitData {
	self.tableSections = [NSMutableArray array];
	
	/* 初始加载数据
	 * 初始化时，只显示滚动图片、价格、评论头、无评论
	 */
	// 滚动图片（宽高保持比例）
	SKRow *cycleImagesRow = [[SKRow alloc] initWithCellIdentifier:@"CycleImagesCellIdentifier" data:@[@"滚动图片地址"] rowHeight:120*[UIScreen mainScreen].bounds.size.width / 320.f];
	// 价格
	SKRow *priceRow = [[SKRow alloc] initWithCellIdentifier:@"PriceCellIdentifier" data:@"0" rowHeight:44];
	[self.tableSections addObject:@[cycleImagesRow, priceRow]];
	// 评论头
	SKRow *commentSummaryRow = [[SKRow alloc] initWithCellIdentifier:@"CommentSummaryCellIdentifier" data:@{@"title":@"商品评价", @"count":@"0"} rowHeight:44];
	// 无评论
	SKRow *noCommentRow = [[SKRow alloc] initWithCellIdentifier:@"NoCommentCellIdentifier" data:@"暂无评论" rowHeight:44];
	[self.tableSections addObject:@[commentSummaryRow, noCommentRow]];
}

/**
 模拟从网络请求数据
 */
- (void)loadDataFromNetwork {
	self.tableSections = [NSMutableArray array];
	
	NSMutableArray<SKRow *> *section1 = [NSMutableArray array];
	// 滚动图片（宽高保持比例）
	SKRow *cycleImagesRow = [[SKRow alloc] initWithCellIdentifier:@"CycleImagesCellIdentifier" data:@[@"滚动图片地址1", @"滚动图片地址2", @"滚动图片地址3"] rowHeight:120*[UIScreen mainScreen].bounds.size.width / 320.f];
	// 主标题
	SKRow *mainTitleRow = [[SKRow alloc] initWithCellIdentifier:@"MainTitleCellIdentifier" data:@"商品名称" rowHeight:44];
	// 副标题
	SKRow *subTitleRow = [[SKRow alloc] initWithCellIdentifier:@"SubTitleCellIdentifier" data:@"节日促销，快来买啊" rowHeight:44];
	// 价格
	SKRow *priceRow = [[SKRow alloc] initWithCellIdentifier:@"PriceCellIdentifier" data:@(arc4random()) rowHeight:44];
	[section1 addObjectsFromArray:@[cycleImagesRow, mainTitleRow, subTitleRow, priceRow]];
	// 促销（随机出现）
	if (arc4random() % 2 == 0) {
		SKRow *salePromotionRow = [[SKRow alloc] initWithCellIdentifier:@"SalePromotionCellIdentifier" data:@[@"促销信息1", @"促销信息2", @"促销信息3"] rowHeight:44];
		[section1 addObject:salePromotionRow];
	}
	// 优惠券（随机出现）
	if (arc4random() % 2 == 0) {
		SKRow *quanCellRow = [[SKRow alloc] initWithCellIdentifier:@"QuanCellIdentifier" data:@[@"优惠券1", @"优惠券2"] rowHeight:44];
		[section1 addObject:quanCellRow];
	}
	[self.tableSections addObject:section1];
	
	NSMutableArray<SKRow *> *section2 = [NSMutableArray array];
	// 规格（随机出现）
	if (arc4random() % 2 == 0) {
		SKRow *specificationRow = [[SKRow alloc] initWithCellIdentifier:@"SpecificationCellIdentifier" data:@"银色，13.3英寸" rowHeight:44];
		[section2 addObject:specificationRow];
	}
	if (section2.count > 0) {
		[self.tableSections addObject:section2];
	}
	
	NSMutableArray<SKRow *> *section3 = [NSMutableArray array];
	NSArray<NSString *> *commentArray = [NSMutableArray array];
	// 评论内容数据（随机出现）
	if (arc4random() % 2 == 0) {
		commentArray = @[@"评论内容1", @"评论内容2", @"2016年6月，苹果系统iOS 10正式亮相，苹果为iOS 10带来了十大项更新。2016年6月13日，苹果开发者大会WWDC在旧金山召开，会议宣布iOS 10的测试版在2016年夏天推出，正式版将在秋季发布。2016年9月7日，苹果发布iOS 10。iOS10正式版于9月13日(北京时间9月14日凌晨一点)全面推送。", @"评论内容4"];
	}
	// 评论头
	SKRow *commentSummaryRow = [[SKRow alloc] initWithCellIdentifier:@"CommentSummaryCellIdentifier" data:@{@"title":@"商品评价", @"count":@(commentArray.count)} rowHeight:44];
	[section3 addObject:commentSummaryRow];
	if (commentArray.count > 0) {
		for (NSString *commentString in commentArray) {
			// 评论内容需要自适应高度，高度值指定为UITableViewAutomaticDimension
			SKRow *commentContentRow = [[SKRow alloc] initWithCellIdentifier:@"CommentContentCellIdentifier" data:commentString rowHeight:UITableViewAutomaticDimension];
			[section3 addObject:commentContentRow];
		}
		// 查看所有评论
		SKRow *allCommentRow = [[SKRow alloc] initWithCellIdentifier:@"AllCommentCellIdentifier" data:@"查看所有评论" rowHeight:44];
		[section3 addObject:allCommentRow];
	} else {
		// 无评论
		SKRow *noCommentRow = [[SKRow alloc] initWithCellIdentifier:@"NoCommentCellIdentifier" data:@"暂无评论" rowHeight:44];
		[section3 addObject:noCommentRow];
	}
	[self.tableSections addObject:section3];
	
	NSMutableArray<SKRow *> *section4 = [NSMutableArray array];
	// 推荐头
	SKRow *recommentRow = [[SKRow alloc] initWithCellIdentifier:@"RecommentCellIdentifier" data:@"为您推荐" rowHeight:44];
	// 推荐内容
	SKRow *recommentContentRow = [[SKRow alloc] initWithCellIdentifier:@"RecommentContentCellIdentifier" data:@[@"推荐商品1", @"推荐商品2"] rowHeight:44];
	[section4 addObjectsFromArray:@[recommentRow, recommentContentRow]];
	[self.tableSections addObject:section4];
	
	[self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// 这里可以通过判断cellIdentifier来区分处理cell的点击
	
	SKRow *row = self.tableSections[indexPath.section][indexPath.row];
	if ([row.cellIdentifier isEqualToString:@"AllCommentCellIdentifier"]) {
		NSLog(@"跳转到查看所有评论页面");
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return CGFLOAT_MIN;
	}
	return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	SKRow *row = self.tableSections[indexPath.section][indexPath.row];
	return row.rowHeight;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.tableSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.tableSections[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	// 这里可以通过判断cellIdentifier来区分处理各种不同的cell，cell所需的数据从row.data上获取
	
	SKRow *row = self.tableSections[indexPath.section][indexPath.row];
	if ([row.cellIdentifier isEqualToString:@"CycleImagesCellIdentifier"]) {
		CycleImagesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		NSArray<NSString *> *urlStringArray = row.data;
		cell.titleTextLabel.text = [urlStringArray componentsJoinedByString:@"\n"];
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"MainTitleCellIdentifier"]) {
		MainTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		cell.titleTextLabel.text = row.data;
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"SubTitleCellIdentifier"]) {
		SubTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		cell.titleTextLabel.text = row.data;
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"PriceCellIdentifier"]) {
		PriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		cell.titleTextLabel.text = [NSString stringWithFormat:@"￥%@", row.data];
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"SalePromotionCellIdentifier"]) {
		SalePromotionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		NSArray<NSString *> *salePromotionStringArray = row.data;
		cell.titleTextLabel.text = [salePromotionStringArray componentsJoinedByString:@"\n"];
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"QuanCellIdentifier"]) {
		QuanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		NSArray<NSString *> *quanStringArray = row.data;
		cell.titleTextLabel.text = [quanStringArray componentsJoinedByString:@"，"];
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"SpecificationCellIdentifier"]) {
		SpecificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		cell.titleTextLabel.text = [NSString stringWithFormat:@"已选：%@", row.data];
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"CommentSummaryCellIdentifier"]) {
		CommentSummaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		NSDictionary *commentSummary = row.data;
		cell.titleTextLabel.text = [NSString stringWithFormat:@"%@(%@)", commentSummary[@"title"], commentSummary[@"count"]];
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"CommentContentCellIdentifier"]) {
		CommentContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		cell.titleTextLabel.text = row.data;
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"AllCommentCellIdentifier"]) {
		AllCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		cell.titleTextLabel.text = row.data;
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"NoCommentCellIdentifier"]) {
		NoCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		cell.titleTextLabel.text = row.data;
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"RecommentCellIdentifier"]) {
		RecommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		cell.titleTextLabel.text = row.data;
		return cell;
	} else if ([row.cellIdentifier isEqualToString:@"RecommentContentCellIdentifier"]) {
		RecommentContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.cellIdentifier forIndexPath:indexPath];
		NSArray<NSString *> *recommentStringArray = row.data;
		cell.titleTextLabel.text = [recommentStringArray componentsJoinedByString:@"，"];
		return cell;
	}
	return nil;
}


@end
