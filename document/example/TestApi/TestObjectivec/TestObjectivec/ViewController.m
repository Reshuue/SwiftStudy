//
//  ViewController.m
//  TestObjectivec
//
//  Created by vnenise on 2017. 3. 15..
//  Copyright © 2017년 vnenise. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int days = 365;
    int hours = 24;
    int minutes = 60;
    
    int minuteInyear = days * hours * minutes ;
    NSLog(@"There are %d minutes  in a year", minuteInyear);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
