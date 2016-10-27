//
//  DetalheRadioViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 31/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "DetalheRadioViewController.h"

@interface DetalheRadioViewController ()

@end

@implementation DetalheRadioViewController

@synthesize detNomeProgramaRadio;
@synthesize detMneuRadio;
@synthesize detSemanaRadio;
@synthesize detCusto30Radio;
@synthesize detHoraIniRadio;
@synthesize detHoraFimRadio;
@synthesize detDataTabelaRadio;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detNomeProgramaRadio.text   =  _nomeProgramaRadioString;
    self.detMneuRadio.text           =  _mneuRadioString;
    self.detHoraIniRadio.text        =  _horaIniRadioString;
    self.detHoraFimRadio.text        =  _horaFimRadioString;
    self.detSemanaRadio.text         =  _semanaRadioString;
    self.detCusto30Radio.text        =  _custo30RadioString;
    self.detDataTabelaRadio.text     =  _dataTabelaRadioString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
