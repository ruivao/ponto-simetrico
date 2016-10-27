//
//  RevistaDAO.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 01/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RevistaDAO : NSObject
@property (strong, nonatomic) NSMutableData  *webResponseDataRv;
@property (strong, nonatomic) NSMutableData  *webDataRv;
@property (strong, nonatomic) NSMutableArray *revistaListaParametroRv;
@property (strong, nonatomic) NSMutableArray *formatosListaParametroRv;

@property (strong, nonatomic) NSMutableArray *revistaListaNomesRd;
@property (strong, nonatomic) NSMutableArray *formatoListaNomesRd;

@property (strong, nonatomic) NSString *detalheNomeRevistaRv;
@property (strong, nonatomic) NSString *detalheEditoraRevistaRv;
@property (strong, nonatomic) NSString *detalheCorRevistaRv;
@property (strong, nonatomic) NSString *detalheLarguraRevistaRv;
@property (strong, nonatomic) NSString *detalheAlturaRevistaRv;
@property (strong, nonatomic) NSString *detalheIndRevistaRv;
@property (strong, nonatomic) NSString *detalheDetRevistaRv;
@property (strong, nonatomic) NSString *detalheCustoRevistaRv;
@property (strong, nonatomic) NSString *detalheDataTabelaRevistaRv;


-(BOOL)requestSOAPXMLRevistasRv:(NSString*)nomeRevistaLocaliza;
-(BOOL)requestSOAPXMLFormatosRv:(NSString*)nomeRevistaRv;
-(BOOL)requestSOAPXMLDetRevistaRv:(NSString*)mnemRv:(NSString *)formatoRv;
-(void)erroRd:(NSString *)mensagemRd;

@end
