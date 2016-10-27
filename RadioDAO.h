//
//  RadioDAO.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 31/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RadioDAO : NSObject


@property (strong, nonatomic) NSMutableData  *webResponseDataRd;
@property (strong, nonatomic) NSMutableData  *webDataRd;
@property (strong, nonatomic) NSMutableArray *estadoListaParametroRd;
@property (strong, nonatomic) NSMutableArray *cidadeListaParametroRd;
@property (strong, nonatomic) NSMutableArray *radiosListaParametroRd;
@property (strong, nonatomic) NSMutableArray *programasListaParametroRd;

@property (strong, nonatomic) NSMutableArray *estadoListaNomesRd;
@property (strong, nonatomic) NSMutableArray *cidadeListaNomesRd;
@property (strong, nonatomic) NSMutableArray *radiosListaNomesRd;
@property (strong, nonatomic) NSMutableArray *programasListaNomesRd;

@property (strong, nonatomic) NSString *detalheNomeProgramaRd;
@property (strong, nonatomic) NSString *detalheMneumonicoRd;
@property (strong, nonatomic) NSString *detalheHoraIniRd;
@property (strong, nonatomic) NSString *detalheHoraFimRd;
@property (strong, nonatomic) NSString *detalheSemanaRd;
@property (strong, nonatomic) NSString *detalheCusto30Rd;
@property (strong, nonatomic) NSString *detalheDataTabelaRd;


-(BOOL)requestSOAPXMLCidadeRd:(NSString*)siglaUFRd;
-(BOOL)requestSOAPXMLRadioRd:(NSString*)nomeCidadeRd;
-(BOOL)requestSOAPXMLProgramaRd:(NSString*)numRadioRd;
-(BOOL)requestSOAPXMLDetetalheRd:(NSString*)numProgRd:(NSString *)numRadioRd;
-(void)erroRd:(NSString *)mensagemRd;



@end
