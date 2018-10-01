//
//  ZYTestViewController.m
//  testCatigery
//
//  Created by handwill on 2018/10/1.
//  Copyright © 2018年 handwill. All rights reserved.
//

#import "ZYTestViewController.h"
#import "JXCategoryView.h"
//#import "LoadDataListBaseViewController.h"
//#import "UIWindow+JXSafeArea.h"

#define WindowsSize [UIScreen mainScreen].bounds.size

@interface ZYTestViewController ()<JXCategoryViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray  *listVCArray;
@property (nonatomic, strong) JXCategoryListVCContainerView *listVCContainerView;
@end

@implementation ZYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.isNeedCategoryListContainerView = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGFloat naviHeight = 44;
    
    NSArray *titles = @[@"红烧螃蟹", @"麻辣龙虾", @"美味苹果"].mutableCopy;
    NSUInteger count = titles.count;
    CGFloat categoryViewHeight = 50;
    CGFloat width = WindowsSize.width;
    CGFloat height = WindowsSize.height - naviHeight - categoryViewHeight;
    
    self.listVCArray = [NSMutableArray array];
    for (int i = 0; i < count; i ++) {
        UIViewController *listVC = [[UIViewController alloc] init];
        listVC.view.frame = CGRectMake(i*width, 0, width, height);
        [self.listVCArray addObject:listVC];
    }
    
    self.categoryView = [[JXCategoryTitleView alloc] init];
    self.categoryView.frame = CGRectMake(0, 0, WindowsSize.width, categoryViewHeight);
    self.categoryView.delegate = self;
    self.categoryView.titles = titles;
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    self.categoryView.indicators = @[lineView];
    [self.view addSubview:self.categoryView];
    
    if (self.isNeedCategoryListContainerView) {
        self.listVCContainerView = [[JXCategoryListVCContainerView alloc] initWithFrame:CGRectMake(0, categoryViewHeight, width, height)];
        self.listVCContainerView.defaultSelectedIndex = 0;
        self.listVCContainerView.listVCArray = self.listVCArray;
        [self.view addSubview:self.listVCContainerView];
        
        self.categoryView.contentScrollView = self.listVCContainerView.scrollView;
    }else {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, categoryViewHeight, width, height)];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.contentSize = CGSizeMake(width*count, height);
        [self.view addSubview:self.scrollView];
        
        for (int i = 0; i < count; i ++) {
            UIViewController *listVC = self.listVCArray[i];
            [self.scrollView addSubview:listVC.view];
        }
        
        self.categoryView.contentScrollView = self.scrollView;
//        [self.listVCArray.firstObject loadDataForFirst];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
