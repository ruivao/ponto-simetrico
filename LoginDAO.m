//
//  LoginDAO.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 28/04/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "LoginDAO.h"
#import "LoginViewController.h"

@implementation LoginDAO

@synthesize webResponseData;
@synthesize webData;
@synthesize login;
@synthesize midiasNomes;
@synthesize midiasValores;

// ----- Declaração de Variáveis ------

NSString                        *xmlRequest;      // XML de Request
NSError *__autoreleasing        *error = nil;     // Variável de Erro
NSURL                           *url;             // URL;
NSURLResponse *__autoreleasing  *response = nil;  // URL Response;
NSURLRequest                    *request;         // URL Request;
NSString                        *currentElement;  // Elemento Corrente
NSInteger                       indiceMenu;
BOOL                            erroMenu = NO;

// -----


// ----- RESPONSE CONNECTION E PARSE XML -----

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseData  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseData  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again. - %@", error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Fim do processo de carregamento da conexão");
}

// ----


-(void)performParseXML{
    
    NSLog(@"Received %d Bytes", [self.webResponseData length]);
    xmlRequest = [[NSString alloc] initWithBytes:[self.webResponseData mutableBytes] length:[self.webResponseData length] encoding:NSUTF8StringEncoding];
    
    //now parsing the xml
    NSData      *myData    = [xmlRequest dataUsingEncoding:NSUTF8StringEncoding];
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
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Server Error" message:[exception reason] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
}


//Implement the NSXmlParserDelegate methods
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentElement = elementName;
}

// PARSE XML NAS TAGS ENCONTRADAS NO WEBSERVICE
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if ([currentElement isEqualToString:@"error"]) {
        if(erroMenu == NO){
            NSLog(@"Erro: %@",@"Usuário ou senha inválido.");
            login = NO;
            erroMenu = YES;
            //[self erro:string];
            [self erro:@"Usuário ou senha inválido."];
        }
    }
    
    if ([currentElement isEqualToString:@"nomefantasia"]) {
        NSLog(@"Nome Fantasia: %@",string);
    }

    if ([currentElement isEqualToString:@"razaosocial"]) {
        NSLog(@"Razão Social: %@",string);
    }

    if ([currentElement isEqualToString:@"cnpj"]) {
        NSLog(@"CNPJ: %@",string);
        login = YES;
    }

    if ([currentElement isEqualToString:@"emailcliente"]) {
        NSLog(@"E-Mail: %@",string);
    }

    if ([currentElement isEqualToString:@"midiacn"]) {
        if(indiceMenu == 0){
            midiasNomes       = NULL;
            midiasValores     = NULL;
            midiasNomes       = [[NSMutableArray alloc]initWithObjects:@"Cinema",nil];
            midiasValores     = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Mídia: %@ - %@",@"Cinema",string);
        }
        else{
            [midiasNomes       addObject:@"Cinema"];
            [midiasValores     addObject:string];
            NSLog(@"Mídia: %@ - %@",@"Cinema",string);
        }
        indiceMenu = indiceMenu + 1;
    }
 
    if ([currentElement isEqualToString:@"midiain"]) {
        if(indiceMenu == 0){
            midiasNomes       = NULL;
            midiasValores     = NULL;
            midiasNomes       = [[NSMutableArray alloc]initWithObjects:@"Internet",nil];
            midiasValores     = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Mídia: %@ - %@",@"Internet",string);
        }
        else{
            [midiasNomes       addObject:@"Internet"];
            [midiasValores     addObject:string];
            NSLog(@"Mídia: %@ - %@",@"Internet",string);
        }
        indiceMenu = indiceMenu + 1;
    }
    
    if ([currentElement isEqualToString:@"midiatv"]) {
        if(indiceMenu == 0){
            midiasNomes       = NULL;
            midiasValores     = NULL;
            midiasNomes       = [[NSMutableArray alloc]initWithObjects:@"TV",nil];
            midiasValores     = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Mídia: %@ - %@",@"TV",string);
        }
        else{
            [midiasNomes       addObject:@"TV"];
            [midiasValores     addObject:string];
            NSLog(@"Mídia: %@ - %@",@"TV",string);
        }
        indiceMenu = indiceMenu + 1;

    }
   
    if ([currentElement isEqualToString:@"midiarv"]) {
        if(indiceMenu == 0){
            midiasNomes       = NULL;
            midiasValores     = NULL;
            midiasNomes       = [[NSMutableArray alloc]initWithObjects:@"Revista",nil];
            midiasValores     = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Mídia: %@ - %@",@"Revista",string);
        }
        else{
            [midiasNomes       addObject:@"Revista"];
            [midiasValores     addObject:string];
            NSLog(@"Mídia: %@ - %@",@"Revista",string);
        }
        indiceMenu = indiceMenu + 1;

    }

    if ([currentElement isEqualToString:@"midiard"]) {
        if(indiceMenu == 0){
            midiasNomes       = NULL;
            midiasValores     = NULL;
            midiasNomes       = [[NSMutableArray alloc]initWithObjects:@"Radio",nil];
            midiasValores     = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Mídia: %@ - %@",@"Radio",string);
        }
        else{
            [midiasNomes       addObject:@"Radio"];
            [midiasValores     addObject:string];
            NSLog(@"Mídia: %@ - %@",@"Radio",string);
        }
        indiceMenu = indiceMenu + 1;

    }
    
    if ([currentElement isEqualToString:@"midiajr"]) {
        if(indiceMenu == 0){
            midiasNomes       = NULL;
            midiasValores     = NULL;
            midiasNomes       = [[NSMutableArray alloc]initWithObjects:@"Jornal",nil];
            midiasValores     = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Mídia: %@ - %@",@"Jornal",string);
        }
        else{
            [midiasNomes       addObject:@"Jornal"];
            [midiasValores     addObject:string];
            NSLog(@"Mídia: %@ - %@",@"Jornal",string);
        }
        indiceMenu = indiceMenu + 1;

    }
    
    if ([currentElement isEqualToString:@"dtvalidadecliente"]) {
        NSLog(@"Data de Validade: %@",string);
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //NSLog(@"Parsed Element : %@", currentElement);
}


-(BOOL)requestSOAPXML:(NSString *)user:(NSString *)senha{
    
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequest = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
                  <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\
                  <soap12:Body>\
                  <Acesso xmlns=\"http://www.jovedata.com.br\">\
                  <login>%@</login>\
                  <senha>%@</senha>\
                  </Acesso>\
                  </soap12:Body>\
                  </soap12:Envelope>",user,senha];
    
    // -----
    
    // ----- REQUEST -----
    
    url = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequest length]];
    
    [req addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"Acesso"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequest dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *theConnection    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                   *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:response error:error];
    webResponseData = data;
    
    if( theConnection ) {
        webData = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", error);
    }
    // -----
    erroMenu  = NO;
    return process;
}

-(void)erro:(NSString *)mensagem{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message: mensagem delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end
