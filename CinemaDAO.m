//
//  CinemaDAO.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 13/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "CinemaDAO.h"
#import "CinemaViewController.h"

@implementation CinemaDAO

@synthesize webDataCin;
@synthesize webResponseDataCin;
@synthesize cidadesListaCin;
@synthesize siglasListaCin;
@synthesize salasNomesCin;
@synthesize salasValorCin;
@synthesize programaNomes;
@synthesize programaValor;
@synthesize detalheNomeReprCin;
@synthesize detalheNomeExibCin;
@synthesize detalheSemanaCin;
@synthesize detalheCusto30Cin;
@synthesize detalheDataTabCin;

// ----- Declaração de Variáveis ------
NSString                        *subItem;
NSString                        *subItemProg;
NSString                        *xmlRequestCin;      // XML de Request
NSString                        *currentElementCin;  // Elemento Corrente
NSURLResponse *__autoreleasing  *responseCin = nil;  // URL Response;
NSError       *__autoreleasing  *errorCin = nil;     // Variável de Erro
NSURL                           *urlCin;             // URL;
NSInteger                       indice =0;

// -----


// ----- RESPONSE CONNECTION E PARSE XML -----

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseDataCin  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseDataCin  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again. - %@", error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Fim do processo de carregamento da conexão");
}

// ----


-(void)performParseXML{

    NSLog(@"Received %d Bytes", [self.webResponseDataCin length]);
    xmlRequestCin = [[NSString alloc] initWithBytes:[self.webResponseDataCin mutableBytes] length:[self.webResponseDataCin length] encoding:NSUTF8StringEncoding];
    
    //now parsing the xml
    NSData      *myData    = [xmlRequestCin dataUsingEncoding:NSUTF8StringEncoding];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:myData];
    
    //setting delegate of XML parser to self
    xmlParser.delegate = self;
    
    // Run the parser
    @try{
        BOOL parsingResult = [xmlParser parse];
        NSLog(@"parsing result = %hhd",parsingResult);
    }
    @catch (NSException* exception)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Server Error" message:[exception reason] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
}


//Implement the NSXmlParserDelegate methods

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentElementCin = elementName;
    subItem           = [attributeDict objectForKey:@"value"];
    subItemProg       = [attributeDict objectForKey:@"codSala"];
}

// PARSE XML NAS TAGS ENCONTRADAS NO WEBSERVICE
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if ([currentElementCin isEqualToString:@"error"]) {
        NSLog(@"Erro: %@",string);
        [self erroCin:string];
    }
    
    if ([currentElementCin isEqualToString:@"cidade"]) {
        if(indice == 0){
           siglasListaCin    = NULL;
           cidadesListaCin   = NULL;
           siglasListaCin    = [[NSMutableArray alloc]initWithObjects:subItem,nil];
           cidadesListaCin   = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Cidade: %@ - %@",subItem,string);
        }
        else{
            [siglasListaCin    addObject:subItem];
            [cidadesListaCin   addObject:string];
            NSLog(@"Cidade: %@ - %@",subItem,string);
        }
        indice = indice + 1;
    }

    if ([currentElementCin isEqualToString:@"sala"]) {
        if(indice == 0){
            salasValorCin     = NULL;
            salasNomesCin     = NULL;
            salasValorCin     = [[NSMutableArray alloc]initWithObjects:subItem,nil];
            salasNomesCin     = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Sala: %@ - %@",subItem,string);
        }
        else{
            [salasValorCin   addObject:subItem];
            [salasNomesCin   addObject:string];
            NSLog(@"Sala: %@ - %@",subItem,string);
        }
        indice = indice + 1;
    }
    
    if ([currentElementCin isEqualToString:@"programa"]) {
        if(indice == 0){
            programaValor     = NULL;
            programaNomes     = NULL;
            salasValorCin     = NULL;
            programaValor     = [[NSMutableArray alloc]initWithObjects:subItem,nil];
            programaNomes     = [[NSMutableArray alloc]initWithObjects:string,nil];
            salasValorCin     = [[NSMutableArray alloc]initWithObjects:subItemProg,nil];
            NSLog(@"Programa: %@ - %@ - %@",subItemProg,subItem,string);
        }
        else{
            [programaValor   addObject:subItem];
            [programaNomes   addObject:string];
            [salasValorCin   addObject:subItemProg];
            NSLog(@"Programa: %@ - %@ - %@",subItemProg,subItem,string);
        }
        indice = indice + 1;
    }

    if ([currentElementCin isEqualToString:@"detalheNomeExib"]) {
        detalheNomeExibCin     = NULL;
        detalheNomeExibCin     = string;
        NSLog(@"Detalhe Nome Exib.: %@",string);
        
    }
    if ([currentElementCin isEqualToString:@"detalheNomeRepres"]) {
        detalheNomeReprCin     = NULL;
        detalheNomeReprCin     = string;
        NSLog(@"Detalhe Nome Repr.: %@",string);
    }
    if ([currentElementCin isEqualToString:@"detalheSemana"]) {
        
        detalheSemanaCin     = NULL;
        detalheSemanaCin     = string;
        NSLog(@"Detalhe Semana: %@",string);
        
    }
    if ([currentElementCin isEqualToString:@"detalheCusto30"]) {
        detalheCusto30Cin     = NULL;
        detalheCusto30Cin     = string;
        NSLog(@"Detalhe Custo 30'': %@",string);
        
    }
    if ([currentElementCin isEqualToString:@"detalheDtTab"]) {
        detalheDataTabCin     = NULL;
        detalheDataTabCin     = string;
        NSLog(@"Detalhe Data da Tabela: %@",string);
    }
}

