//
//  SortSegmentedControl.h
//  SortSegmentedControl Example
//
//  Created by Du on 13-6-10.
//  Copyright (c) 2013年 Du. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SortSegmentedItem.h"

/**
 SortSegmentControlDelegate is used for gettting response for tap event
 */
@protocol SortSegmentControlDelegate <NSObject>

/**
 segmentedControlValueChanged would be called when you tapped normal item
 */
- (void)segmentedControlValueChanged:(SortSegmentedItem *)item;
/**
 selectedSegmentedItemTapped would be called when you tapped the selected item
 */
- (void)selectedSegmentedItemTapped:(SortSegmentedItem *)item;

@end

/**
 SortSegmentedControl is a segmented control which can display order.
 */
@interface SortSegmentedControl : UIControl

/**
 The item array in this control
 */
@property (nonatomic,strong) NSMutableArray *sortSegmentedItems;
/**
 Which item is tapped
 */
@property (nonatomic) NSInteger selectedIndex;
/**
 You can change the default select item.
 */
@property (nonatomic) NSInteger defaultSelectedItemIndex;
/**
 The delegate
 */
@property (nonatomic,weak)  id<SortSegmentControlDelegate> delegate;

/**
 init control
 */
- (id)initWithItems:(SortSegmentedItem *)items,...;

@end
