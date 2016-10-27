//
//  RadioDAO.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 31/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "RadioDAO.h"
#import "RadioViewController.h"

@implementation RadioDAO

@synthesize webResponseDataRd;
@synthesize webDataRd;

@synthesize estadoListaParametroRd;
@synthesize cidadeListaParametroRd;
@synthesize radiosListaParametroRd;
@synthesize programasListaParametroRd;

@synthesize estadoListaNomesRd;
@synthesize cidadeListaNomesRd;
@synthesize radiosListaNomesRd;
@synthesize programasListaNomesRd;

@synthesize detalheNomeProgramaRd;
@synthesize detalheMneumonicoRd;
@synthesize detalheHoraIniRd;
@synthesize detalheHoraFimRd;
@synthesize detalheSemanaRd;
@synthesize detalheCusto30Rd;
@synthesize detalheDataTabelaRd;

// ----- Declaração de Variáveis ------
NSString                        *subItemRd;
NSString                        *subItemProgRd;
NSString                        *xmlRequestRd;      // XML de Request
NSString                        *currentElementRd;  // Elemento Corrente
NSURLResponse *__autoreleasing  *responseRd = nil;  // URL Response;
NSError       *__autoreleasing  *errorRd = nil;     // Variável de Erro
NSURL                           *urlRd;             // URL;
NSInteger                       indiceRd =0;
// -----

// ----- RESPONSE CONNECTION E PARSE XML -----

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseDataRd  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseDataRd  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again. - %@", error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Fim do processo de carregamento da conexão");
}

// ----

-(void)performParseXML{
    
    NSLog(@"Received %d Bytes", [self.webResponseDataRd length]);
    xmlRequestRd = [[NSString alloc] initWithBytes:[self.webResponseDataRd mutableBytes] length:[self.webResponseDataRd length] encoding:NSUTF8StringEncoding];
    
    //now parsing the xml
    NSData      *myData    = [xmlRequestRd dataUsingEncoding:NSUTF8StringEncoding];
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
    currentElementRd    = elementName;
    subItemRd           = [attributeDict objectForKey:@"value"];
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if ([currentElementRd isEqualToString:@"error"]) {
        NSLog(@"Erro: %@",string);
        [self erroRd:string];
    }
    
    if ([currentElementRd isEqualToString:@"cidade"]) {
        if(indiceRd == 0){
            cidadeListaParametroRd    = NULL;
            cidadeListaNomesRd        = NULL;
            cidadeListaParametroRd    = [[NSMutableArray alloc]initWithObjects:subItemRd,nil];
            cidadeListaNomesRd        = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Cidade: %@ - %@",subItemRd,string);
        }
        else{
            [cidadeListaParametroRd    addObject:subItemRd];
            [cidadeListaNomesRd        addObject:string];
            NSLog(@"Cidade: %@ - %@",subItemRd,string);
        }
        indiceRd = indiceRd + 1;
    }
    
    if ([currentElementRd isEqualToString:@"radio"]) {
        if(indiceRd == 0){
            radiosListaParametroRd   = NULL;
            radiosListaNomesRd       = NULL;
            radiosListaParametroRd   = [[NSMutableArray alloc]initWithObjects:subItemRd,nil];
            radiosListaNomesRd       = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Rádio: %@ - %@",subItemRd,string);
        }
        else{
            [radiosListaParametroRd   addObject:subItemRd];
            [radiosListaNomesRd       addObject:string];
            NSLog(@"Rádio: %@ - %@",subItemRd,string);
        }
        indiceRd = indiceRd + 1;
    }
    
    if ([currentElementRd isEqualToString:@"programa"]) {
        if(indiceRd == 0){
            programasListaParametroRd  = NULL;
            programasListaNomesRd      = NULL;

            programasListaParametroRd  = [[NSMutableArray alloc]initWithObjects:subItemRd,nil];
            programasListaNomesRd      = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Programa: %@ - %@",subItemRd,string);
        }
        else{
            [programasListaParametroRd   addObject:subItemRd];
            [programasListaNomesRd       addObject:string];
            NSLog(@"Programa: %@ - %@",subItemRd,string);
        }
        indiceRd = indiceRd + 1;
    }
    
    if ([currentElementRd isEqualToString:@"detalhePrograma"]) {
        detalheNomeProgramaRd   = NULL;
        detalheNomeProgramaRd   = string;
        NSLog(@"Detalhe Nome do Programa: %@",string);
        
    }
    
    if ([currentElementRd isEqualToString:@"detalheMnemProg"]) {
        detalheMneumonicoRd     = NULL;
        detalheMneumonicoRd     = string;
        NSLog(@"Detalhe Mneumônico: %@",string);
    }
    
    if ([currentElementRd isEqualToString:@"detalheHoraIni"]) {
        detalheHoraIniRd        = NULL;
        detalheHoraIniRd        = string;
        NSLog(@"Detalhe Hora Início: %@",string);
        
    }
    
    if ([currentElementRd isEqualToString:@"detalheHoraFim"]) {
        detalheHoraFimRd        = NULL;
        detalheHoraFimRd        = string;
        NSLog(@"Detalhe Hora Fim: %@",string);
        
    }
    
    if ([currentElementRd isEqualToString:@"detalheSemana"]) {
        detalheSemanaRd         = NULL;
        detalheSemanaRd         = string;
        NSLog(@"Detalhe Semana: %@",string);
    }
    
    if ([currentElementRd isEqualToString:@"detalheCusto30"]) {
        detalheCusto30Rd        = NULL;
        detalheCusto30Rd        = string;
        NSLog(@"Detalhe Custo 30'': %@",string);
    }
    
    if ([currentElementRd isEqualToString:@"detalheDtTab"]) {
        detalheDataTabelaRd     = NULL;
        detalheDataTabelaRd     = string;
        NSLog(@"Detalhe Data da Tabela: %@",string);
    }
}


