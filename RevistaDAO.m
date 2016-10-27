 //
//  RevistaDAO.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 01/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "RevistaDAO.h"
#import "RevistaViewController.h"

@implementation RevistaDAO

@synthesize webResponseDataRv;
@synthesize webDataRv;
@synthesize revistaListaNomesRd;
@synthesize formatoListaNomesRd;
@synthesize revistaListaParametroRv;
@synthesize formatosListaParametroRv;

@synthesize detalheNomeRevistaRv;
@synthesize detalheEditoraRevistaRv;
@synthesize detalheCorRevistaRv;
@synthesize detalheLarguraRevistaRv;
@synthesize detalheAlturaRevistaRv;
@synthesize detalheIndRevistaRv;
@synthesize detalheDetRevistaRv;
@synthesize detalheCustoRevistaRv;
@synthesize detalheDataTabelaRevistaRv;


// ----- Declaração de Variáveis ------
NSString                        *subItemRv;
NSString                        *subItemMnemRv;
NSString                        *subItemProgRv;
NSString                        *subItemIndRv;
NSString                        *subItemDetRv;
NSString                        *xmlRequestRv;      // XML de Request
NSString                        *currentElementRv;  // Elemento Corrente
NSURLResponse *__autoreleasing  *responseRv = nil;  // URL Response;
NSError       *__autoreleasing  *errorRv = nil;     // Variável de Erro
NSURL                           *urlRv;             // URL;
NSInteger                       indiceRv =0;
BOOL                            testeTerra = NO;
NSString                        *mnemControle;
NSString                        *stringControle;
NSInteger                       indiceControle;
// -----

// ----- RESPONSE CONNECTION E PARSE XML -----
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseDataRv  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseDataRv  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"A conexão com o servidor falhou. Por favor, tente mais tarde. - %@", error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Fim do processo de carregamento da conexão");
}
// ----

-(void)performParseXML{
    
    NSLog(@"Received %d Bytes", [self.webResponseDataRv length]);
    xmlRequestRv = [[NSString alloc] initWithBytes:[self.webResponseDataRv mutableBytes] length:[self.webResponseDataRv length] encoding:NSASCIIStringEncoding];
    
    //now parsing the xml
    NSData      *myData    = [xmlRequestRv dataUsingEncoding:NSASCIIStringEncoding];
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
    currentElementRv    = elementName;
    subItemRv           = [attributeDict objectForKey:@"value"];
    subItemMnemRv       = [attributeDict objectForKey:@"mnem"];
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{

    if ([currentElementRv isEqualToString:@"error"]){
        NSLog(@"Erro: %@",string);
        [self erroRv:string];
    }
    
    if ([currentElementRv isEqualToString:@"revista"]){

        if([subItemRv isEqualToString:@"TR&C"]){
            if(testeTerra == NO){
                if(indiceRv == 0){
                    revistaListaNomesRd        = NULL;
                    revistaListaParametroRv    = NULL;
                    revistaListaParametroRv    = [[NSMutableArray alloc]initWithObjects:@"TR&amp;C",nil];
                    revistaListaNomesRd        = [[NSMutableArray alloc]initWithObjects:@"TERRA & CIA",nil];
                    NSLog(@"Nome revista: %@ - %@",@"TR&C",@"TERRA & CIA");
                }else{
                    [revistaListaParametroRv    addObject:@"TR&amp;C"];
                    [revistaListaNomesRd        addObject:@"TERRA & CIA"];
                    NSLog(@"Nome revista: %@ - %@",@"TR&C",@"TERRA & CIA");
                }
                testeTerra = YES;
            }
        }else{
            if(indiceRv == 0){
                revistaListaNomesRd        = NULL;
                revistaListaParametroRv    = NULL;
                revistaListaParametroRv    = [[NSMutableArray alloc]initWithObjects:subItemRv,nil];
                revistaListaNomesRd        = [[NSMutableArray alloc]initWithObjects:string,nil];
                NSLog(@"Nome revista: %@ - %@",subItemRv,string);
            }
            else{
                [revistaListaParametroRv    addObject:subItemRv];
                [revistaListaNomesRd        addObject:string];
                NSLog(@"Nome revista: %@ - %@",subItemRv,string);
            }
            indiceRv = indiceRv + 1;
        }
    }
    
    if ([currentElementRv isEqualToString:@"formato"]) {
        if(indiceRv == 0){
            formatosListaParametroRv = NULL;
            formatoListaNomesRd      = NULL;
            formatosListaParametroRv = [[NSMutableArray alloc]initWithObjects:subItemRv,nil];
            formatoListaNomesRd      = [[NSMutableArray alloc]initWithObjects:string,nil];
            NSLog(@"Formato: %@ - %@ - %@",subItemMnemRv,subItemRv,string);
        }
        else{
            [formatosListaParametroRv  addObject:subItemRv];
            [formatoListaNomesRd       addObject:string];
            NSLog(@"Formato: %@ - %@ - %@",subItemMnemRv,subItemRv,string);
        }
        indiceRv = indiceRv + 1;
    }
    
    if ([currentElementRv isEqualToString:@"detalheNomeRev"]) {
        detalheNomeRevistaRv    = NULL;
        detalheNomeRevistaRv    = string;
        NSLog(@"Detalhe Nome da Revista: %@",string);
        
    }
    
    if ([currentElementRv isEqualToString:@"detalheNomeEdi"]) {
        detalheEditoraRevistaRv     = NULL;
        detalheEditoraRevistaRv     = string;
        NSLog(@"Detalhe Nome da Editora: %@",string);
    }
    
    if ([currentElementRv isEqualToString:@"detalheCores"]) {
        detalheCorRevistaRv        = NULL;
        detalheCorRevistaRv        = string;
        NSLog(@"Detalhe Cor: %@",string);
        
    }
    
    if ([currentElementRv isEqualToString:@"detalheLarg"]) {
        detalheLarguraRevistaRv    = NULL;
        detalheLarguraRevistaRv    = string;
        NSLog(@"Detalhe Largura: %@",string);
    }
    
    if ([currentElementRv isEqualToString:@"detalheAlt"]) {
        detalheAlturaRevistaRv     = NULL;
        detalheAlturaRevistaRv     = string;
        NSLog(@"Detalhe Altura: %@",string);
    }
    
    if ([currentElementRv isEqualToString:@"ind"]) {
        detalheIndRevistaRv      = NULL;
        detalheIndRevistaRv      = string;
        NSLog(@"Detalhe Posicao IND: %@",string);
    }
    
    if ([currentElementRv isEqualToString:@"det"]) {
        detalheDetRevistaRv      = NULL;
        detalheDetRevistaRv      = string;
        NSLog(@"Detalhe Posicao DET: %@",string);
    }
    
    if ([currentElementRv isEqualToString:@"detalheDtTab"]) {
        detalheDataTabelaRevistaRv    = NULL;
        detalheDataTabelaRevistaRv    = string;
        NSLog(@"Detalhe Data da Tabela: %@",string);
    }
}



-(BOOL)requestSOAPXMLRevistasRv:(NSString*)nomeRevistaLocaliza{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestRv = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <RevRevista xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    </RevRevista>\
                    </soap:Body>\
                    </soap:Envelope>",nomeRevistaLocaliza];
    
    // -----
    
    // ----- REQUEST -----
    
    urlRv = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlRv];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestRv length]];
    
    [req addValue: @"text/xml; charset=ISO-8859-1" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"RevRevista"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestRv dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseRv error:errorRv];
    webResponseDataRv = data;
    
    if( ConnectCin ) {
        webDataRv = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorRv);
    }
    // -----
    indiceRv = 0;
    return process;
}

