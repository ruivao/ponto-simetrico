//
//  TelevisaoViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 25/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TelevisaoViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    // Televisão
    NSArray *tipoTVCollection;
    NSArray *redeTVCollection;
    NSArray *mercadoTVCollection;
    NSArray *programaTVCollection;
    NSArray *redesListaValor;
    NSArray *mercadosListaValor;
    NSArray *programasListaValor;
    NSArray *tiposTv;
    //-----
}

@property (strong, nonatomic) IBOutlet UITextField   *tipoTv;
@property (strong, nonatomic) IBOutlet UITextField   *redeTv;
@property (strong, nonatomic) IBOutlet UITextField   *programaTv;
@property (strong, nonatomic) IBOutlet UITextField   *mercadoTv;
@property (strong, nonatomic) IBOutlet UIButton      *buttonPesquisaTv;
@property (strong, nonatomic) IBOutlet UILabel       *lbTipoTv;
@property (strong, nonatomic) IBOutlet UILabel       *lbRedeTv;
@property (strong, nonatomic) IBOutlet UILabel       *lbProgramaTv;
@property (strong, nonatomic) IBOutlet UILabel       *lbMercadoTv;
@property (strong, nonatomic) IBOutlet UIPickerView  *tipoPicker;
@property (strong, nonatomic) IBOutlet UIPickerView  *redePicker;
@property (strong, nonatomic) IBOutlet UIPickerView  *mercadoPicker;
@property (strong, nonatomic) IBOutlet UIPickerView  *programaPicker;
@property IBOutlet UIActivityIndicatorView           *ampulhetaTV;

@property (strong, nonatomic) IBOutlet UIButton      *buttonOKTipoTv;
@property (strong, nonatomic) IBOutlet UIButton      *buttonOKRedeTv;
@property (strong, nonatomic) IBOutlet UIButton      *buttonOKMercadoTv;
@property (strong, nonatomic) IBOutlet UIButton      *buttonOKProgramaTv;

@end
