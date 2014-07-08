//
//  MarveAPIHelper.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "MarvelAPIHelper.h"
#import "NSString+MD5.h"

#define MARVEL_BASE_URL @"http://gateway.marvel.com/v1/public/"

@interface MarvelAPIHelper ()

@property (nonatomic) NSUInteger timeStampCounter;
#warning oops

@property (nonatomic, strong) NSArray *comics;

@end


@implementation MarvelAPIHelper

- (NSString *)timeStamp {
    self.timeStampCounter++;
    return [NSString stringWithFormat:@"%u", self.timeStampCounter];
}

- (NSString *)authorizationStringWithPublicKey:(NSString *)publicKey andSecretKey:(NSString *)secretKey andTimeStamp:(NSString *)ts {
    
    NSString *preHash = [NSString stringWithFormat:@"%@%@%@", ts, secretKey, publicKey];
    
    return [preHash MD5];
}

- (NSArray *)allComics {

    NSString *ts = self.timeStamp;
    NSString *authString = [self authorizationStringWithPublicKey:self.publicKey andSecretKey:self.secretKey andTimeStamp:ts];
    NSString *get = [NSString stringWithFormat:@"%@%@?ts=%@&apikey=%@&hash=%@", MARVEL_BASE_URL, @"comics", ts, self.publicKey, authString];
    
    NSArray *comics;
    
    NSURL *url = [NSURL URLWithString:get];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return comics;
}


- (void)dataForSuperheroNamed:(NSString *)name completion:(void (^)(NSData *resultData))completionBlock {
    
    dispatch_async(BACKGROUND_QUEUE, ^{
        NSData *data = [self dataForSuperheroNamed:name];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(data);
        });
    });
    
    
}

- (NSData *)dataForSuperheroNamed:(NSString *)name {
    NSString *ts = self.timeStamp;

//     NSAssert(true, @"");
    
    NSString *authString = [self authorizationStringWithPublicKey:self.publicKey andSecretKey:self.secretKey andTimeStamp:ts];
    NSString *tmp = [NSString stringWithFormat:@"%@%@?name=%@&ts=%@&apikey=%@&hash=%@", MARVEL_BASE_URL, @"characters", name, ts, self.publicKey, authString];
    
    NSString *get = [tmp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL *url = [NSURL URLWithString:get];
    
    NSData *data = [NSData dataWithContentsOfURL:url];

    self.comics = [NSArray arrayWithObject:data];
    
    return data;
}


- (NSData *)dataForAllSuperheros {
    NSString *ts = self.timeStamp;
    
    NSString *authString = [self authorizationStringWithPublicKey:self.publicKey andSecretKey:self.secretKey andTimeStamp:ts];
    NSString *tmp = [NSString stringWithFormat:@"%@%@?ts=%@&apikey=%@&hash=%@", MARVEL_BASE_URL, @"characters", ts, self.publicKey, authString];
    
    NSString *get = [tmp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    NSURL *url = [NSURL URLWithString:get];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return data;
}


@end
