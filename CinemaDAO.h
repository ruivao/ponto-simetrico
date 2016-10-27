//
//  CinemaDAO.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 13/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaDAO : NSObject{
    
    
}

@property (strong, nonatomic) NSMutableData  *webResponseDataCin;
@property (strong, nonatomic) NSMutableData  *webDataCin;
@property (strong, nonatomic) NSMutableArray *cidadesListaCin;
@property (strong, nonatomic) NSMutableArray *siglasListaCin;
@property (strong, nonatomic) NSMutableArray *salasNomesCin;
@property (strong, nonatomic) NSMutableArray *salasValorCin;
@property (strong, nonatomic) NSMutableArray *programaNomes;
@property (strong, nonatomic) NSMutableArray *programaValor;

@property (strong, nonatomic) NSString *detalheNomeExibCin;
@property (strong, nonatomic) NSString *detalheNomeReprCin;
@property (strong, nonatomic) NSString *detalheSemanaCin;
@property (strong, nonatomic) NSString *detalheCusto30Cin;
@property (strong, nonatomic) NSString *detalheDataTabCin;

-(BOOL)requestSOAPXMLSala:(NSString*)siglaCidade;
-(BOOL)requestSOAPXMLCin:(NSString*)siglaUFCin;
-(BOOL)requestSOAPXMLProg:(NSString*)numSala;
-(BOOL)requestSOAPXMLDetCin:(NSString*)numSalaDet:(NSString *)numProgrDet;
-(void)erroCin:(NSString *)mensagemCin;

@end
