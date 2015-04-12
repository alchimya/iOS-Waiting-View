//
//  ViewController.m
//  iOS-Waiting-View
//
//  Created by Domenico Vacchiano on 12/04/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "ViewController.h"
#import "L3SDKWaitingView.h"

@interface ViewController ()
-(IBAction)showWait:(id)sender;
-(IBAction)showWaitProgress:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)showWait:(id)sender{
    //show waiting view
    [NSThread detachNewThreadSelector: @selector(showWaitingWithTitle:) toTarget:self.view withObject:@"Wait Please"];
    [NSThread sleepForTimeInterval:5];
    [self.view hideWaiting];
}
-(IBAction)showWaitProgress:(id)sender{
    
    //show waiting view with a progress label indicator
    [NSThread detachNewThreadSelector: @selector(showWaitingWithTitle:) toTarget:self.view withObject:@"Wait Please"];
    
    for (int i=1; i<=10; i++) {
        [NSThread sleepForTimeInterval:0.5];
        //update a progress label indicator
        [self.view updateWaitingValue:[NSString stringWithFormat:@"%d",i]];
    }
    [self.view hideWaiting];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end