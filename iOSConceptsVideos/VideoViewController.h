//
//  VideoViewController.h
//  iOSConceptsVideos
//
//  Created by shashank kannam on 4/1/17.
//  Copyright © 2017 shashank. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Videos;

@interface VideoViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic,strong) Videos *video;
@end
