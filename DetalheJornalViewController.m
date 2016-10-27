//
//  DetalheJornalViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 07/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "DetalheJornalViewController.h"

@interface DetalheJornalViewController ()

@end

@implementation DetalheJornalViewController

@synthesize lbEstadoCidade;
@synthesize lbMnemJr2;
@synthesize lbNomeJornalJr2;
@synthesize lbNomeRepresentanteJr2;
@synthesize lbPosicaoJr2;
@synthesize lbRetrancaJr2;
@synthesize lbCorJr2;
@synthesize lbCustoDomJr2;
@synthesize lbCustoSegJr2;
@synthesize lbCustoTerJr2;
@synthesize lbCustoQuaJr2;
@synthesize lbCustoQuiJr2;
@synthesize lbCustoSexJr2;
@synthesize lbCustoSabJr2;
@synthesize lbDataTabelaJr2;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lbEstadoCidade.text         = _estadoCidadeJornal;
    self.lbMnemJr2.text              = _mnemJornal;
    self.lbNomeJornalJr2.text        = _nomeJornal;
    self.lbNomeRepresentanteJr2.text = _nomeRepresentanteJornal;
    self.lbPosicaoJr2.text           = _posicaoJornal;
    self.lbRetrancaJr2.text          = _retrancaJornal;
    self.lbCorJr2.text               = _corJornal;
    self.lbCustoDomJr2.text          = _custoDom;
    self.lbCustoSegJr2.text          = _custoSeg;
    self.lbCustoTerJr2.text          = _custoTer;
    self.lbCustoQuaJr2.text          = _custoQua;
    self.lbCustoQuiJr2.text          = _custoQui;
    self.lbCustoSexJr2.text          = _custoSex;
    self.lbCustoSabJr2.text          = _custoSab;
    self.lbDataTabelaJr2.text        = _dataTabelaJornal;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
