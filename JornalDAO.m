//
//  JornalDAO.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 03/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "JornalDAO.h"
#import "JornalViewController.h"

@implementation JornalDAO

@synthesize webDataJr;
@synthesize webResponseDataJr;
@synthesize estadoListaNomesJr;
@synthesize corListaNomesJr;
@synthesize cidadeListaNomesJr;
@synthesize retrancaListaNomesJr;
@synthesize jornaisListaNomesJr;
@synthesize posicaoListaNomesJr;

@synthesize estadoListaParametroJr;
@synthesize cidadeListaParametroJr;
@synthesize corListaParametroJr;
@synthesize retrancaListaParametroJr;
@synthesize posicaoListaParametroJr;
@synthesize jornaisListaParametroJr;

@synthesize detalheNomeCidadeJr;
@synthesize detalheMnemJr;
@synthesize detalheNomeJornalJr;
@synthesize detalheNomeRepresJr;
@synthesize detalhePosJr;
@synthesize detalheNomeRetrancaJr;
@synthesize detalheCorJr;
@synthesize detalhePrecoDomJr;
@synthesize detalhePrecoSegJr;
@synthesize detalhePrecoTerJr;
@synthesize detalhePrecoQuaJr;
@synthesize detalhePrecoQuiJr;
@synthesize detalhePrecoSexJr;
@synthesize detalhePrecoSabJr;
@synthesize detalheDataTabJr;



// ----- Declaração de Variáveis ------
NSString                        *subItemJr;
NSString                        *subItemProgJr;
NSString                        *subItemMnemJr;
NSString                        *subItemRetJr;
NSString                        *subItemPosJr;
NSString                        *subItemCodRetJr;
NSString                        *xmlRequestJr;      // XML de Request
NSString                        *currentElementJr;  // Elemento Corrente
NSURLResponse *__autoreleasing  *responseJr = nil;  // URL Response;
NSError       *__autoreleasing  *errorJr = nil;     // Variável de Erro
NSURL                           *urlJr;             // URL;
NSInteger                       indiceJr =0;
// -----


// ----- RESPONSE CONNECTION E PARSE XML -----

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseDataJr  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseDataJr  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again. - %@", error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Fim do processo de carregamento da conexão");
}
// ----


