//
//  BreedNetworkClient.h
//  DogsC
//
//  Created by Trevor Walker on 7/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Breed.h"
#import "SubBreed.h"
NS_ASSUME_NONNULL_BEGIN

@interface BreedNetworkClient : NSObject
+(BreedNetworkClient *) shared;
- (void)fetchAllBreeds: (void (^) (NSArray *))completion;
-(void)fetchBreedImageURL:(Breed *)breed completion:(void (^) (NSArray *))completion;
-(void)fetchImageData:(NSURL *)url completion:(void (^) (NSData *imageData, NSError *error))completion;
@end

NS_ASSUME_NONNULL_END
