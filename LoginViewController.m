//
//  LoginViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 05/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//


#import "LoginViewController.h"
#import "MenuPrincipalViewController.h"
#import "LoginDAO.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize usuario;
@synthesize senha;
@synthesize ok;
@synthesize ampulheta;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    ampulheta.hidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)okButtonClick:(id)sender{
    ampulheta.hidden = NO;
    ok.hidden        = YES;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];

    if(usuario.text)
        if(senha.text)
            [self usuarioSenhaOK];
        else
            [self usuarioSenhaIncorreta];
    else
        [self usuarioSenhaIncorreta];
    
    [ampulheta stopAnimating];
    ampulheta.hidden = YES;
    ok.hidden        =  NO;
}

- (void) threadStartAnimating {
    [ampulheta setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulheta];
    [ampulheta startAnimating];
}


-(void)usuarioSenhaOK{
    LoginDAO *log = [LoginDAO new];
    BOOL requestOK = [log requestSOAPXML:self.usuario.text :self.senha.text];
    
    if(requestOK == YES){
        if([log login] == YES){
            midiasNomesMenu    = NULL;
            midiasValoresMenu  = NULL;
            midiasNomesMenu    = [[NSMutableArray alloc]initWithArray: log.midiasNomes];
            midiasValoresMenu  = [[NSMutableArray alloc]initWithArray: log.midiasValores];
            [self validaMenu];
          [self mostraTelaDeMenu];
        }
    }
}

-(void)usuarioSenhaIncorreta{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta!" message:@"Usuário ou senha inválido..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil,nil];
    [alert show];
}


-(void)mostraTelaDeMenu{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MenuPrincipalViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Menu-Principal"];
    
    //form.midiasNomesParametros = midiasNomesMenu;
    
    
    [self.navigationController pushViewController:form animated:YES];
}

-(void)validaMenu{
    NSInteger a = 0;
    
    while(a < midiasValoresMenu.count){
        if([[midiasValoresMenu objectAtIndex:a]  isEqual: @"0"]){
            [midiasValoresMenu removeObjectAtIndex:a];
            [midiasNomesMenu removeObjectAtIndex:a];
        }
        ++a;
    }
}


@end









