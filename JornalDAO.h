//
//  JornalDAO.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 03/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JornalDAO : NSObject

@property (strong, nonatomic) NSMutableData  *webResponseDataJr;
@property (strong, nonatomic) NSMutableData  *webDataJr;

@property (strong, nonatomic) NSMutableArray *estadoListaParametroJr;
@property (strong, nonatomic) NSMutableArray *cidadeListaParametroJr;
@property (strong, nonatomic) NSMutableArray *posicaoListaParametroJr;
@property (strong, nonatomic) NSMutableArray *jornaisListaParametroJr;
@property (strong, nonatomic) NSMutableArray *retrancaListaParametroJr;
@property (strong, nonatomic) NSMutableArray *corListaParametroJr;

@property (strong, nonatomic) NSMutableArray *estadoListaNomesJr;
@property (strong, nonatomic) NSMutableArray *cidadeListaNomesJr;
@property (strong, nonatomic) NSMutableArray *posicaoListaNomesJr;
@property (strong, nonatomic) NSMutableArray *jornaisListaNomesJr;
@property (strong, nonatomic) NSMutableArray *retrancaListaNomesJr;
@property (strong, nonatomic) NSMutableArray *corListaNomesJr;

@property (strong, nonatomic) NSString *detalheNomeCidadeJr;
@property (strong, nonatomic) NSString *detalheMnemJr;
@property (strong, nonatomic) NSString *detalheNomeJornalJr;
@property (strong, nonatomic) NSString *detalheNomeRepresJr;
@property (strong, nonatomic) NSString *detalhePosJr;
@property (strong, nonatomic) NSString *detalheNomeRetrancaJr;
@property (strong, nonatomic) NSString *detalheCorJr;
@property (strong, nonatomic) NSString *detalhePrecoDomJr;
@property (strong, nonatomic) NSString *detalhePrecoSegJr;
@property (strong, nonatomic) NSString *detalhePrecoTerJr;
@property (strong, nonatomic) NSString *detalhePrecoQuaJr;
@property (strong, nonatomic) NSString *detalhePrecoQuiJr;
@property (strong, nonatomic) NSString *detalhePrecoSexJr;
@property (strong, nonatomic) NSString *detalhePrecoSabJr;
@property (strong, nonatomic) NSString *detalheDataTabJr;


-(BOOL)requestSOAPXMLCidadeJr:(NSString*)siglaUFJr;
-(BOOL)requestSOAPXMLJornalJr:(NSString*)nomeCidadeJr;
-(BOOL)requestSOAPXMLPosicaoJr:(NSString*)mnemJr;
-(BOOL)requestSOAPXMLRetrancaJr:(NSString*)mnemJr:(NSString *)numPosicaoJr;
-(BOOL)requestSOAPXMLCorJr:(NSString*)mnemJr:(NSString *)valorRetrancaJr;
-(BOOL)requestSOAPXMLDetalheJr:(NSString*)mnemJr:(NSString *)numPosicaoJr:(NSString *)valorRetrancaJr;
-(void)erroJr:(NSString *)mensagemRd;

@end
