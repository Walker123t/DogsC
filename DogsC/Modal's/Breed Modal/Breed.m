//
//  Breed.m
//  DogsC
//
//  Created by Trevor Walker on 7/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

#import "Breed.h"

@implementation Breed
- (instancetype)initWithName:(NSString *)name subBreed:(NSArray<SubBreed *> *)subBreed imageURL:(NSArray *)imageURL
{
    if (self = [super init]){
        _name = name;
        _subBreeds = subBreed;
        _imageURLs = imageURL;
    }
    return self;
}
@end