-(BOOL)requestSOAPXMLFormatosRv:(NSString*)nomeRevistaRv{
    BOOL process = NO;
    
    // ----- XML Request  -----
    xmlRequestRv = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <RevFormato xmlns=\"http://www.jovedata.com.br\">\
                    <valor>%@</valor>\
                    </RevFormato>\
                    </soap:Body>\
                    </soap:Envelope>",nomeRevistaRv];
    // -----
  
    // ----- REQUEST -----
    
    urlRv = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlRv];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestRv length]];
    
    [req addValue: @"text/xml; charset=ISO-8859-1" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"RevRevista"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestRv dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseRv error:errorRv];
    webResponseDataRv = data;
    
    if( ConnectCin ) {
        webDataRv = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorRv);
    }
    // -----
    indiceRv = 0;
    return process;
    
}

-(BOOL)requestSOAPXMLDetRevistaRv:(NSString*)mnemRv:(NSString *)formatoRv{
    BOOL process = NO;
    
    // ----- XML Request  -----
    
    xmlRequestRv = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\
                    <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
                    <soap:Body>\
                    <DetalhesRevista xmlns=\"http://www.jovedata.com.br\">\
                    <mnem>%@</mnem>\
                    <valor>%@</valor>\
                    </DetalhesRevista>\
                    </soap:Body>\
                    </soap:Envelope>",mnemRv,formatoRv];
    
    // -----
    
    // ----- REQUEST -----
    
    urlRv = [NSURL URLWithString: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:urlRv];
    NSString      *msgLength = [NSString stringWithFormat:@"%d", [xmlRequestRv length]];
    
    [req addValue: @"text/xml; charset=ISO-8859-1" forHTTPHeaderField:@"Content-Type"];
    [req addValue: @"http://www.jovedata.com.br/ABsitejove/webservicesite/webServiceComunication.asmx" forHTTPHeaderField:@"RevRevista"];
    [req addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [xmlRequestRv dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSURLConnection *ConnectCin    = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSData                *data    = [NSURLConnection sendSynchronousRequest:req returningResponse:responseRv error:errorRv];
    webResponseDataRv = data;
    
    if( ConnectCin ) {
        webDataRv = [NSMutableData data];
        [self performParseXML];
        process = YES;
    }else {
        process = NO;
        NSLog(@"Some error occurred in Connection: %@", errorRv);
    }
    // -----
    indiceRv = 0;
    return process;
    
}

-(NSString *)validaString:(NSMutableString *)palavra{
    NSString *someString = palavra;
    
    unsigned int len = [someString length];
    char buffer[len];
    char caracter = @"&";
    
    //This way:
    strcpy(buffer, [someString UTF8String]);
    
    //Or this way (preferred):
    
    [someString getCharacters:buffer range:NSMakeRange(0, len)];
    
    for(int i = 0; i < len; ++i) {
        char current = buffer[i];
        if(current == caracter){
        
        }
        //do something with current...
    }
    return someString;
}

-(void)erroRv:(NSString *)mensagemRd{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message: mensagemRd delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}


@end
