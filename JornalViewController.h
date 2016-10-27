//
//  JornalViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 03/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JornalViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{

     //Jornal
     NSArray *jornalCollectionJr;
     NSArray *estadoCollectionJr;
     NSArray *posicaoCollectionJr;
     NSArray *cidadeCollectionJr;
    
     NSArray *jornalListaValoresJr;
     NSArray *estadoListaValoresJr;
     NSArray *posicaoListaValoresJr;
     NSArray *cidadeListaValoresJr;
     //-----
}

@property (strong, nonatomic) IBOutlet UITextField  *estadoJornal;
@property (strong, nonatomic) IBOutlet UITextField  *cidadeJornal;
@property (strong, nonatomic) IBOutlet UITextField  *jornalJornal;
@property (strong, nonatomic) IBOutlet UITextField  *posicaoJornal;
@property (strong, nonatomic) IBOutlet UIPickerView *jornalPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *cidadePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *estadoPickerJr;
@property (strong, nonatomic) IBOutlet UIPickerView *posicaoPickerJr;

@property (strong, nonatomic) IBOutlet UILabel      *lbEstadoJr;
@property (strong, nonatomic) IBOutlet UILabel      *lbCidadeJr;
@property (strong, nonatomic) IBOutlet UILabel      *lbJornalJr;
@property (strong, nonatomic) IBOutlet UILabel      *lbPosicaoJr;

@property (strong, nonatomic) IBOutlet UIButton     *botaoOKEstadoJr;
@property (strong, nonatomic) IBOutlet UIButton     *botaoOKCidadeJr;
@property (strong, nonatomic) IBOutlet UIButton     *botaoOKJornalJr;
@property (strong, nonatomic) IBOutlet UIButton     *botaoOKPosicaoJr;
@property (strong, nonatomic) IBOutlet UIButton     *botaoProximaJr;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *ampulhetaJr;



@end
