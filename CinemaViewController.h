//
//  CinemaViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 02/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetalheCinemaViewController.h"

@protocol InformacaoDetalheCinemaDelegate <NSObject>

-(void)setNomeExib:(NSString *)nomeExibDet;
-(void)setNomeRepr:(NSString *)nomeReprDet;
-(void)setSemana:(NSString *)semanaDet;
-(void)setCusto30:(NSString *)custo30Det;
-(void)setDataTab:(NSString *)dtTabelaDet;

@end


@interface CinemaViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    
    // Cinema
    NSArray *estadoCollection;
    NSArray *cidadeCollection;
    NSArray *siglas;
    NSArray *salas;
    NSArray *salaCollection;
    NSArray *programaCollection;
    NSArray *programas;
    //-----
        
}



@property (strong, nonatomic) IBOutlet UIPickerView *estadoPicker;
@property (strong, nonatomic) IBOutlet UITextField  *estado;

@property (strong, nonatomic) IBOutlet UIPickerView *cidadePicker;
@property (strong, nonatomic) IBOutlet UITextField  *cidade;

@property (strong, nonatomic) IBOutlet UITextField  *sala;
@property (strong, nonatomic) IBOutlet UIPickerView *salaPicker;

@property (strong, nonatomic) IBOutlet UITextField  *programa;
@property (strong, nonatomic) IBOutlet UIPickerView *programaPicker;

@property (strong, nonatomic) IBOutlet UILabel      *labelCidade;
@property (strong, nonatomic) IBOutlet UILabel      *labelSala;
@property (strong, nonatomic) IBOutlet UILabel      *labelprograma;

@property IBOutlet UIActivityIndicatorView          *ampulheta;

@property (strong, nonatomic) IBOutlet UIButton     *buttonPesquisa;
@property (strong, nonatomic) IBOutlet UIButton     *buttonOKEstado;
@property (strong, nonatomic) IBOutlet UIButton     *buttonOKCidade;
@property (strong, nonatomic) IBOutlet UIButton     *buttonOKSala;
@property (strong, nonatomic) IBOutlet UIButton     *buttonOKPrograma;


@end








