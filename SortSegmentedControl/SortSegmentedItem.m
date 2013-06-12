//
//  SortSegmentItem.m
//  SortSegmentedControl Example
//
//  Created by dreamer on 13-6-10.
//  Copyright (c) 2013年 dreamer. All rights reserved.
//

#import "SortSegmentedItem.h"

@implementation SortSegmentedItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (SortSegmentedItem *)itemWithNormalStatusImage:(UIImage *)normalStatus selectedStatus1Image:(UIImage *)selectedStatus1 selectedStatus2Image:(UIImage *)selectedStatus2{
    if (!normalStatus && !selectedStatus1 && !selectedStatus2) {
        return nil;
    }
    SortSegmentedItem *segmentedItem = [[SortSegmentedItem alloc] init];
    if (segmentedItem) {
        UIImage *segmentImage = normalStatus ? normalStatus : (selectedStatus1 ? selectedStatus1 : selectedStatus2);
        segmentedItem.frame = CGRectMake(0, 0, segmentImage.size.width, segmentImage.size.height);
        segmentedItem.normalStatus = normalStatus;
        segmentedItem.ascendingOrder = selectedStatus1;
        segmentedItem.descendingOrder = selectedStatus2;
        segmentedItem.defaultSelectedStatus = kascendingOrder;
    }
    
    return segmentedItem;
}

- (void)updateItemImage{
    switch (self.status) {
        case kNormalStatus:
            [self setBackgroundImage:self.normalStatus forState:UIControlStateNormal];
            break;
        case kascendingOrder:{
            [self setBackgroundImage:self.ascendingOrder forState:UIControlStateSelected];
            [self setBackgroundImage:self.ascendingOrder forState:UIControlStateHighlighted];
            break;
        }
        case kdescendingOrder:{
            [self setBackgroundImage:self.descendingOrder forState:UIControlStateSelected];
            [self setBackgroundImage:self.descendingOrder forState:UIControlStateHighlighted];
            break;
        }
            
        default:
            break;
    }
}


@end
