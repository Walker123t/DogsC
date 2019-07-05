//
//  SubBreedController.m
//  DogsC
//
//  Created by Trevor Walker on 7/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

#import "SubBreed.h"

@implementation SubBreed
- (instancetype)initWithName:(NSString *)name imageURLs:(NSArray *)imageURLs
{
    if (self = [super init]){
        _name = name;
        _imageURLs = imageURLs;
    }
    return self;
}
@end
