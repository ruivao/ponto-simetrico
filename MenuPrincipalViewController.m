//
//  MenuPrincipalViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 02/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "MenuPrincipalViewController.h"
#import "CinemaViewController.h"
#import "InternetViewController.h"
#import "TelevisaoViewController.h"
#import "RadioViewController.h"
#import "RevistaViewController.h"
#import "JornalViewController.h"

@interface MenuPrincipalViewController ()

@end

@implementation MenuPrincipalViewController


@synthesize buttonCinema;
@synthesize buttonInternet;
@synthesize buttonTelevisao;
@synthesize buttonRevista;
@synthesize buttonRadio;
@synthesize buttonJornal;
@synthesize ampulhetaMenu;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ampulhetaMenu.hidden   = YES;
    buttonCinema.hidden    = YES;
    buttonInternet.hidden  = YES;
    buttonTelevisao.hidden =  NO;
    buttonRadio.hidden     = YES;
    buttonJornal.hidden    = YES;
    buttonRevista.hidden   = YES;
    [self.navigationItem setHidesBackButton:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)botaoCinemaClick:(id)sender{
    ampulhetaMenu.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CinemaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Cinema"];
    [ampulhetaMenu stopAnimating];
    ampulhetaMenu.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
}



-(IBAction)botaoInternetClick:(id)sender{
    ampulhetaMenu.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    InternetViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Internet"];
    [ampulhetaMenu stopAnimating];
    ampulhetaMenu.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
}

-(IBAction)botaoTVClick:(id)sender{
    ampulhetaMenu.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TelevisaoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-TV"];
    [ampulhetaMenu stopAnimating];
    ampulhetaMenu.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
}

- (IBAction)botaoRadioClick:(id)sender {
    ampulhetaMenu.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RadioViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Radio"];
    [ampulhetaMenu stopAnimating];
    ampulhetaMenu.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
}

- (IBAction)botaoRevistaClick:(id)sender {
    ampulhetaMenu.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RevistaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Revista"];
    [ampulhetaMenu stopAnimating];
    ampulhetaMenu.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
    
}

- (IBAction)botaoJornalClick:(id)sender {
    ampulhetaMenu.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    JornalViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Jornal"];
    [ampulhetaMenu stopAnimating];
    ampulhetaMenu.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
}


- (void) threadStartAnimating {
    [ampulhetaMenu setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulhetaMenu];
    [ampulhetaMenu startAnimating];
}


@end






