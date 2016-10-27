//
//  RadioViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 31/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{

    // Rádio
    NSArray *estadoRdCollection;
    NSArray *cidadeRdCollection;
    NSArray *radioCollection;
    NSArray *programaRadioCollection;
    
    NSArray *cidadeListaValoresRd;
    NSArray *radioListaValoresRd;
    NSArray *programaListaValoresRd;
    //------
}

@property (weak, nonatomic) IBOutlet UILabel *lbEstadoRadio;
@property (weak, nonatomic) IBOutlet UILabel *lbCidadeRadio;
@property (weak, nonatomic) IBOutlet UILabel *lbNomeRadio;
@property (weak, nonatomic) IBOutlet UILabel *lbProgramaRadio;

@property (strong, nonatomic) IBOutlet UITextField *estadoRadio;
@property (strong, nonatomic) IBOutlet UITextField *cidadeRadio;
@property (strong, nonatomic) IBOutlet UITextField *nomeRadio;
@property (strong, nonatomic) IBOutlet UITextField *programaRadio;
@property (strong, nonatomic) IBOutlet UIButton    *botaoPesquisaRadio;
@property (strong, nonatomic) IBOutlet UIPickerView *estadoRadioPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *cidadeRadioPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *nomeRadioPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *programaRadioPicker;
@property (strong, nonatomic) IBOutlet UIButton *estadoBotaoOKRd;
@property (strong, nonatomic) IBOutlet UIButton *cidadeBotaoOKRd;
@property (strong, nonatomic) IBOutlet UIButton *radioBotaoOKRd;
@property (strong, nonatomic) IBOutlet UIButton *programaBotaoOKRd;

@property (strong, nonatomic) NSString *detalheProgramaRd;
@property (strong, nonatomic) NSString *detalheMneuRd;
@property (strong, nonatomic) NSString *detalheHoraIniRd;
@property (strong, nonatomic) NSString *detalheHoraFimRd;
@property (strong, nonatomic) NSString *detalheSemanaRd;
@property (strong, nonatomic) NSString *detalheCusto30Rd;
@property (strong, nonatomic) NSString *detalheDataTabRd;

@property IBOutlet UIActivityIndicatorView          *ampulhetaRd;

@end
