//
//  FISViewController.m
//  filtered-images
//
//  Created by Joe Burgess on 7/23/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import "UIImage+Filters.h"
#import "MBProgressHUD.h"
#import "FISApplyFilterOperation.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *nonFilteredImage;

- (IBAction)vignetterTapped:(id)sender;
- (IBAction)inverterTapped:(id)sender;
- (IBAction)sepiaTapped:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nonFilteredImage = [UIImage imageNamed:@"Mickey.jpg"];
    self.imageView.image = self.nonFilteredImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)vignetterTapped:(id)sender
{
    [self performOperation:UIImageFilterTypeVignette];
}

- (IBAction)inverterTapped:(id)sender
{
    [self performOperation:UIImageFilterTypeColorInvert];
}

- (IBAction)sepiaTapped:(id)sender
{
    [self performOperation:UIImageFilterTypeSepia];
}

- (void) performOperation:(UIImageFilterType)type
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    
    FISApplyFilterOperation *filterOperation = [[FISApplyFilterOperation alloc]initWithImage:self.nonFilteredImage filter:type];
    
    filterOperation.block = ^(UIImage *filteredImage)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.imageView.image = filteredImage;
    };
    
    [operationQueue addOperation:filterOperation];
}

@end
