//
//  TelevisaoDAO.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 25/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "TelevisaoDAO.h"
#import "TelevisaoViewController.h"

@implementation TelevisaoDAO

@synthesize tipoTvNomes;
@synthesize tipoTvValor;
@synthesize redeTvNomes;
@synthesize redeTvValor;
@synthesize mercadoTvNomes;
@synthesize mercadoTvValor;
@synthesize programaTvNomes;
@synthesize programaTvValor;
@synthesize webDataTv;
@synthesize webResponseDataTv;

@synthesize detalheNomeDoProgramaTv;
@synthesize detalheMneumonicoTv;
@synthesize detalheHoraInicioTv;
@synthesize detalheHoraFimTv;
@synthesize detalheSemanaTv;
@synthesize detalheCusto30Tv;
@synthesize detalheDataTabTv;


// ----- Declaração de Variáveis -----

NSString                        *subItemTipoTv;
NSString                        *subItemRedeTv;
NSString                        *subItemMercadoTv;
NSString                        *subItemProgramaTv;
NSString                        *subItemPracaProg;
NSString                        *subItemValueProg;
NSString                        *xmlRequestTv;      // XML de Request
NSString                        *currentElementTv;  // Elemento Corrente
NSURLResponse *__autoreleasing  *responseTv = nil;  // URL Response;
NSError       *__autoreleasing  *errorTv = nil;     // Variável de Erro
NSURL                           *urlTv;             // URL;
NSInteger                       indiceTv =0;
NSInteger                       indiceAE =0;
BOOL                            testeAE = NO;

// -----

// ----- RESPONSE CONNECTION E PARSE XML -----

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseDataTv  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseDataTv  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again. - %@", error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Fim do processo de carregamento da conexão");
}
// ----

-(void)performParseXML{
    
    NSLog(@"Received %d Bytes", [self.webResponseDataTv length]);
    xmlRequestTv = [[NSString alloc] initWithBytes:[self.webResponseDataTv mutableBytes] length:[self.webResponseDataTv length] encoding:NSASCIIStringEncoding];
    
    //now parsing the xml
    NSData      *myDataTv    = [xmlRequestTv dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSXMLParser *xmlParserTv = [[NSXMLParser alloc] initWithData:myDataTv];
    
    //setting delegate of XML parser to self
    xmlParserTv.delegate = self;
    
    // Run the parser
    @try{
        BOOL parsingResult = [xmlParserTv parse];
        NSLog(@"parsing result = %hhd",parsingResult);
    }
    @catch (NSException* exception)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Server Error" message:[exception reason] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    currentElementTv  = elementName;
    subItemTipoTv     = [attributeDict objectForKey:@"tv"];
    subItemRedeTv     = [attributeDict objectForKey:@"valor"];
    subItemMercadoTv  = [attributeDict objectForKey:@"siglaRede"];
    subItemPracaProg  = [attributeDict objectForKey:@"praca"];
    subItemValueProg  = [attributeDict objectForKey:@"value"];
}

// PARSE XML NAS TAGS ENCONTRADAS NO WEBSERVICE
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if ([currentElementTv isEqualToString:@"error"]) {
        NSLog(@"Erro: %@",string);
        [self erroTv:string];
    }
    
    if ([currentElementTv isEqualToString:@"tv"]) {
        
        if([subItemRedeTv isEqualToString:@"AES"]){
            if (testeAE == NO){
                [tipoTvValor    addObject:subItemRedeTv];
                [tipoTvNomes    addObject:@"A&E"];
                testeAE = YES;
                NSLog(@"Tipo: %@ - %@",subItemRedeTv,@"A&E");
            }
        }else{
            if(indiceTv == 0){
                tipoTvNomes       = NULL;
                tipoTvValor       = NULL;
                tipoTvNomes       = [[NSMutableArray alloc]initWithObjects:string,nil];
                tipoTvValor       = [[NSMutableArray alloc]initWithObjects:subItemRedeTv,nil];
                NSLog(@"Tipo: %@ - %@",subItemRedeTv,string);
            }
            else{
                [tipoTvValor    addObject:subItemRedeTv];
                [tipoTvNomes    addObject:string];
                NSLog(@"Tipo: %@ - %@",subItemRedeTv,string);
            }
            indiceTv = indiceTv + 1;
        }
    }
    
    if ([currentElementTv isEqualToString:@"mercado"]) {
        if(indiceTv == 0){
            mercadoTvNomes       = NULL;
            mercadoTvValor       = NULL;
            mercadoTvNomes       = [[NSMutableArray alloc]initWithObjects:string,nil];
            mercadoTvValor       = [[NSMutableArray alloc]initWithObjects:subItemRedeTv,nil];
            NSLog(@"Mercado: %@ - %@ - %@",subItemMercadoTv,subItemRedeTv,string);
        }
        else{
            [mercadoTvValor    addObject:subItemRedeTv];
            [mercadoTvNomes    addObject:string];
            NSLog(@"Mercado: %@ - %@ - %@",subItemMercadoTv,subItemRedeTv,string);
        }
        indiceTv = indiceTv + 1;
    }
    
    if ([currentElementTv isEqualToString:@"programa"]) {
        if(indiceTv == 0){
            programaTvNomes      = NULL;
            programaTvValor      = NULL;
            programaTvNomes      = [[NSMutableArray alloc]initWithObjects:string,nil];
            programaTvValor      = [[NSMutableArray alloc]initWithObjects:subItemValueProg,nil];
            NSLog(@"Programa: %@ - %@ - %@",subItemMercadoTv,subItemValueProg,string);
        }
        else{
            [programaTvValor    addObject:subItemValueProg];
            [programaTvNomes    addObject:string];
            NSLog(@"Programa: %@ - %@ - %@",subItemMercadoTv,subItemValueProg,string);
        }
        indiceTv = indiceTv + 1;
    }

  
    if ([currentElementTv isEqualToString:@"detalhePrograma"]) {
        detalheNomeDoProgramaTv     = NULL;
        detalheNomeDoProgramaTv     = string;
        NSLog(@"Detalhe Nome Progr.: %@",string);
        
    }
    if ([currentElementTv isEqualToString:@"detalheMnem"]) {
        detalheMneumonicoTv     = NULL;
        detalheMneumonicoTv     = string;
        NSLog(@"Detalhe Mneum.: %@",string);
    }
    if ([currentElementTv isEqualToString:@"detalheHoraIni"]) {
        
        detalheHoraInicioTv    = NULL;
        detalheHoraInicioTv     = string;
        NSLog(@"Detalhe Hora Início: %@",string);
        
    }
    if ([currentElementTv isEqualToString:@"detalheHoraFim"]) {
        detalheHoraFimTv     = NULL;
        detalheHoraFimTv     = string;
        NSLog(@"Detalhe Hora Fim: %@",string);
        
    }
    if ([currentElementTv isEqualToString:@"detalheSemana"]) {
        detalheSemanaTv     = NULL;
        detalheSemanaTv     = string;
        NSLog(@"Detalhe Semana: %@",string);
    }
    if ([currentElementTv isEqualToString:@"detalheCusto30"]) {
        detalheCusto30Tv     = NULL;
        detalheCusto30Tv     = string;
        NSLog(@"Detalhe Custo 30'': %@",string);
    }
    if ([currentElementTv isEqualToString:@"detalheDtTab"]) {
        detalheDataTabTv     = NULL;
        detalheDataTabTv     = string;
        NSLog(@"Detalhe Data da Tabela: %@",string);
    }

}


