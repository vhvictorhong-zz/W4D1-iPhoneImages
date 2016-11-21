//
//  ViewController.m
//  iPhoneImages
//
//  Created by Victor Hong on 21/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iPhoneImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://i.imgur.com/bktnImE.png"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL *_Nullable location, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        
        if (error) {
            
            //Handle error
            NSLog(@"error: %@", error.localizedDescription);
            return;
            
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            //This will run on the main queue
            self.iPhoneImageView.image = image;
            
        }];
        
    }];
    
    [downloadTask resume];
    
}

- (IBAction)loadRandomImage:(UIButton *)sender {
    
    NSURL *url = [NSURL URLWithString:[self makeRandomURL]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL *_Nullable location, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        
        if (error) {
            
            //Handle error
            NSLog(@"error: %@", error.localizedDescription);
            return;
            
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            //This will run on the main queue
            self.iPhoneImageView.image = image;
            
        }];
        
    }];
    
    [downloadTask resume];
}

-(NSString *)makeRandomURL {
    
    int randomNumber = arc4random_uniform(4);
    NSArray *listOfURL = @[@"http://i.imgur.com/bktnImE.png",
                           @"http://i.imgur.com/zdwdenZ.png",
                           @"https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP744/iphone7-plus-gold.png",
                           @"https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP744/iphone7-plus-silver.png",
                           @"http://i.imgur.com/y9MIaCS.png"];
    
    return listOfURL[randomNumber];
    
}

@end