-(void)performParseXML{    
    NSLog(@"Received %d Bytes", [self.webResponseDataJr length]);
    xmlRequestJr = [[NSString alloc] initWithBytes:[self.webResponseDataJr mutableBytes] length:[self.webResponseDataJr length] encoding:NSUTF8StringEncoding];
    
    //now parsing the xml
    NSData      *myData    = [xmlRequestJr dataUsingEncoding:NSUTF8StringEncoding];
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

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentElementJr    = elementName;
    subItemJr           = [attributeDict objectForKey:@"value"];
    subItemMnemJr       = [attributeDict objectForKey:@"codMnem"];
    subItemRetJr        = [attributeDict objectForKey:@"codRet"];
    subItemPosJr        = [attributeDict objectForKey:@"codPosicao"];
    subItemCodRetJr     = [attributeDict objectForKey:@"codRetranca"];
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if ([currentElementJr isEqualToString:@"error"]) {
        NSLog(@"Erro: %@",string);
        [self erroJr:string];
    }
    
    if ([currentElementJr isEqualToString:@"cidade"]) {
        if(indiceJr == 0){
            cidadeListaParametroJr    = NULL;
            cidadeListaNomesJr        = NULL;
            cidadeListaParametroJr    = [[NSMutableArray alloc]initWithObjects:subItemJr,nil];
            cidadeListaNomesJr        = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Cidade: %@ - %@",subItemJr,string);
        }
        else{
            [cidadeListaParametroJr    addObject:subItemJr];
            [cidadeListaNomesJr        addObject:string];
            NSLog(@"Cidade: %@ - %@",subItemJr,string);
        }
        indiceJr = indiceJr + 1;
    }
    
    if ([currentElementJr isEqualToString:@"jornal"]) {
        if(indiceJr == 0){
            jornaisListaParametroJr   = NULL;
            jornaisListaNomesJr       = NULL;
            jornaisListaParametroJr   = [[NSMutableArray alloc]initWithObjects:subItemJr,nil];
            jornaisListaNomesJr       = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Jornal: %@ - %@",subItemJr,string);
        }
        else{
            [jornaisListaParametroJr   addObject:subItemJr];
            [jornaisListaNomesJr       addObject:string];
            NSLog(@"Jornal: %@ - %@",subItemJr,string);
        }
        indiceJr = indiceJr + 1;
    }
    
    if ([currentElementJr isEqualToString:@"posicao"]) {
        if(indiceJr == 0){
            posicaoListaParametroJr  = NULL;
            posicaoListaNomesJr      = NULL;
            
            posicaoListaParametroJr  = [[NSMutableArray alloc]initWithObjects:subItemJr,nil];
            posicaoListaNomesJr      = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Posição: %@ - %@ - %@",subItemJr,subItemMnemJr,string);
        }
        else{
            [posicaoListaParametroJr   addObject:subItemJr];
            [posicaoListaNomesJr       addObject:string];
            NSLog(@"Posição: %@ - %@ - %@",subItemJr,subItemMnemJr,string);
        }
        indiceJr = indiceJr + 1;
    }
    
    if ([currentElementJr isEqualToString:@"retranca"]) {
        if(indiceJr == 0){
            retrancaListaParametroJr  = NULL;
            retrancaListaNomesJr      = NULL;
            
            retrancaListaParametroJr  = [[NSMutableArray alloc]initWithObjects:subItemJr,nil];
            retrancaListaNomesJr      = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Retranca: %@ - %@ - %@",subItemJr,subItemRetJr,string);
        }
        else{
            [retrancaListaParametroJr   addObject:subItemJr];
            [retrancaListaNomesJr       addObject:string];
            NSLog(@"Retranca: %@ - %@ - %@",subItemJr,subItemRetJr,string);
        }
        indiceJr = indiceJr + 1;
    }
 
    if ([currentElementJr isEqualToString:@"cor"]) {
        if(indiceJr == 0){
            corListaParametroJr  = NULL;
            corListaNomesJr      = NULL;
            
            corListaParametroJr  = [[NSMutableArray alloc]initWithObjects:subItemCodRetJr,nil];
            corListaNomesJr      = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Cor: %@ - %@ - %@",subItemPosJr,subItemCodRetJr,string);
        }
        else{
            [corListaParametroJr   addObject:subItemCodRetJr];
            [corListaNomesJr       addObject:string];
            NSLog(@"Cor: %@ - %@ - %@",subItemPosJr,subItemCodRetJr,string);
        }
        indiceJr = indiceJr + 1;
    }
 
    if ([currentElementJr isEqualToString:@"detalheEstCid"]) {
        detalheNomeCidadeJr   = NULL;
        detalheNomeCidadeJr   = string;
        NSLog(@"Detalhe Nome do Programa: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"detalheMnem"]) {
        detalheMnemJr        = NULL;
        detalheMnemJr        = string;
        NSLog(@"Detalhe Mneumônico: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"detalheNomeJor"]) {
        detalheNomeJornalJr  = NULL;
        detalheNomeJornalJr  = string;
        NSLog(@"Detalhe nome do jornal: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"detalheRepres"]) {
        detalheNomeRepresJr     = NULL;
        detalheNomeRepresJr     = string;
        NSLog(@"Detalhe nome do representante: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"detalhePos"]) {
        detalhePosJr      = NULL;
        detalhePosJr      = string;
        NSLog(@"Detalhe posição: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"detalheRet"]) {
        detalheNomeRetrancaJr     = NULL;
        detalheNomeRetrancaJr     = string;
        NSLog(@"Detalhe retranca: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"detalheCor"]) {
        detalheCorJr  = NULL;
        detalheCorJr  = string;
        NSLog(@"Detalhe cor: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"precoDom"]) {
        detalhePrecoDomJr     = NULL;
        detalhePrecoDomJr     = string;
        NSLog(@"Detalhe preço DOM: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"precoSeg"]) {
        detalhePrecoSegJr     = NULL;
        detalhePrecoSegJr     = string;
        NSLog(@"Detalhe preço SEG: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"precoTer"]) {
        detalhePrecoTerJr     = NULL;
        detalhePrecoTerJr     = string;
        NSLog(@"Detalhe preço TER: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"precoQua"]) {
        detalhePrecoQuaJr     = NULL;
        detalhePrecoQuaJr     = string;
        NSLog(@"Detalhe preço QUA: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"precoQui"]) {
        detalhePrecoQuiJr     = NULL;
        detalhePrecoQuiJr     = string;
        NSLog(@"Detalhe preço QUI: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"precoSex"]) {
        detalhePrecoSexJr     = NULL;
        detalhePrecoSexJr     = string;
        NSLog(@"Detalhe preço SEX: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"precoSab"]) {
        detalhePrecoSabJr     = NULL;
        detalhePrecoSabJr     = string;
        NSLog(@"Detalhe preço SAB: %@",string);
    }
    
    if ([currentElementJr isEqualToString:@"detalheDtTab"]) {
        detalheDataTabJr      = NULL;
        detalheDataTabJr      = string;
        NSLog(@"Detalhe Data da Tabela: %@",string);
    }
}


-(BOOL)requestSOAPXMLCidadeJr:(NSString*)siglaUFJr{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestJr = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <JorCidade xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    </JorCidade>\
                    </soap:Body>\
                    </soap:Envelope>",siglaUFJr];
    
    // -----
    
    // ----- REQUEST -----
    
    urlJr = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlJr];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestJr length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"JorCidade"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestJr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseJr error:errorJr];
    webResponseDataJr = data;
    
    if( ConnectCin ) {
        webDataJr = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorJr);
    }
    // -----
    indiceJr = 0;
    return process;
    
}

-(BOOL)requestSOAPXMLJornalJr:(NSString*)nomeCidadeJr{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestJr = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <JorJornais xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    </JorJornais>\
                    </soap:Body>\
                    </soap:Envelope>",nomeCidadeJr];
    
    // -----
    
    // ----- REQUEST -----
    
    urlJr = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlJr];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestJr length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"JorJornais"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestJr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseJr error:errorJr];
    webResponseDataJr = data;
    
    if( ConnectCin ) {
        webDataJr = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorJr);
    }
    // -----
    indiceJr = 0;
    return process;
    
}

-(BOOL)requestSOAPXMLPosicaoJr:(NSString*)mnemJr{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestJr = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <JorPosicao xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    </JorPosicao>\
                    </soap:Body>\
                    </soap:Envelope>",mnemJr];
    
    // -----
    
    // ----- REQUEST -----
    
    urlJr = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlJr];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestJr length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"JorPosicao"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestJr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseJr error:errorJr];
    webResponseDataJr = data;
    
    if( ConnectCin ) {
        webDataJr = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorJr);
    }
    // -----
    indiceJr = 0;
    return process;
    
}

-(BOOL)requestSOAPXMLRetrancaJr:(NSString*)mnemJr:(NSString *)numPosicaoJr{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestJr = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <JorRetranca xmlns=\"http://www.jovedata.com.br\">\
                    <mnem>%@</mnem>\
                    <valor>%@</valor>\
                    </JorRetranca>\
                    </soap:Body>\
                    </soap:Envelope>",mnemJr,numPosicaoJr];
    
    // -----
    
    // ----- REQUEST -----
    
    urlJr = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlJr];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestJr length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"JorRetranca"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestJr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseJr error:errorJr];
    webResponseDataJr = data;
    
    if( ConnectCin ) {
        webDataJr = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorJr);
    }
    // -----
    indiceJr = 0;
    return process;
    
}

