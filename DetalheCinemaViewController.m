//
//  DetalheCinemaViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 13/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "DetalheCinemaViewController.h"
#import "CinemaDAO.h"
#import "CinemaViewController.h"



@interface DetalheCinemaViewController ()

@end


@implementation DetalheCinemaViewController

@synthesize nomeExib;
@synthesize nomeRepr;
@synthesize semana;
@synthesize custo30;
@synthesize dtTabela;

@synthesize nomeExibString;
@synthesize nomeReprString;
@synthesize semanaString;
@synthesize custo30String;
@synthesize dtTabelaString;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    nomeExib.text = nomeExibString;
    nomeRepr.text = nomeReprString;
    semana.text   = semanaString;
    custo30.text  = custo30String;
    dtTabela.text = dtTabelaString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */






