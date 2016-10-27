//
//  DetalheTelevisaoViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 30/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "DetalheTelevisaoViewController.h"

@interface DetalheTelevisaoViewController ()

@end

@implementation DetalheTelevisaoViewController

@synthesize lbNomeDaProgramacaoTv;
@synthesize lbMneumonicoProgrTv;
@synthesize lbHoraInicioTv;
@synthesize lbHoraFimTv;
@synthesize lbSemanaTv;
@synthesize custo30Tv;
@synthesize dataTabelaTv;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lbNomeDaProgramacaoTv.text = _nomeDaProgTvString;
    self.lbMneumonicoProgrTv.text   = _mneumonicoProgrTvString;
    self.lbHoraInicioTv.text        = _horaInicioTvString;
    self.lbHoraFimTv.text           = _horaFimTvString;
    self.lbSemanaTv.text            = _semanaTvString;
    self.custo30Tv.text             = _custo30TvString;
    self.dataTabelaTv.text          = _dataTabelaTvString;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
