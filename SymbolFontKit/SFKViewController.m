//
//  SFKViewController.m
//  SymbolFontKit
//
//  Created by kishikawa katsumi on 2012/08/25.
//  Copyright (c) 2012 kishikawa katsumi. All rights reserved.
//

#import "SFKViewController.h"
#import "SFKImage.h"
#import <objc/runtime.h>

@interface SFKViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;
@property (weak, nonatomic) IBOutlet UIImageView *imageView5;

@property (weak, nonatomic) IBOutlet UIImageView *imageView6;
@property (weak, nonatomic) IBOutlet UIImageView *imageView7;
@property (weak, nonatomic) IBOutlet UIImageView *imageView8;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *button1;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *button2;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *button3;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *button4;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *button5;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@end

@implementation SFKViewController

@synthesize imageView1;
@synthesize imageView2;
@synthesize imageView3;
@synthesize imageView4;
@synthesize imageView5;
@synthesize imageView6;
@synthesize imageView7;
@synthesize imageView8;

@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [SFKImage setDefaultFont:[UIFont fontWithName:@"LigatureSymbols" size:34.0f]];
    [SFKImage setDefaultColor:[UIColor blackColor]];
    
    self.imageView1.image = [SFKImage imageNamed:@"share"];
    self.imageView2.image = [SFKImage imageNamed:@"print"];
    self.imageView3.image = [SFKImage imageNamed:@"delete"];
    self.imageView4.image = [SFKImage imageNamed:@"app"];
    self.imageView5.image = [SFKImage imageNamed:@"camera"];
    
    SFKImage *image = [SFKImage imageNamed:@"compass"];
    image.size = CGSizeMake(20, 20);
    image.color = [UIColor redColor];
    self.imageView6.image = image;
    
    image.size = CGSizeMake(40, 40);
    image.color = [UIColor yellowColor];
    self.imageView7.image = image;
    
    image.size = CGSizeMake(80, 80);
    image.color = [UIColor blueColor];
    self.imageView8.image = image;
    
    self.button1.image = [SFKImage imageNamed:@"like"];
    self.button2.image = [SFKImage imageNamed:@"bookmark"];
    self.button3.image = [SFKImage imageNamed:@"zoomin"];
    self.button4.image = [SFKImage imageNamed:@"crown"];
    self.button5.image = [SFKImage imageNamed:@"setting"];
    
    UITabBarItem *calendarTabBarItem = [[UITabBarItem alloc] initWithTitle:@"calendar" image:[SFKImage imageNamed:@"calender"] tag:1];
    UITabBarItem *globeTabBarItem = [[UITabBarItem alloc] initWithTitle:@"globe" image:[SFKImage imageNamed:@"globe"] tag:2];
    _tabBar.items = @[calendarTabBarItem, globeTabBarItem];
    _tabBar.selectedItem = calendarTabBarItem;
}

@end
