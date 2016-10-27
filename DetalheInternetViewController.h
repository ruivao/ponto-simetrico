//
//  DetalheInternetViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 24/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalheInternetViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *custoAlturaFC;
@property (strong, nonatomic) IBOutlet UILabel *custoLarguraFC;
@property (strong, nonatomic) IBOutlet UILabel *custoAlturaAB;
@property (strong, nonatomic) IBOutlet UILabel *custoLarguraAB;
@property (strong, nonatomic) IBOutlet UILabel *custoTotal;
@property (strong, nonatomic) IBOutlet UILabel *dataTabelaInt;

@property (weak) NSString      *custoAlturaFCString;
@property (weak) NSString      *custoLarguraFCString;
@property (weak) NSString      *custoAlturaABString;
@property (weak) NSString      *custoLarguraABString;
@property (weak) NSString      *custoTotalString;
@property (weak) NSString      *dataTabelaIntString;


@end
