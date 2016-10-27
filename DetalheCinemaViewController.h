//
//  DetalheCinemaViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 13/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaViewController.h"


@interface DetalheCinemaViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *nomeExib;
@property (strong, nonatomic) IBOutlet UILabel *nomeRepr;
@property (strong, nonatomic) IBOutlet UILabel *semana;
@property (strong, nonatomic) IBOutlet UILabel *custo30;
@property (strong, nonatomic) IBOutlet UILabel *dtTabela;

@property (strong, nonatomic) NSString *nomeExibString;
@property (strong, nonatomic) NSString *nomeReprString;
@property (strong, nonatomic) NSString *semanaString;
@property (strong, nonatomic) NSString *custo30String;
@property (strong, nonatomic) NSString *dtTabelaString;

@end
