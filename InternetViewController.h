//
//  InternetViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 06/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InternetViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    
    // Internet
    NSArray *portalCollection;
    NSArray *siteCollection;
    NSArray *anuncioCollection;
    NSArray *vendaCollection;
    NSArray *portalValores;
    NSArray *siteValores;
    NSArray *anuncioValores;
    NSArray *vendaValores;
    //-----
}

@property (strong, nonatomic) IBOutlet UITextField *portal;
@property (strong, nonatomic) IBOutlet UITextField *site;
@property (strong, nonatomic) IBOutlet UITextField *anuncio;
@property (strong, nonatomic) IBOutlet UITextField *venda;

@property (strong, nonatomic) IBOutlet UIPickerView *portalPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *sitePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *anuncioPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *vendaPicker;

@property IBOutlet UIActivityIndicatorView          *ampulhetaInt;

@property (strong, nonatomic) IBOutlet UILabel *labelPortal;
@property (strong, nonatomic) IBOutlet UILabel *labelSite;
@property (strong, nonatomic) IBOutlet UILabel *labelAnuncio;
@property (strong, nonatomic) IBOutlet UILabel *labelVenda;

@property (strong, nonatomic) IBOutlet UIButton *buttonPesquisaInt;
@property (weak, nonatomic) IBOutlet UIButton *botaoOKPortal;
@property (weak, nonatomic) IBOutlet UIButton *botaoOKSite;
@property (weak, nonatomic) IBOutlet UIButton *botaoOKAnuncio;
@property (weak, nonatomic) IBOutlet UIButton *botaoOKVenda;



@end
