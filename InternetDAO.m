//
//  InternetDAO.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 23/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "InternetDAO.h"
#import "InternetViewController.h"

@implementation InternetDAO

@synthesize webDataInt;
@synthesize webResponseDataInt;
@synthesize portalListaInt;
@synthesize siteListaInt;
@synthesize anuncioListaInt;
@synthesize vendaListaInt;
@synthesize portalListaValores;
@synthesize siteListaValores;
@synthesize anuncioListaValores;
@synthesize vendaListaValores;
@synthesize detalheCustoAlturaFC;
@synthesize detalheCustoLarguraFC;
@synthesize detalheCustoAlturaAB;
@synthesize detalheCustoLarguraAB;
@synthesize detalheCustoTotal;
@synthesize detalheDataTabelaInt;

// ----- Declaração de Variáveis ------
NSString         *xmlRequestInt;      // XML de Request
NSURL            *urlInt;
NSURLResponse *__autoreleasing  *responseInt = nil;  // URL Response;
NSError       *__autoreleasing  *errorInt    = nil;   // Variável de Erro
NSInteger                       indiceInt =0;
NSString                        *currentElementInt;  // Elemento Corrente
NSString                        *subItemInt;
NSString                        *subItemSite;
NSString                        *subItemAnunc;
NSString                        *subItemVenda;
NSString                        *subItemVendaValor;

// ----- RESPONSE CONNECTION E PARSE XML -----
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseDataInt  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseDataInt  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again. - %@", error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Fim do processo de carregamento da conexão");
}
// ----


-(void)performParseXML{
    
    NSLog(@"Received %d Bytes", [self.webResponseDataInt length]);
    xmlRequestInt = [[NSString alloc] initWithBytes:[self.webResponseDataInt mutableBytes] length:[self.webResponseDataInt length] encoding:NSUTF8StringEncoding];
    
    //now parsing the xml
    NSData      *myData    = [xmlRequestInt dataUsingEncoding:NSUTF8StringEncoding];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:myData];
    
    //setting delegate of XML parser to self
    xmlParser.delegate = self;
    
    // Run the parser
    @try{
        BOOL parsingResult = [xmlParser parse];
        NSLog(@"parsing result = %hhd",parsingResult);
    }
    @catch (NSException* exception){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Server Error" message:[exception reason] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
}


//Implement the NSXmlParserDelegate methods

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    currentElementInt = elementName;
    subItemInt        = [attributeDict objectForKey:@"value"];
    subItemSite       = [attributeDict objectForKey:@"codPortal"];
    subItemAnunc      = [attributeDict objectForKey:@"codSite"];
    subItemVenda      = [attributeDict objectForKey:@"codAnu"];
    subItemVendaValor = [attributeDict objectForKey:@"valor"];
    //NSLog(@"Teste Chegada: " @"%@ %@ %@ %@ %@ ",currentElementInt,subItemInt, subItemSite, subItemAnunc, subItemVenda);
}

// PARSE XML NAS TAGS ENCONTRADAS NO WEBSERVICE
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if ([currentElementInt isEqualToString:@"error"]) {
        NSLog(@"Erro: %@",string);
        [self erroInt:string];
    }
    
    if ([currentElementInt isEqualToString:@"portal"]) {
        if(indiceInt == 0){
            portalListaInt       = NULL;
            portalListaValores   = NULL;
            portalListaValores   = [[NSMutableArray alloc]initWithObjects:subItemInt,nil];
            portalListaInt       = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Portal: %@ - %@",subItemInt,string);
        }
        else{
            [portalListaValores       addObject:subItemInt];
            [portalListaInt           addObject:string];
            NSLog(@"Portal: %@ - %@",subItemInt,string);
        }
        indiceInt = indiceInt + 1;
    }
    
    if ([currentElementInt isEqualToString:@"site"]) {
        if(indiceInt == 0){
            siteListaInt       = NULL;
            siteListaValores   = NULL;
            siteListaValores   = [[NSMutableArray alloc]initWithObjects:subItemInt,nil];
            siteListaInt       = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Site: %@ - %@",subItemInt,string);
        }
        else{
            [siteListaValores       addObject:subItemInt];
            [siteListaInt           addObject:string];
            NSLog(@"Site: %@ - %@",subItemInt,string);
        }
        indiceInt = indiceInt + 1;
    }
    
    if ([currentElementInt isEqualToString:@"anuncio"]) {
        if(indiceInt == 0){
            anuncioListaInt       = NULL;
            anuncioListaValores   = NULL;
            anuncioListaValores   = [[NSMutableArray alloc]initWithObjects:subItemInt,nil];
            anuncioListaInt       = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Anuncio: %@ - %@ - %@ - %@",subItemAnunc,subItemSite,subItemInt,string);
        }
        else{
            [anuncioListaValores       addObject:subItemInt];
            [anuncioListaInt           addObject:string];
            NSLog(@"Anuncio: %@ - %@ - %@ - %@",subItemAnunc,subItemSite,subItemInt,string);
        }
        indiceInt = indiceInt + 1;
    }
    
    if ([currentElementInt isEqualToString:@"venda"]) {
        if(indiceInt == 0){
            vendaListaInt       = NULL;
            vendaListaValores   = NULL;
            vendaListaValores   = [[NSMutableArray alloc]initWithObjects:subItemVendaValor,nil];
            vendaListaInt       = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Venda: %@ - %@ - %@ - %@ - %@",subItemAnunc,subItemSite,subItemVenda,subItemVendaValor,string);
        }
        else{
            [vendaListaValores       addObject:subItemVendaValor];
            [vendaListaInt           addObject:string];
            NSLog(@"Venda: %@ - %@ - %@ - %@ - %@",subItemAnunc,subItemSite,subItemVenda,subItemVendaValor,string);
        }
        indiceInt = indiceInt + 1;
    }
    if ([currentElementInt isEqualToString:@"detalhelLargXfechado"]) {
        detalheCustoLarguraFC   = NULL;
        detalheCustoLarguraFC   = string;
        NSLog(@"Detalhe Largura Fechada: %@",string);
    }
    if ([currentElementInt isEqualToString:@"detalhelAltXfechado"]) {
        detalheCustoAlturaFC   = NULL;
        detalheCustoAlturaFC   = string;
        NSLog(@"Detalhe Altura Fechada: %@",string);
    }
    if ([currentElementInt isEqualToString:@"detalhelLargXAberto"]) {
        detalheCustoLarguraAB  = NULL;
        detalheCustoLarguraAB  = string;
        NSLog(@"Detalhe Largura Aberta: %@",string);
    }
    if ([currentElementInt isEqualToString:@"detalhelAltXaberto"]) {
        detalheCustoAlturaAB  = NULL;
        detalheCustoAlturaAB  = string;
        NSLog(@"Detalhe Altura Aberta: %@",string);
    }
    if ([currentElementInt isEqualToString:@"detalheCusto"]) {
        detalheCustoTotal  = NULL;
        detalheCustoTotal  = string;
        NSLog(@"Detalhe Custo Total: %@",string);
    }
    if ([currentElementInt isEqualToString:@"detalheDtTab"]) {
        detalheDataTabelaInt  = NULL;
        detalheDataTabelaInt  = string;
        NSLog(@"Detalhe Data da Tabela: %@",string);
    }
}


