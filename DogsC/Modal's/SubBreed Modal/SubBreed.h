//
//  SubBreedController.h
//  DogsC
//
//  Created by Trevor Walker on 7/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubBreed : NSObject
@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, copy, readonly) NSArray * imageURLs;

- (instancetype)initWithName:(NSString *)name imageURLs:(NSArray *)imageURLs;

@end

NS_ASSUME_NONNULL_END
