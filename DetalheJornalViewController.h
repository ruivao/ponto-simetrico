//
//  DetalheJornalViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 07/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalheJornalViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *lbEstadoCidade;

@property (strong, nonatomic) IBOutlet UILabel *lbMnemJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbNomeJornalJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbNomeRepresentanteJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbPosicaoJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbRetrancaJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbCorJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbCustoDomJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbCustoSegJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbCustoTerJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbCustoQuaJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbCustoQuiJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbCustoSexJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbCustoSabJr2;
@property (strong, nonatomic) IBOutlet UILabel *lbDataTabelaJr2;

@property (strong, nonatomic) NSString *estadoCidadeJornal;
@property (strong, nonatomic) NSString *mnemJornal;
@property (strong, nonatomic) NSString *nomeJornal;
@property (strong, nonatomic) NSString *nomeRepresentanteJornal;
@property (strong, nonatomic) NSString *posicaoJornal;
@property (strong, nonatomic) NSString *retrancaJornal;
@property (strong, nonatomic) NSString *corJornal;
@property (strong, nonatomic) NSString *custoDom;
@property (strong, nonatomic) NSString *custoSeg;
@property (strong, nonatomic) NSString *custoTer;
@property (strong, nonatomic) NSString *custoQua;
@property (strong, nonatomic) NSString *custoQui;
@property (strong, nonatomic) NSString *custoSex;
@property (strong, nonatomic) NSString *custoSab;
@property (strong, nonatomic) NSString *dataTabelaJornal;


@end
