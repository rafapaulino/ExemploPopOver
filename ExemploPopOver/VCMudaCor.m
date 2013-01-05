//
//  VCMudaCor.m
//  ExemploPopOver
//
//  Created by Rafael Brigagão Paulino on 26/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "VCMudaCor.h"

@interface VCMudaCor ()

@end

@implementation VCMudaCor
@synthesize sldRed;
@synthesize sldGreen;
@synthesize sldBlue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setSldRed:nil];
    [self setSldGreen:nil];
    [self setSldBlue:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)mudouSlider:(id)sender
{
    //local onde a cor esta sendo modificada, portanto devemos avisar o nosso delegate sobre a ocorrec]ncia desse evento
    UIColor *cor = [UIColor colorWithRed:sldRed.value green:sldGreen.value blue:sldBlue.value alpha:1];
    
    [_delegate mudouCor:cor];
}

@end
