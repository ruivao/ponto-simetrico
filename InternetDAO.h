//
//  InternetDAO.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 23/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InternetDAO : NSObject

@property (strong, nonatomic) NSMutableData  *webResponseDataInt;
@property (strong, nonatomic) NSMutableData  *webDataInt;
@property (strong, nonatomic) NSMutableArray *portalListaInt;
@property (strong, nonatomic) NSMutableArray *siteListaInt;
@property (strong, nonatomic) NSMutableArray *anuncioListaInt;
@property (strong, nonatomic) NSMutableArray *vendaListaInt;
@property (strong, nonatomic) NSMutableArray *portalListaValores;
@property (strong, nonatomic) NSMutableArray *siteListaValores;
@property (strong, nonatomic) NSMutableArray *anuncioListaValores;
@property (strong, nonatomic) NSMutableArray *vendaListaValores;

@property (strong, nonatomic) NSString *detalheCustoAlturaFC;;
@property (strong, nonatomic) NSString *detalheCustoLarguraFC;
@property (strong, nonatomic) NSString *detalheCustoAlturaAB;
@property (strong, nonatomic) NSString *detalheCustoLarguraAB;
@property (strong, nonatomic) NSString *detalheCustoTotal;
@property (strong, nonatomic) NSString *detalheDataTabelaInt;

-(BOOL)requestSOAPXMLPortal;
-(BOOL)requestSOAPXMLSite:numPortalSite;
-(BOOL)requestSOAPXMLAnuncio:(NSString *)website:(NSString *)codPortal;
-(BOOL)requestSOAPXMLVenda:(NSString *)numAnuncio:(NSString *)numPortal:(NSString *)numSite;
-(BOOL)requestSOAPXMLDetInt:(NSString *)codVenda:(NSString *)codPortal:(NSString *)codSite:(NSString *)codAnuncio;


@end
