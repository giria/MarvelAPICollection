//
//  SuperHeroParser.h
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SuperHero.h"

@interface SuperHeroParser : NSObject

- (SuperHero *)superHeroWithData:(NSData *)heroData;
- (NSArray *)parseAllSuperHeroes:(NSData *)data;

@end
