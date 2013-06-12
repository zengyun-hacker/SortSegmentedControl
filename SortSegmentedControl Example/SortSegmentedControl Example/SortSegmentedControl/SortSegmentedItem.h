//
//  SortSegmentItem.h
//  SortSegmentedControl Example
//
//  Created by Du on 13-6-10.
//  Copyright (c) 2013年 Du. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Define the item status
 */
typedef enum {
    kNormalStatus,
    kascendingOrder,
    kdescendingOrder,
}SortSegmentedControlStatus;

/**
 SortSegmentedItem is item button of SortSegmentedControl
 */
@interface SortSegmentedItem : UIButton

/**
 The background image of item when it's in normal status
 */
@property (nonatomic,strong) UIImage *normalStatus;
/**
 The background image of item when it's in ascending status
 */
@property (nonatomic,strong) UIImage *ascendingOrder;
/**
 The background image of item when it's in descending status
 */
@property (nonatomic,strong) UIImage *descendingOrder;
/**
 The status of SortSemgentedItem
 */
@property (nonatomic) SortSegmentedControlStatus status;
/**
 Which status the item will be when it's first tapped. The value would be kascendingOrder or kdescendingOrder.
 */
@property (nonatomic) SortSegmentedControlStatus defaultSelectedStatus;

/**
 init item which image
 */
+ (SortSegmentedItem *)itemWithNormalStatusImage:(UIImage *)normalStatus selectedStatus1Image:(UIImage *)selectedStatus1 selectedStatus2Image:(UIImage *)selectedStatus2;

/**
 update the item's image
 */
- (void)updateItemImage;

@end
