//
//  Breed.h
//  DogsC
//
//  Created by Trevor Walker on 7/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SubBreed;
NS_ASSUME_NONNULL_BEGIN

@interface Breed : NSObject;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray *subBreeds;
@property (nonatomic, copy) NSArray *imageURLs;
-(instancetype)initWithName:(NSString *)name subBreed:(NSArray *) subBreed imageURL:(NSArray *)imageURL;
@end

NS_ASSUME_NONNULL_END
