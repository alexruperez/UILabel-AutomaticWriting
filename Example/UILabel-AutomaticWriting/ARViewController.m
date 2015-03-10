//
//  ARViewController.m
//  UILabel-AutomaticWriting
//
//  Created by alexruperez on 03/10/2015.
//  Copyright (c) 2014 alexruperez. All rights reserved.
//

#import "ARViewController.h"
#import <UILabel-AutomaticWriting/UILabel+AutomaticWriting.h>

@interface ARViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.label setText:@"CHECK THIS!" automaticWritingAnimationWithBlinkingMode:UILabelAWBlinkingModeWhenFinishShowing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
