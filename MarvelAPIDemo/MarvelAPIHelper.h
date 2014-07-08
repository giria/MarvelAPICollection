//
//  MarveAPIHelper.h
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MarvelAPIHelper : NSObject

@property (nonatomic, copy) NSString *publicKey;
@property (nonatomic, copy) NSString *secretKey;
@property (nonatomic, copy, readonly) NSString *timeStamp;


- (NSString *)authorizationStringWithPublicKey:(NSString *)publicKey andSecretKey:(NSString *)secretKey andTimeStamp:(NSString *)ts;

- (NSArray *)allComics;

- (NSData *)dataForSuperheroNamed:(NSString *)name;

- (void)dataForSuperheroNamed:(NSString *)name completion:(void (^)(NSData *resultData))completionBlock;
- (NSData *)dataForAllSuperheros;


@end
