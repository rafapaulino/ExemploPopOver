//
//  VCMudaCor.h
//  ExemploPopOver
//
//  Created by Rafael Brigagão Paulino on 26/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import <UIKit/UIKit.h>


//crindo o protocolo de delegate na classe onde ocorre o evento quando o usuario acionar um slider de uma cor, iremos avisar a tela principal de que a cor esta sendo mudada para que ela possa mudar sua cor de fundo

@protocol VCMUCorDelegate <NSObject>

@required
-(void)mudouCor:(UIColor*)novaCor;

@end

@interface VCMudaCor : UIViewController

@property (nonatomic, weak) id <VCMUCorDelegate> delegate;
@property (weak, nonatomic) IBOutlet UISlider *sldRed;
@property (weak, nonatomic) IBOutlet UISlider *sldGreen;
@property (weak, nonatomic) IBOutlet UISlider *sldBlue;

-(IBAction)mudouSlider:(id)sender;

@end
