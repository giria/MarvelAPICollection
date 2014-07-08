//
//  MarvelAPIHelperTests.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MarvelAPIHelper.h"

@interface MarvelAPIHelperTests : XCTestCase

@end

@implementation MarvelAPIHelperTests

- (void)testBlock {
    MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] init];
    
    [mah dataForSuperheroNamed:@"Hulk"
                    completion:^(NSData *resultData) {
                        NSLog(@"🌈🐴");
    }];
}


- (void)testGetComics {
    MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] init];
        
    [mah setPublicKey:@"bd8f8a972db1c721bb21aaf100f2e707"];
    [mah setSecretKey:@"8a73988fb7552d0013a1c3148739962c2e7c477e"];

    [mah allComics];
    
    [mah dataForSuperheroNamed:@"hulk"];
}

@end
