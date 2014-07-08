//
//  SuperHeroParser.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "SuperHeroParser.h"

@implementation SuperHeroParser

- (SuperHero *)superHeroWithData:(NSData *)heroData {
    NSError *error;
    
    NSDictionary *jsonHero = [NSJSONSerialization JSONObjectWithData:heroData options:kNilOptions error:&error];
    
    if (error) {
        return nil;
    }
    
    SuperHero *hero = [[SuperHero alloc] init];
    
    NSDictionary *data = [jsonHero objectForKey:@"data"];
    NSArray *results = [data objectForKey:@"results"];
    NSDictionary *heroDict = [results firstObject];
    hero.name = [heroDict objectForKey:@"name"];
    hero.heroDescription = [heroDict objectForKey:@"description"];
    
    hero.thumbnail = [NSString stringWithFormat:@"%@.%@",
                      [heroDict valueForKeyPath:@"thumbnail.path"],
                      [heroDict valueForKeyPath:@"thumbnail.extension"]
                      ];
    
    return hero;
}


- (NSArray *)parseAllSuperHeroes:(NSData *)data {
    NSError *error;
    
    NSDictionary *jsonHero = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error) {
        return nil;
    }
  
    
    NSMutableArray *allHeroes = [[NSMutableArray alloc] init];
    
    NSDictionary *results = [jsonHero valueForKeyPath:@"data.results"];
    for (NSDictionary *dict in results) {
        SuperHero *hero = [[SuperHero alloc] init];
        
        hero.name = [dict valueForKey:@"name"];
        hero.heroDescription = [dict objectForKey:@"description"];
        hero.thumbnail = [NSString stringWithFormat:@"%@.%@",
                          [dict valueForKeyPath:@"thumbnail.path"],
                          [dict valueForKeyPath:@"thumbnail.extension"]
                          ];

        [allHeroes addObject:hero];
    }
    
    return allHeroes;
}

@end
