//
//  HTTPService.h
//  iOSConceptsVideos
//
//  Created by shashank kannam on 3/30/17.
//  Copyright © 2017 shashank. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMsg);



@interface HTTPService : NSObject

+ (id) instance;
- (void) getTutorials:(nullable onComplete)completionHandler;
@end
