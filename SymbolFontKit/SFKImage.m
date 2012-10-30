//
//  SFKImage.m
//  SymbolFontKit
//
//  Created by kishikawa katsumi on 2012/08/25.
//  Copyright (c) 2012 kishikawa katsumi. All rights reserved.
//

#import "SFKImage.h"
#import <CoreText/CoreText.h>

static UIFont *defaultFont;
static CGSize preferredSize;
static UIColor *defaultColor;
static UIColor *defaultBackgroundColor;

@interface SFKImage ()

@property (strong, nonatomic) UIImage *_UIImage;

@end

@implementation SFKImage

@synthesize size = _size;

+ (void)initialize {
    preferredSize = CGSizeZero;
    defaultColor = [UIColor whiteColor];
    defaultBackgroundColor = [UIColor clearColor];
}

+ (void)setDefaultFont:(UIFont *)font {
    defaultFont = font;
}

+ (UIFont *)defaultFont {
    return defaultFont;
}

+ (void)setPreferredSize:(CGSize)size {
    preferredSize = size;
}

+ (CGSize)preferredSize {
    return preferredSize;
}

+ (void)setDefaultColor:(UIColor *)color {
    defaultColor = color;
}

+ (UIColor *)defaultColor {
    return defaultColor;
}

+ (void)setDefaultBackgroundColor:(UIColor *)color {
    defaultBackgroundColor = color;
}

+ (UIColor *)defaultBackgroundColor {
    return defaultBackgroundColor;
}

#pragma mark -

+ (SFKImage *)imageNamed:(NSString *)name {
    if (!name || !defaultFont) {
        return nil;
    }
    
    SFKImage *image = [[SFKImage alloc] init];
    image.name = name;
    image.font = defaultFont;
    
    image.size = CGSizeZero;
    if (CGSizeEqualToSize(preferredSize, CGSizeZero)) {
        CGFloat pointSize = defaultFont.pointSize;
        image.size = CGSizeMake(pointSize, pointSize);
    } else {
        image.size = preferredSize;
    }
    
    return image;
}

#pragma mark Private Methods

- (CGImageRef)CGImage {
    if (!self.name || !self.font) {
        return nil;
    }
    if (!self.color) {
        self.color = defaultColor;
    }
    if (!self.backgroundColor) {
        self.backgroundColor = defaultBackgroundColor;
    }
    
    self.font = [UIFont fontWithName:self.font.fontName size:self.size.height * 0.9f];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.name];
    [text addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, text.length)];
    [text addAttribute:NSLigatureAttributeName value:@2 range:NSMakeRange(0, text.length)];
    [text addAttribute:NSForegroundColorAttributeName value:self.color range:NSMakeRange(0, text.length)];
    
    CGRect bounds = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    CGSize imageSize = text.size;
    CGFloat x = MAX((bounds.size.width - imageSize.width) / 2, 0.0f);
    CGFloat y = MAX((bounds.size.height - imageSize.height) / 2, 0.0f);
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    [self.backgroundColor set];
    UIRectFill(bounds);
    
    CGRect contentRect = CGRectMake(x, y, bounds.size.width - x * 2, bounds.size.height - y * 2);
    [text drawInRect:contentRect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self._UIImage = image;
    
    return image.CGImage;
}

- (BOOL)_isResizable {
    return YES;
}

- (BOOL)_isTiledWhenStretchedToSize:(CGSize)size {
    return NO;
}

- (NSArray *)images {
    return [NSArray array];
}

- (CGFloat)scale {
    return [[UIScreen mainScreen] scale];
}

@end
