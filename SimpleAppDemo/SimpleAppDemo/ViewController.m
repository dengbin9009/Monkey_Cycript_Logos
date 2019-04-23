//
//  ViewController.m
//  SimpleAppDemo
//
//  Created by 邓斌 on 2019/4/23.
//  Copyright © 2019 DengBin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)tapAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tapAction:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"来啦" message:@"老弟😁😁😁" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [alert show];
}

@end
