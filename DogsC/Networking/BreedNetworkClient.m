//
//  BreedNetworkClient.m
//  DogsC
//
//  Created by Trevor Walker on 7/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

#import "BreedNetworkClient.h"
static NSString * const baseURLString = @"https://dog.ceo/api";
@implementation BreedNetworkClient
+ (BreedNetworkClient *)shared
{
    static BreedNetworkClient *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [BreedNetworkClient new];
    });
    return shared;
}
- (void)fetchAllBreeds: (void (^) (NSArray *))completion
{
    //setting up URL
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    //adding on components
    NSURL *breedURL = [[[baseURL URLByAppendingPathComponent:@"breeds"] URLByAppendingPathComponent:@"list"] URLByAppendingPathComponent:@"all"];
    //creating a session to get the data
    [[[NSURLSession sharedSession]dataTaskWithURL:breedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //error handeling
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        //making data readable
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        //getting the top level dictionary
        NSDictionary *messageDictionary = jsonDictionary[@"message"];
        //creating an array for our breeds
        NSMutableArray *breeds = [NSMutableArray new];
        //looping through all items in out top level dictionary
        for(id key in messageDictionary)
        {
            //creating an array for out sub breeds
            NSMutableArray *subBreeds = [NSMutableArray new];
            //looping through all sub breeds
            for (NSString *name in messageDictionary[key])
            {
                //grabbing the current sub breed
                SubBreed *subBreed = [[SubBreed alloc] initWithName:name imageURLs:[NSMutableArray new]];
                //adding sub breed to our array of sub breeds
                [subBreeds addObject:subBreed];
            }
            //creating out breed with the current key and all sub breeds
            Breed * breed = [[Breed alloc]initWithName:key subBreed:subBreeds imageURL:[NSMutableArray new]];
            //adding it to our array of breeds
            [breeds addObject:breed];
        }
        //sending out our data
        completion(breeds);
    }]resume];
}
- (void)fetchBreedImageURL:(Breed *)breed completion:(void (^)(NSArray *))completion
{
    //setting up url
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *breedURL = [[[baseURL URLByAppendingPathComponent:@"breed"] URLByAppendingPathComponent:breed.name] URLByAppendingPathComponent:@"images"];
    //creating a session to get data
    [[[NSURLSession sharedSession]dataTaskWithURL:breedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //error handeling
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        //maklign our data readable
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&error];
        //making sure data exists
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Error fetching Json Stuff %@", error);
            completion(nil);
            return;
        }
        //grabbing first level dictionary
        NSMutableArray *images = jsonDictionary[@"message"];
        //sending out data
        completion(images);
    }]resume];
}
- (void)fetchSubBreedImageURLs:(SubBreed *)subBreed breed:(Breed *)breed completion:(void (^) (NSArray *))completion;
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *breedURL = [[[[baseURL URLByAppendingPathComponent: @"breed"] URLByAppendingPathComponent:breed.name] URLByAppendingPathComponent:subBreed.name] URLByAppendingPathComponent:@"images"];
    [[[NSURLSession sharedSession]dataTaskWithURL:breedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //handle error
        if (error){
            NSLog(@"Error fetching breeds from search term: %@", error);
            completion(nil);
            return;
        }
        if(!data){
            NSLog(@"Error fetching breeds DATA from search term: %@", error);
            completion(nil);
            return;
        }
        //making data readable
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        //making sure data exists
        if (!jsonDictionary|| ![jsonDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"Error fetching json dictionary %@", error);
            completion(nil);
            return;
        }
        //grabbign our top level
        NSMutableArray *images = jsonDictionary[@"message"];
        //sending out data
        completion(images);
        
    }]resume];
}
- (void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *imageData, NSError *error))completion
{
    //getting image with provided URL
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //error handling
        if (error){
            NSLog(@"Error fetching breeds: %@", error);
            return completion(nil, error);
        }
        if(!data){
            NSLog(@"Error fetching breeds: %@", error);
            return completion(nil, error);
        }
        //passing data
        completion(data, nil);
    }]resume];
}
@end