-(BOOL)requestSOAPXMLCidadeRd:(NSString*)siglaUFRd{    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestRd = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <RadCidade xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    </RadCidade>\
                    </soap:Body>\
                    </soap:Envelope>",siglaUFRd];
    
    // -----
    
    // ----- REQUEST -----
    
    urlRd = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlRd];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestRd length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"RadCidade"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestRd dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseRd error:errorRd];
    webResponseDataRd = data;
    
    if( ConnectCin ) {
        webDataRd = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorRd);
    }
    // -----
    indiceRd = 0;
    return process;

}


-(BOOL)requestSOAPXMLRadioRd:(NSString*)nomeCidadeRd{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestRd = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                     <soap:Body>\
                     <RadRadios xmlns=\"http://www.jovedata.com.br\">\
                     <valor>%@</valor>\
                     </RadRadios>\
                     </soap:Body>\
                     </soap:Envelope>",nomeCidadeRd];
    
    // -----
    
    // ----- REQUEST -----
    
    urlRd = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlRd];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestRd length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"RadRadios"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestRd dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseRd error:errorRd];
    webResponseDataRd = data;
    
    if( ConnectCin ) {
        webDataRd = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorRd);
    }
    // -----
    indiceRd = 0;
    return process;
}



-(BOOL)requestSOAPXMLProgramaRd:(NSString*)numRadioRd{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestRd = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <RadPrograma xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    </RadPrograma>\
                    </soap:Body>\
                    </soap:Envelope>",numRadioRd];
    
    // -----
    
    // ----- REQUEST -----
    
    urlRd = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlRd];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestRd length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"RadPrograma"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestRd dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseRd error:errorRd];
    webResponseDataRd = data;
    
    if( ConnectCin ) {
        webDataRd = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorRd);
    }
    // -----
    indiceRd = 0;
    return process;
    
    
}
    
-(BOOL)requestSOAPXMLDetetalheRd:(NSString*)numProgRd:(NSString *)numRadioRd{
    BOOL process = NO;
    
    // ----- XML Request  -----
  
    xmlRequestRd = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                     <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                     <soap:Body>\
                     <DetalhesRadio xmlns=\"http://www.jovedata.com.br\">\
                     <valor>%@</valor>\
                     <radio>%@</radio>\
                     </DetalhesRadio>\
                     </soap:Body>\
                     </soap:Envelope>",numProgRd,numRadioRd];
    
    // -----
    
    // ----- REQUEST -----
    
    urlRd = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlRd];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestRd length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"DetalhesRadio"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestRd dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseRd error:errorRd];
    webResponseDataRd = data;
    
    if( ConnectCin ) {
        webDataRd = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorRd);
    }
    // -----
    indiceRd = 0;
    return process;
}
    
    
-(void)erroRd:(NSString *)mensagemRd{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message: mensagemRd delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
}


@end