-(BOOL)requestSOAPXMLCorJr:(NSString*)mnemJr:(NSString *)valorRetrancaJr{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestJr = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <JorCor xmlns=\"http://www.jovedata.com.br\">\
                    <mnem>%@</mnem>\
                    <valor>%@</valor>\
                    </JorCor>\
                    </soap:Body>\
                    </soap:Envelope>",mnemJr,valorRetrancaJr];
    
    // -----
    
    // ----- REQUEST -----
    
    urlJr = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlJr];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestJr length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"JorCor"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestJr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseJr error:errorJr];
    webResponseDataJr = data;
    
    if( ConnectCin ) {
        webDataJr = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorJr);
    }
    // -----
    indiceJr = 0;
    return process;
    
}

-(BOOL)requestSOAPXMLDetalheJr:(NSString*)mnemJr:(NSString *)numPosicaoJr:(NSString *)valorRetrancaJr{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestJr = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <DetalhesJornal xmlns=\"http://www.jovedata.com.br\">\
                    <mnem>%@</mnem>\
                    <posicao>%@</posicao>\
                    <retranca>%@</retranca>\
                    </DetalhesJornal>\
                    </soap:Body>\
                    </soap:Envelope>",mnemJr,numPosicaoJr,valorRetrancaJr];
    
    // -----
    
    // ----- REQUEST -----
    
    urlJr = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlJr];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestJr length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"DetalhesJornal"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestJr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseJr error:errorJr];
    webResponseDataJr = data;
    
    if( ConnectCin ) {
        webDataJr = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorJr);
    }
    // -----
    indiceJr = 0;
    return process;
}


-(void)erroJr:(NSString *)mensagemRd{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message: mensagemRd delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end
