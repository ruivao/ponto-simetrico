//
//  DetalheTelevisaoViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 30/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalheTelevisaoViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *lbNomeDaProgramacaoTv;
@property (strong, nonatomic) IBOutlet UILabel *lbMneumonicoProgrTv;
@property (strong, nonatomic) IBOutlet UILabel *lbHoraInicioTv;
@property (strong, nonatomic) IBOutlet UILabel *lbHoraFimTv;
@property (strong, nonatomic) IBOutlet UILabel *lbSemanaTv;
@property (strong, nonatomic) IBOutlet UILabel *custo30Tv;
@property (strong, nonatomic) IBOutlet UILabel *dataTabelaTv;

@property (strong, nonatomic) NSString *nomeDaProgTvString;
@property (strong, nonatomic) NSString *mneumonicoProgrTvString;
@property (strong, nonatomic) NSString *horaInicioTvString;
@property (strong, nonatomic) NSString *horaFimTvString;
@property (strong, nonatomic) NSString *semanaTvString;
@property (strong, nonatomic) NSString *custo30TvString;
@property (strong, nonatomic) NSString *dataTabelaTvString;



@end
