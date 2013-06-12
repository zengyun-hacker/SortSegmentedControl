//
//  SortSegmentedControl.m
//  SortSegmentedControl Example
//
//  Created by Du on 13-6-10.
//  Copyright (c) 2013年 Du. All rights reserved.
//

#import "SortSegmentedControl.h"
#import "SortSegmentedItem.h"

@interface SortSegmentedControl()

@end

@implementation SortSegmentedControl{
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithItems:(SortSegmentedItem *)items,...{
    self = [super init];
    if (self) {
        _sortSegmentedItems = [NSMutableArray array];
        va_list params;
        va_start(params, items);
        id arg;
        if (items) {
            [_sortSegmentedItems addObject:items];
            while ((arg = va_arg(params, id))) {
                if (arg) {
                    [_sortSegmentedItems addObject:arg];
                }
            }
            va_end(params);
        }
        CGFloat segmentedControlWidth = items.frame.size.width * _sortSegmentedItems.count;
        CGFloat segmentedControlHeight = items.frame.size.height;
        self.frame = CGRectMake(0, 0, segmentedControlWidth, segmentedControlHeight);
        [_sortSegmentedItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            SortSegmentedItem *item = obj;
            CGFloat itemWidth = item.frame.size.width;
            item.frame = CGRectMake(idx * itemWidth, 0, itemWidth, item.frame.size.height);
            [item addTarget:self action:@selector(itemTapped:) forControlEvents:UIControlEventTouchDown];
            item.tag = idx;
            item.status = kNormalStatus;
            [item updateItemImage];
            [self addSubview:item];
        }];
        
        SortSegmentedItem *firstItem = [_sortSegmentedItems objectAtIndex:self.defaultSelectedItemIndex];
        firstItem.selected = YES;
        firstItem.status = firstItem.defaultSelectedStatus;
        [firstItem updateItemImage];
    }
    return self;
}



- (void)setDefaultSelectedItemIndex:(NSInteger)defaultSelectedItemIndex{
    if (defaultSelectedItemIndex == _defaultSelectedItemIndex) {
        return;
    }
    
    _defaultSelectedItemIndex = defaultSelectedItemIndex > _sortSegmentedItems.count ?  _sortSegmentedItems.count : defaultSelectedItemIndex;
    for (SortSegmentedItem *item in _sortSegmentedItems) {
        item.selected = NO;
        item.status = kNormalStatus;
        [item updateItemImage];
    }
    SortSegmentedItem *defaultSelectedItem = [_sortSegmentedItems objectAtIndex:_defaultSelectedItemIndex];
    defaultSelectedItem.selected = YES;
    defaultSelectedItem.status = defaultSelectedItem.defaultSelectedStatus;
    [defaultSelectedItem updateItemImage];
}

- (void)itemTapped:(SortSegmentedItem *)tappedItem{
    _selectedIndex = tappedItem.tag;
    
    //tapped the same item
    if (tappedItem.selected) {
        tappedItem.status = (tappedItem.status == kascendingOrder) ? (tappedItem.status = kdescendingOrder):(tappedItem.status = kascendingOrder);
        [tappedItem updateItemImage];
        [_delegate selectedSegmentedItemTapped:tappedItem];
        return;
    }
    
    //tapped different item
    for (SortSegmentedItem *item in _sortSegmentedItems) {
        item.selected = NO;
        item.status = kNormalStatus;
        [item updateItemImage];
    }
    tappedItem.selected = YES;
    tappedItem.status = tappedItem.defaultSelectedStatus;
    [tappedItem updateItemImage];
    [_delegate segmentedControlValueChanged:tappedItem];
}

@end
