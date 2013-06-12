# SortSegmentedControl

## Overview

`SortSegmentedControl` is a Segmented Control which can control the sort of list.


![SortSegmentedControl](./segment_image.png)

## Usage


### Installation
Add `SortSegmentedControl`folder to your project.  
Then import the header file wherever you want to use **SortSegmentedControl**.  

```
#import "SortSegmentedControl.h"
```

### Initialization
```
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
    //change default select status
    middleItem.defaultSelectedStatus = kdescendingOrder;
    
    //right SortSegmentedItem
    SortSegmentedItem *rightItem = [SortSegmentedItem itemWithNormalStatusImage:normalStatus selectedStatus1Image:selectStatus1 selectedStatus2Image:selectStatus2];
    [rightItem setTitle:@"date" forState:UIControlStateNormal];
    [rightItem setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [rightItem setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    
    
    //init SortSegmentedControl var SortSementedItem
    SortSegmentedControl *segmentedControl = [[SortSegmentedControl alloc] initWithItems:leftItem,middleItem,rightItem,nil];
    //change default selected item
    segmentedControl.defaultSelectedItemIndex = 2;
    segmentedControl.delegate = self;
    [self.view addSubview:segmentedControl];

```
### Implement the delegate

```
- (void)segmentedControlValueChanged:(SortSegmentedItem *)item{
    /**
     this method will be called when you tapped normal item
     */
    NSLog(@"different item pressed, item tag:%ld",(long)item.tag);
}

- (void)selectedSegmentedItemTapped:(SortSegmentedItem *)item{
    /**
     this method will be called when you tapped the selected item
     */
    NSLog(@"same item pressed, item tag : %ld , item status : %u",(long)item.tag,item.status);
}
```
## Requirments

need ARC

## Contact

Du  
Email: zengyun.programmer@gmail.com