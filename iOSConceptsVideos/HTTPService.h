//
//  HTTPService.h
//  iOSConceptsVideos
//
//  Created by shashank kannam on 3/30/17.
//  Copyright © 2017 shashank. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSDictionary * __nullable dataDict, NSString * __nullable errMsg);



@interface HTTPService : NSObject

+ (id) instance;
- (void) getTutorials;
@end
