//
//  RootViewController.m
//  万网（符捷凯）
//
//  Created by Jiek on 12-11-28.
//  Copyright (c) 2012年 Jiek. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize carousel = _carousel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
        self.carousel.delegate = self;
        self.carousel.dataSource = self;
        self.carousel.type = 1;
        [self.view addSubview:self.carousel];

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imagev = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    imagev.image = [UIImage imageNamed:@"background_home"];
    [self.view addSubview:imagev];
    [imagev release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -

//显示图的个数方法
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 5;
}

//加载图片方法
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{

    UIView *view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"h%d.png",index+1]]] autorelease];
    
    view.frame = CGRectMake(80, 70, 100, 100);
    return view;
}

//占位符
- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	return 0;
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return 6;
}
//carousel的弧度方法
- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return 200;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * self.carousel.itemWidth);
}
//是否循环方法
- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return YES;
}

#pragma mark 点击图片进的方法
//点击图片进的方法
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if (index == 0) {
        ViewController *firstView = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        [firstView setModalTransitionStyle:0];
        [self presentViewController:firstView animated:YES completion:nil];
        [firstView release];
        
    } else if (index == 1) {
        
    } else if (index == 2) {
        
    } else if (index == 3) {
        
    } else if (index == 4) {
        
    }
}




#pragma mark 内存是否
- (void)dealloc
{
    [_carousel release], _carousel = nil;
    [super dealloc];
}

@end
