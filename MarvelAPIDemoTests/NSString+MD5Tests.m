//
//  NSString+MD5Tests.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+MD5.h"

@interface NSString_MD5Tests : XCTestCase

@end

@implementation NSString_MD5Tests


- (void)testMD5 {
    
    NSString *theString = @"8a73988fb7552d0013a1c3148739962c2e7c477e";
    
    NSString *md5 = [theString MD5];
    
    XCTAssertEqualObjects(md5, @"ef62b038fd1b86a783e438d664bb6fc4", @"");
}



@end
