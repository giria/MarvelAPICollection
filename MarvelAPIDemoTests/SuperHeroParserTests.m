//
//  SuperHeroParserTests.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MarvelAPIHelper.h"
#import "SuperHeroParser.h"

@interface SuperHeroParserTests : XCTestCase

@end

@implementation SuperHeroParserTests

- (void)testParseData
{
    
    MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] init];
    
    [mah setPublicKey:@"bd8f8a972db1c721bb21aaf100f2e707"];
    [mah setSecretKey:@"8a73988fb7552d0013a1c3148739962c2e7c477e"];
    
    NSData *data = [mah dataForSuperheroNamed:@"Hulk"];
    
    XCTAssertNotNil(data, @"");
    
    SuperHeroParser *parser = [[SuperHeroParser alloc] init];
    SuperHero *hulk = [parser superHeroWithData:data];
}

@end
