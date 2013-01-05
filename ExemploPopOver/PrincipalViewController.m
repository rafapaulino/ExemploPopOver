//
//  PrincipalViewController.m
//  ExemploPopOver
//
//  Created by Rafael Brigagão Paulino on 25/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "PrincipalViewController.h"


@interface PrincipalViewController ()
{
    //popovercontroller é a classe que carrega um vc dentro dele, é ele que mostra o layout das bordas ao redor do VC, é ele que decide para qual lado vai aparecer a tela, é ele que gerencia quand a tela vai aparecer
    UIPopoverController *controladorPopOverImagem;
    VCImagem *vcImg;
    
    UIPopoverController *controladorPopOverMudaCor;
    VCMudaCor *vcMudaCor;
    
    UIPopoverController *controladorPopOverFotos;
    CGPoint toqueNaTela;
    
}

@end

@implementation PrincipalViewController


-(IBAction)mostrarPopOverImagem:(id)sender
{
    UIButton *btn = sender;
    
    vcImg.imgv.image = [UIImage imageNamed:@"Angelina.jpg"];
    
    //apresentar o popOver na tela
    //precisamos falar para o popOver para onde ele deve apontar ele nos pede um parametro cgrect, que é para onde ele vai appontar. um cgrecté uma area
    //automaticamente ele vai apontar para o centro dessa area
    [controladorPopOverImagem presentPopoverFromRect:btn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}


-(IBAction)mostrarPopOverMudaCor:(id)sender
{
    UIButton *btn = sender;
    
    
    //apresentar o popOver na tela
    //precisamos falar para o popOver para onde ele deve apontar ele nos pede um parametro cgrect, que é para onde ele vai appontar. um cgrecté uma area
    //automaticamente ele vai apontar para o centro dessa area
    [controladorPopOverMudaCor presentPopoverFromRect:btn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
     
-(void)mudouCor:(UIColor *)novaCor
{
    self.view.backgroundColor = novaCor;
}


//etodo acionado antes do popover fechar com intencao de bs perguntar se desejamos realmente fecha-lo
-(BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    //aqui nsse ponto podemos verificar se o usuaio esta no meio de um processo critico dentro do popover, caso sim, nao permitir que poover feche automaticamente e lancar um alerta para ele decidir
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Ops!" message:@"Você deseja realmente fechar a tela?" delegate:self cancelButtonTitle:@"Sim" otherButtonTitles:@"Não", nil];
    
    [alerta show];
    
    return NO;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //0 botao cancelar
    //1 - otherbuttons na sequencia que foi colocado
    if (buttonIndex == 0)
    {
        //se o usuario escolher SIM, chamaos o metodo dismissPopOverAnimated. este metodo nao aciona o souldDismiss novamente. O shouldDismiss é acionado apenas quando o usuario toca fora do popOver
        [controladorPopOverImagem dismissPopoverAnimated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    vcImg = [self.storyboard instantiateViewControllerWithIdentifier:@"idView"];
    
    
    //e apropriado instanciar o popOver no view did load para evitar que ele seja instanciado no momento do clique no botao e demore milesimos de sefundos a mais
    
    //no momento em que criamos o popOver, colocamos qual vc ele carregara
    controladorPopOverImagem = [[UIPopoverController alloc] initWithContentViewController:vcImg];
    
    //setar o delegate do controlador ppover imagem para quee ele nos avise quando o popOver estiver fechando
    controladorPopOverImagem.delegate = self;
    
    
    vcMudaCor = [self.storyboard instantiateViewControllerWithIdentifier:@"idVCMudaCor"];
    
    //quando o usuario mudar o slider de cores, nossa classe sera acionada
    vcMudaCor.delegate = self;
    
    controladorPopOverMudaCor = [[UIPopoverController alloc] initWithContentViewController:vcMudaCor];

}

- (void)viewDidUnload
{
   
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *toque = [touches anyObject];
    toqueNaTela = [toque locationInView:self.view];
    
    //criar imagePicker
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    controladorPopOverFotos = [[UIPopoverController alloc] initWithContentViewController:picker];
    
    //mostrar o popOver na tela
    [controladorPopOverFotos presentPopoverFromRect:CGRectMake(toqueNaTela.x, toqueNaTela.y, 1, 1) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

//metodo acionado quando o usuario termina de captar a foto
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(toqueNaTela.x -100, toqueNaTela.y -100, 200, 200)];
    imgv.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.view addSubview:imgv];
    
    //faz o popOver sumir
    [controladorPopOverFotos dismissPopoverAnimated:YES];
}

@end
