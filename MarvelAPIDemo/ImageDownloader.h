//
//  ImageDownloader.h
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDownloader : NSObject

+ (void)downloadImageUsingUrl:(NSString *)url completion:(void(^)(UIImage *image))completion;

@end
