//
//  ViewController.m
//  iOSConceptsVideos
//
//  Created by shashank kannam on 3/30/17.
//  Copyright © 2017 shashank. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Videos.h"
#import "VideoTableViewCell.h"
#import "VideoViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videosList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.videosList = [NSArray new];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMsg) {
        //
        if (dataArray){
            //NSLog(@" description %@", dataArray.debugDescription);
            
            NSMutableArray *arr = [NSMutableArray new];
            
            for(NSDictionary *d in dataArray){
                Videos *v = [Videos new];
                v.title = [d objectForKey:@"title"];
                v.description1 = [d objectForKey:@"description"];
                v.thumbnailURL = [d objectForKey:@"thumbnail"];
                v.provider = [d objectForKey:@"provider"];
                v.iframe = [d objectForKey:@"iframe"];
                [arr addObject:v];
            }
            
            self.videosList = arr;
            [self updateTable];
            
        } else if (errMsg){
            NSLog(@" Error description %@", errMsg.debugDescription);
        }
    }];
}


- (void) updateTable {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    Videos *video = [self.videosList objectAtIndex:indexPath.row];
    VideoTableViewCell *vcell = (VideoTableViewCell*)cell;
     [vcell configureCell:video];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Videos *video = [self.videosList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"VideoVC" sender:video];
}

- (NSInteger) tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 10;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoTableViewCell *cell = (VideoTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"MainTV"];
    
    if(!cell){
        cell = [VideoTableViewCell new];
    }
    
    return cell;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.videosList.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    VideoViewController *vc = (VideoViewController*)segue.destinationViewController;
    
    Videos *video = (Videos*)sender;
    
    if (vc != nil && video != nil){
        vc.video = video;
    }
}

@end
