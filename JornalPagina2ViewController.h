//
//  JornalPagina2ViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 03/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JornalPagina2ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
   
    NSArray *retrancaCollectionJr;
    NSArray *corCollectionJr;
    NSArray *retrancaListaValoresJr;
    NSArray *corListaValoresJr;

}

@property (strong, nonatomic) IBOutlet UITextField *retrancaJornal;
@property (strong, nonatomic) IBOutlet UIButton *botaoOKRetrancaJr;
@property (strong, nonatomic) IBOutlet UITextField *corJornal;
@property (strong, nonatomic) IBOutlet UILabel *lbRetrancaJr;
@property (strong, nonatomic) IBOutlet UILabel *lbCorJornal;
@property (strong, nonatomic) IBOutlet UIButton *botaoOKCorJr;
@property (strong, nonatomic) IBOutlet UIButton *botaoPesquisaJr;

@property (strong, nonatomic) IBOutlet UIPickerView *retrancaPickerJr;
@property (strong, nonatomic) IBOutlet UIPickerView *corPickerJr;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *ampulhetaJr2;

@property (strong, nonatomic) NSString *jornalSelect;
@property (strong, nonatomic) NSString *posicaoSelect;
@property (strong, nonatomic) NSString *estadoSelect;
@property (strong, nonatomic) NSString *cideadeSelect;
@property (strong, nonatomic) NSString *nomeJornalSelect;

@property (strong, nonatomic) NSString *detalheCidadeJr;
@property (strong, nonatomic) NSString *detalheMnemJr;
@property (strong, nonatomic) NSString *detalheJornalJr;
@property (strong, nonatomic) NSString *detalhePosJr;
@property (strong, nonatomic) NSString *detalheRepresJr;
@property (strong, nonatomic) NSString *detalheRetrancaJr;
@property (strong, nonatomic) NSString *detalheCorJr;
@property (strong, nonatomic) NSString *detalhePrecoDomJr;
@property (strong, nonatomic) NSString *detalhePrecoSegJr;
@property (strong, nonatomic) NSString *detalhePrecoTerJr;
@property (strong, nonatomic) NSString *detalhePrecoQuaJr;
@property (strong, nonatomic) NSString *detalhePrecoQuiJr;
@property (strong, nonatomic) NSString *detalhePrecoSexJr;
@property (strong, nonatomic) NSString *detalhePrecoSabJr;
@property (strong, nonatomic) NSString *detalheDataTabJr;


@end
