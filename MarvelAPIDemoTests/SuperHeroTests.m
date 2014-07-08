//
//  SuperHeroTests.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SuperHero.h"

@interface SuperHeroTests : XCTestCase

@end

@implementation SuperHeroTests



- (void)testCanCreateSuperHero {
    SuperHero *hero = [[SuperHero alloc] init];
    
    XCTAssertNotNil(hero, @"");
    
    
    
}

- (void)testSuperheroName {
    SuperHero *hero = [[SuperHero alloc] init];
    [hero setName:@"Superlopez"];

    XCTAssertEqualObjects(hero.name, @"Superlopez", @"");
}

@end
