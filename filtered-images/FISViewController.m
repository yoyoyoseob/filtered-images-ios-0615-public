//
//  FISViewController.m
//  filtered-images
//
//  Created by Joe Burgess on 7/23/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import <UIImage+Filters.h>

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)vignetterTapped:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)vignetterTapped:(id)sender {

    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
    UIImage *filtered = [nonFiltered imageWithFilter:UIImageFilterTypeColorInvert];
    self.imageView.image = filtered;
}
@end
