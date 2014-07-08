//
//  ImageDownloader.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader


+ (void)downloadImageUsingUrl:(NSString *)url completion:(void(^)(UIImage *image))completion {
    
    dispatch_async(BACKGROUND_QUEUE, ^{
        NSURL *myUrl = [NSURL URLWithString:url];
        NSData *data = [NSData dataWithContentsOfURL:myUrl];
        UIImage *img = [UIImage imageWithData:data];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(img);
        });
    });
}

+ (void)downloadImageUsingUrl2:(NSString *)url completion:(void (^)(UIImage *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session
                                  dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                
                UIImage *img = [UIImage imageWithData:data];

                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(img);
                });
                
                
            }];
    
    [task resume];

}


@end
