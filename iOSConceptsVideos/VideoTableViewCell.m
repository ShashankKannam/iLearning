//
//  VideoTableViewCell.m
//  iOSConceptsVideos
//
//  Created by shashank kannam on 4/1/17.
//  Copyright © 2017 shashank. All rights reserved.
//

#import "VideoTableViewCell.h"
#import "Videos.h"

@implementation VideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.85;
    self.layer.shadowRadius = 50.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 5.0);
}


- (void) configureCell:(nonnull Videos*)video{
    self.titleLBL.text = video.title;
    self.descriptionLBL.text = video.description1;
    [self downloadImage:video.thumbnailURL];
}

- (void) downloadImage:(NSString*)imageURL{
    
    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
    
    self.thumbnail.image = image;
}

@end
