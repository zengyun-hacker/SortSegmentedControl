//
//  ViewController.m
//  SortSegmentedControl Example
//
//  Created by dreamer on 13-6-10.
//  Copyright (c) 2013年 dreamer. All rights reserved.
//

#import "ViewController.h"
#import "SortSegmentedControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *normalStatus = [UIImage imageNamed:@"normal.png"];
    UIImage *selectStatus1 = [UIImage imageNamed:@"ascending.png"];
    UIImage *selectStatus2 = [UIImage imageNamed:@"descending.png"];
    
    //left SortSegmentedItem
	SortSegmentedItem *leftItem = [SortSegmentedItem itemWithNormalStatusImage:normalStatus selectedStatus1Image:selectStatus1 selectedStatus2Image:selectStatus2];
    [leftItem setTitle:@"price" forState:UIControlStateNormal];
    [leftItem setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [leftItem setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    
    //middle SortSegmentedItem
    SortSegmentedItem *middleItem = [SortSegmentedItem itemWithNormalStatusImage:normalStatus selectedStatus1Image:selectStatus1 selectedStatus2Image:selectStatus2];
    [middleItem setTitle:@"hot" forState:UIControlStateNormal];
    [middleItem setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [middleItem setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    middleItem.defaultSelectedStatus = kdescendingOrder;
    
    //right SortSegmentedItem
    SortSegmentedItem *rightItem = [SortSegmentedItem itemWithNormalStatusImage:normalStatus selectedStatus1Image:selectStatus1 selectedStatus2Image:selectStatus2];
    [rightItem setTitle:@"date" forState:UIControlStateNormal];
    [rightItem setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [rightItem setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    
    
    //init SortSegmentedControl var SortSementedItem
    SortSegmentedControl *segmentedControl = [[SortSegmentedControl alloc] initWithItems:leftItem,middleItem,rightItem,nil];
    segmentedControl.defaultSelectedItemIndex = 2;
    segmentedControl.delegate = self;
    [self.view addSubview:segmentedControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)segmentedControlValueChanged:(SortSegmentedItem *)item{
    NSLog(@"different item pressed, item tag:%ld",(long)item.tag);
}

- (void)sameSegmentedItemTapped:(SortSegmentedItem *)item{
    NSLog(@"same item pressed, item tag : %ld , item status : %u",(long)item.tag,item.status);
}

@end
