//
//  HTTPService.m
//  iOSConceptsVideos
//
//  Created by shashank kannam on 3/30/17.
//  Copyright © 2017 shashank. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:5050/tutorials"

@implementation HTTPService

+ (id) instance{
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil){
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}

- (void) getTutorials: (nullable onComplete)completionHandler{
    
    NSURL * url = [NSURL URLWithString:@URL_BASE];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil){
            NSError * err;
            NSArray * json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            if (err == nil){
                completionHandler(json,nil);
                NSLog(@"JSON: %@",json.description);
            } else {
                completionHandler(nil,@"Error in loading");
                NSLog(@"Error: %@",err.description);
            }
        } else {
            NSLog(@"Network Error: %@",error.description);
            completionHandler(nil, @"Network Error response");
        }
    }]resume];
    
    NSLog(@"");
}

@end