// REQUEST XML
-(BOOL)requestSOAPXMLTipoTv:(NSString*)numTipoTv{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestTv = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\
                    <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\
                    <soap12:Body>\
                    <TvTipoTvAbXFe xmlns=\"http://www.jovedata.com.br\">\
                    <tipo>%@</tipo>\
                    </TvTipoTvAbXFe>\
                    </soap12:Body>\
                    </soap12:Envelope>", numTipoTv];
    // -----
    
    // ----- REQUEST -----
    
    urlTv = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlTv];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestTv length]];
    
    [req addValue: @"text/xml; charset=ISO-8859-1" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"TvTipoTvAbXFe"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestTv dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSURLConnection *ConnectTv    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseTv error:errorTv];
    webResponseDataTv              = data;
    
    if( ConnectTv ) {
        webDataTv = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorTv);
    }
    // -----
    indiceTv = 0;
    return process;
}


// REQUEST XML
-(BOOL)requestSOAPXMLMercadoTv:(NSString*)numRedeTv{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestTv = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <TvMercado xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    </TvMercado>\
                    </soap:Body>\
                    </soap:Envelope>", numRedeTv];
    // -----
    
    // ----- REQUEST -----
    
    urlTv = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlTv];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestTv length]];
    
    [req addValue: @"text/xml; charset=ISO-8859-1" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"TvMercado"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestTv dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSURLConnection *ConnectTv    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseTv error:errorTv];
    webResponseDataTv              = data;
    
    if( ConnectTv ) {
        webDataTv = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorTv);
    }
    // -----
    indiceTv = 0;
    return process;
}


// REQUEST XML
-(BOOL)requestSOAPXMLProgramaTv:(NSString*)siglaRedeTv:(NSString *)valorProg{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestTv = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <TvPrograma xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    <siglaRede>%@</siglaRede>\
                    </TvPrograma>\
                    </soap:Body>\
                    </soap:Envelope>",valorProg,siglaRedeTv];
    // -----
    
    // ----- REQUEST -----
    
    urlTv = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlTv];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestTv length]];
    
    [req addValue: @"text/xml; charset=ISO-8859-1" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"TvPrograma"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestTv dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSURLConnection *ConnectTv    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseTv error:errorTv];
    webResponseDataTv              = data;
    
    if( ConnectTv ) {
        webDataTv = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorTv);
    }
    // -----
    indiceTv = 0;
    return process;
}



// REQUEST XML
-(BOOL)requestSOAPXMLDetalheTv:(NSString*)numProgTv:(NSString*)pracaTv:(NSString *)siglaRede{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestTv = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <DetalhesTv xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    <praca>%@</praca>\
                    <siglaRede>%@</siglaRede>\
                    </DetalhesTv>\
                    </soap:Body>\
                    </soap:Envelope>", numProgTv,pracaTv,siglaRede];
    // -----
    
    // ----- REQUEST -----
    
    urlTv = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlTv];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestTv length]];
    
    [req addValue: @"text/xml; charset=ISO-8859-1" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"TvMercado"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestTv dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSURLConnection *ConnectTv    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseTv error:errorTv];
    webResponseDataTv              = data;
    
    if( ConnectTv ) {
        webDataTv = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorTv);
    }
    // -----
    indiceTv = 0;
    return process;
}



-(void)erroTv:(NSString *)mensagem{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message: mensagem delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end









