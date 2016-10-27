//
//  RevistaViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 01/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RevistaViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    
    // Revista
    NSArray *nomeRevistaCollection;
    NSArray *revistaListaValoresRv;
    NSArray *formatoCollection;
    NSArray *formatoListaValoresRv;
    //-----
    
}

@property (strong, nonatomic) IBOutlet UITextField *localizaRevista;
@property (strong, nonatomic) IBOutlet UITextField *nomeRevistaRv;
@property (strong, nonatomic) IBOutlet UITextField *formatoRevistaRv;
@property (strong, nonatomic) IBOutlet UIButton    *botaoLocalizar;
@property (strong, nonatomic) IBOutlet UIButton *botaoOKRevistaRv;
@property (strong, nonatomic) IBOutlet UIButton *botaoOKFormatoRv;
@property (strong, nonatomic) IBOutlet UIButton *botaoPesquisaRv;
@property (strong, nonatomic) IBOutlet UIPickerView *nomeRevistaPickerRv;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *ampulhetaRv;
@property (strong, nonatomic) IBOutlet UILabel *lbRevistaRv;
@property (strong, nonatomic) IBOutlet UILabel *lbFormatoRv;
@property (strong, nonatomic) IBOutlet UIPickerView *formatoRevistaPickerRv;

@property (strong, nonatomic) NSString *detalheNomeRevista;
@property (strong, nonatomic) NSString *detalheFormatoRevista;
@property (strong, nonatomic) NSString *detalheEditoraRevista;
@property (strong, nonatomic) NSString *detalheCoresRevista;
@property (strong, nonatomic) NSString *detalheLarguraRevista;
@property (strong, nonatomic) NSString *detalheAlturaRevista;
@property (strong, nonatomic) NSString *detalheIndRevista;
@property (strong, nonatomic) NSString *detalheDetRevista;
@property (strong, nonatomic) NSString *detalheDataTabelaRevista;

@end