-(BOOL)requestSOAPXMLPortal{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestInt = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                     <soap:Body>\
                     <IntPortal xmlns=\"http://www.jovedata.com.br\"/>\
                     </soap:Body>\
                     </soap:Envelope>"];
    
    // -----
    
    // ----- REQUEST -----
    
    urlInt = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlInt];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestInt length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"IntPortal"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestInt dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectInt    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseInt error:errorInt];
    webResponseDataInt = data;
    
    if( ConnectInt ) {
        webDataInt = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorInt);
    }
    // -----
    indiceInt = 0;
    return process;
}

-(BOOL)requestSOAPXMLSite:numPortalSite{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestInt = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                     <soap:Body>\
                     <IntSite xmlns=\"http://www.jovedata.com.br\">\
                     <valor>%@</valor>\
                     </IntSite>\
                     </soap:Body>\
                     </soap:Envelope>", numPortalSite];
    
    // -----
    
    // ----- REQUEST -----
    
    urlInt = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlInt];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestInt length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"IntSite"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestInt dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectInt    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseInt error:errorInt];
    webResponseDataInt = data;
    
    if( ConnectInt ) {
        webDataInt = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorInt);
    }
    // -----
    indiceInt = 0;
    return process;
}

-(BOOL)requestSOAPXMLAnuncio:(NSString *)codSite:(NSString *)codPortal{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestInt = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                     <soap:Body>\
                     <IntAnuncio xmlns=\"http://www.jovedata.com.br\">\
                     <valor>%@</valor>\
                     <portal>%@</portal>\
                     </IntAnuncio>\
                     </soap:Body>\
                     </soap:Envelope>",codSite,codPortal];
    
    // -----
    
    // ----- REQUEST -----
    
    urlInt = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlInt];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestInt length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"IntAnuncio"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestInt dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectInt    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseInt error:errorInt];
    webResponseDataInt = data;
    
    if( ConnectInt ) {
        webDataInt = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorInt);
    }
    // -----
    indiceInt = 0;
    return process;
}

-(BOOL)requestSOAPXMLVenda:(NSString *)numAnuncio:(NSString *)numPortal:(NSString *)numSite{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestInt = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                     <soap:Body>\
                     <IntVenda xmlns=\"http://www.jovedata.com.br\">\
                     <valor>%@</valor>\
                     <portal>%@</portal>\
                     <site>%@</site>\
                     </IntVenda>\
                     </soap:Body>\
                     </soap:Envelope>",numAnuncio,numPortal,numSite];
    
    // -----
    
    // ----- REQUEST -----
    
    urlInt = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlInt];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestInt length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"IntVenda"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestInt dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectInt    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseInt error:errorInt];
    webResponseDataInt = data;
    
    if( ConnectInt ) {
        webDataInt = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorInt);
    }
    // -----
    indiceInt = 0;
    return process;
}

-(BOOL)requestSOAPXMLDetInt:(NSString *)codVenda:(NSString *)codPortal:(NSString *)codSite:(NSString *)codAnuncio{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestInt = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\
                     <soap12:Body>\
                     <DetalhesInternet xmlns=\"http://www.jovedata.com.br\">\
                     <valor>%@</valor>\
                     <portal>%@</portal>\
                     <site>%@</site>\
                     <anuncio>%@</anuncio>\
                     </DetalhesInternet>\
                     </soap12:Body>\
                     </soap12:Envelope>",codVenda,codPortal,codSite,codAnuncio];
    
    // -----
    
    // ----- REQUEST -----
    
    urlInt = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlInt];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestInt length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"DetalhesInternet"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestInt dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectInt    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseInt error:errorInt];
    webResponseDataInt = data;
    
    if( ConnectInt ) {
        webDataInt = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorInt);
    }
    // -----
    indiceInt = 0;
    return process;
}


-(void)erroInt:(NSString *)mensagem{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message: mensagem delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end
