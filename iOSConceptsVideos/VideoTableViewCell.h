//
//  VideoTableViewCell.h
//  iOSConceptsVideos
//
//  Created by shashank kannam on 4/1/17.
//  Copyright © 2017 shashank. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Videos;

@interface VideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;

@property (weak, nonatomic) IBOutlet UILabel *titleLBL;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLBL;

@property (weak, nonatomic) IBOutlet UIView *cellView;



- (void) configureCell:(nonnull Videos*)video;

@end
