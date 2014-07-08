//
//  SuperHeroCell.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 08/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "SuperHeroCell.h"
#import "ImageDownloader.h"

@interface SuperHeroCell ()
@property (strong, nonatomic) IBOutlet UIImageView *heroImage;

@end

@implementation SuperHeroCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setHero:(SuperHero *)hero {
    _hero = hero;
    [ImageDownloader downloadImageUsingUrl:_hero.thumbnail
                                completion:^(UIImage *image) {
                                    self.heroImage.image = image;
    }];
}

@end
