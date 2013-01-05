//
//  PrincipalViewController.h
//  ExemploPopOver
//
//  Created by Rafael Brigagão Paulino on 25/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCImagem.h"
#import "VCMudaCor.h"

@interface PrincipalViewController : UIViewController <VCMUCorDelegate,UIPopoverControllerDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

-(IBAction)mostrarPopOverImagem:(id)sender;
-(IBAction)mostrarPopOverMudaCor:(id)sender;



@end
