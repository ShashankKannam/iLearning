//
//  VideoViewController.m
//  iOSConceptsVideos
//
//  Created by shashank kannam on 4/1/17.
//  Copyright © 2017 shashank. All rights reserved.
//

#import "VideoViewController.h"
#import "Videos.h"

@interface VideoViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleV;
@property (weak, nonatomic) IBOutlet UILabel *descriptionV;

@end

@implementation VideoViewController
- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self updateData];
    // Do any additional setup after loading the view.
}

- (void)updateData {
    
    self.titleV.text = _video.title;
    self.descriptionV.text = _video.description1;
    
    [self.webView loadHTMLString:_video.iframe baseURL:nil];
    
    // Dispose of any resources that can be recreated.
}

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    NSString *css = @".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%; } .video { position: absolute; top: 0; left: 0; width: 100%; height: 100%;}";
    
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    NSLog(@"js:\n%@",js);
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
