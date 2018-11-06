//
//  ViewController.m
//  GaodeDebug
//
//  Created by 顾吉涛Air on 2018/11/6.
//  Copyright © 2018年 顾吉涛. All rights reserved.
//

#import "ViewController.h"
#import "DemoMapViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pushDemoMapViewController:(id)sender {
    DemoMapViewController *mvc = [[DemoMapViewController alloc] init];
    [self.navigationController pushViewController:mvc animated:YES];
}

@end