// REQUEST XML SALA
-(BOOL)requestSOAPXMLSala:(NSString*)siglaCidade{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestCin = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                     <soap:Body>\
                     <CinSala xmlns=\"http://www.jovedata.com.br\">\
                     <valor>%@</valor>\
                     </CinSala>\
                     </soap:Body>\
                     </soap:Envelope>",siglaCidade];
    
    // -----
    
    // ----- REQUEST -----
    
    urlCin = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlCin];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestCin length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"CinSala"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestCin dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseCin error:errorCin];
    webResponseDataCin = data;
    
    if( ConnectCin ) {
        webDataCin = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorCin);
    }
    // -----
    indice = 0;
    return process;
}

// REQUEST XML CIDADES ***
-(BOOL)requestSOAPXMLCin:(NSString*)siglaUFCin{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
        xmlRequestCin = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                  <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                  <soap:Body>\
                  <CinCidade xmlns=\"http://www.jovedata.com.br\">\
                  <valor>%@</valor>\
                  </CinCidade>\
                  </soap:Body>\
                  </soap:Envelope>",siglaUFCin];
    
    // -----
    
    // ----- REQUEST -----
    
    urlCin = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlCin];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestCin length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"CinCidade"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestCin dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseCin error:errorCin];
    webResponseDataCin = data;
    
    if( ConnectCin ) {
        webDataCin = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorCin);
    }
    // -----
    indice = 0;
    return process;
}


// REQUEST PROGRAMA ***
-(BOOL)requestSOAPXMLProg:(NSString*)numSala{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestCin = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                     <soap:Body>\
                     <CinPrograma xmlns=\"http://www.jovedata.com.br\">\
                     <valor>%@</valor>\
                     </CinPrograma>\
                     </soap:Body>\
                     </soap:Envelope>",numSala];
    
    // -----
    
    // ----- REQUEST -----
    
    urlCin = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlCin];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestCin length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"CinPrograma"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestCin dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseCin error:errorCin];
    webResponseDataCin = data;
    
    if( ConnectCin ) {
        webDataCin = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorCin);
    }
    // -----
    indice = 0;
    return process;
}


// REQUEST DETALHE ***
-(BOOL)requestSOAPXMLDetCin:(NSString*)numSalaDet:(NSString *)numProgrDet{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestCin = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                     <soap:Body>\
                     <DetalhesCinema xmlns=\"http://www.jovedata.com.br\">\
                     <sala>%@</sala>\
                     <valor>%@</valor>\
                     </DetalhesCinema>\
                     </soap:Body>\
                     </soap:Envelope>",numSalaDet,numProgrDet];
    
    // -----
    
    // ----- REQUEST -----
    
    urlCin = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlCin];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestCin length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"CinPrograma"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestCin dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseCin error:errorCin];
    webResponseDataCin = data;
    
    if( ConnectCin ) {
        webDataCin = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorCin);
    }
    // -----
    indice = 0;
    return process;
}


-(void)erroCin:(NSString *)mensagem{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message: mensagem delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end
