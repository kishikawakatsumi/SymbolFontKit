//
//  SFKImage.h
//  SymbolFontKit
//
//  Created by kishikawa katsumi on 2012/08/25.
//  Copyright (c) 2012 kishikawa katsumi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFKImage : UIImage

+ (void)setDefaultFont:(UIFont *)font;
+ (UIFont *)defaultFont;
+ (void)setPreferredSize:(CGSize)size;
+ (CGSize)preferredSize;
+ (void)setDefaultColor:(UIColor *)color;
+ (UIColor *)defaultColor;
+ (void)setDefaultBackgroundColor:(UIColor *)color;
+ (UIColor *)defaultBackgroundColor;

+ (SFKImage *)imageNamed:(NSString *)name;

@property (strong, nonatomic) UIFont *font;
@property (assign, nonatomic) CGSize size;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) UIColor *color;
@property (copy, nonatomic) UIColor *backgroundColor;

@end
