//
//  DetalheInternetViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 24/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "DetalheInternetViewController.h"

@interface DetalheInternetViewController ()

@end

@implementation DetalheInternetViewController

@synthesize custoAlturaFC;
@synthesize custoLarguraFC;
@synthesize custoAlturaAB;
@synthesize custoLarguraAB;
@synthesize custoTotal;
@synthesize dataTabelaInt;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    custoAlturaFC.text   = _custoAlturaFCString;
    custoLarguraFC.text  = _custoLarguraFCString;
    custoAlturaAB.text   = _custoAlturaABString;
    custoLarguraAB.text  = _custoLarguraABString;
    custoTotal.text      = _custoTotalString;
    dataTabelaInt.text   = _dataTabelaIntString;
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
