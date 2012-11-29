//
//  RootViewController.h
//  万网（符捷凯）
//
//  Created by Jiek on 12-11-28.
//  Copyright (c) 2012年 Jiek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface RootViewController : UIViewController <iCarouselDataSource,iCarouselDelegate>

@property (nonatomic, retain) iCarousel *carousel;


@end
