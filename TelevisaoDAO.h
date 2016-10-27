//
//  TelevisaoDAO.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 25/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TelevisaoDAO : NSObject

@property (strong, nonatomic) NSMutableData  *webResponseDataTv;
@property (strong, nonatomic) NSMutableData  *webDataTv;
@property (strong, nonatomic) NSMutableArray *redeTvNomes;
@property (strong, nonatomic) NSMutableArray *redeTvValor;
@property (strong, nonatomic) NSMutableArray *mercadoTvNomes;
@property (strong, nonatomic) NSMutableArray *mercadoTvValor;
@property (strong, nonatomic) NSMutableArray *programaTvNomes;
@property (strong, nonatomic) NSMutableArray *programaTvValor;
@property (strong, nonatomic) NSMutableArray *tipoTvNomes;
@property (strong, nonatomic) NSMutableArray *tipoTvValor;

@property (strong, nonatomic) NSString *detalheNomeDoProgramaTv;
@property (strong, nonatomic) NSString *detalheMneumonicoTv;
@property (strong, nonatomic) NSString *detalheSemanaTv;
@property (strong, nonatomic) NSString *detalheCusto30Tv;
@property (strong, nonatomic) NSString *detalheHoraInicioTv;
@property (strong, nonatomic) NSString *detalheHoraFimTv;
@property (strong, nonatomic) NSString *detalheDataTabTv;


-(BOOL)requestSOAPXMLTipoTv:(NSString*)numTipoTv;
-(BOOL)requestSOAPXMLMercadoTv:(NSString*)numRedeTv;
-(BOOL)requestSOAPXMLProgramaTv:(NSString*)siglaRedeTv:(NSString *)valorProg;
-(BOOL)requestSOAPXMLDetalheTv:(NSString*)numProgTv:(NSString*)pracaTv:(NSString *)siglaRede;
-(void)erroTv:(NSString *)mensagemTv;

@end
