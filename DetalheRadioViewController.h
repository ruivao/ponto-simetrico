//
//  DetalheRadioViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 31/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalheRadioViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *detNomeProgramaRadio;
@property (strong, nonatomic) IBOutlet UILabel *detMneuRadio;
@property (strong, nonatomic) IBOutlet UILabel *detHoraIniRadio;
@property (strong, nonatomic) IBOutlet UILabel *detHoraFimRadio;
@property (strong, nonatomic) IBOutlet UILabel *detSemanaRadio;
@property (strong, nonatomic) IBOutlet UILabel *detCusto30Radio;
@property (strong, nonatomic) IBOutlet UILabel *detDataTabelaRadio;

@property (strong, nonatomic) NSString *nomeProgramaRadioString;
@property (strong, nonatomic) NSString *mneuRadioString;
@property (strong, nonatomic) NSString *horaIniRadioString;
@property (strong, nonatomic) NSString *horaFimRadioString;
@property (strong, nonatomic) NSString *semanaRadioString;
@property (strong, nonatomic) NSString *custo30RadioString;
@property (strong, nonatomic) NSString *dataTabelaRadioString;


@end
