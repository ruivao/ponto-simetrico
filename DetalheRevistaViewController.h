//
//  DetalheRevistaViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 01/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalheRevistaViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *lbDetNomeRevista;
@property (strong, nonatomic) IBOutlet UILabel *lbDetEditoraRevista;
@property (strong, nonatomic) IBOutlet UILabel *lbDetCorRevista;
@property (strong, nonatomic) IBOutlet UILabel *lbDetLarguraRevista;
@property (strong, nonatomic) IBOutlet UILabel *lbDetAlturaRevista;
@property (strong, nonatomic) IBOutlet UILabel *lbDetDETRevista;
@property (strong, nonatomic) IBOutlet UILabel *lbDetINDRevista;
@property (strong, nonatomic) IBOutlet UILabel *lbDetDataTabelaRevista;

@property (strong, nonatomic) NSString *nomeRevistaString;
@property (strong, nonatomic) NSString *editoraRevistaString;
@property (strong, nonatomic) NSString *corRevistaString;
@property (strong, nonatomic) NSString *larguraRevistaString;
@property (strong, nonatomic) NSString *alturaRevistaString;
@property (strong, nonatomic) NSString *indRevistaString;
@property (strong, nonatomic) NSString *detRevistaString;
@property (strong, nonatomic) NSString *dataTabelaRevistaString;


@end
