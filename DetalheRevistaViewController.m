//
//  DetalheRevistaViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 01/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "DetalheRevistaViewController.h"

@interface DetalheRevistaViewController ()

@end

@implementation DetalheRevistaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.lbDetNomeRevista.text        =  _nomeRevistaString;
    self.lbDetEditoraRevista.text     =  _editoraRevistaString;
    self.lbDetCorRevista.text         =  _corRevistaString;
    self.lbDetLarguraRevista.text     =  _larguraRevistaString;
    self.lbDetAlturaRevista.text      =  _alturaRevistaString;
    self.lbDetDETRevista.text         =  _detRevistaString;
    self.lbDetINDRevista.text         =  _indRevistaString;
    self.lbDetDataTabelaRevista.text  =  _dataTabelaRevistaString;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
