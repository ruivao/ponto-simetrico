//
//  InternetViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 06/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "InternetViewController.h"
#import "InternetDAO.h"
#import "DetalheInternetViewController.h"

@interface InternetViewController ()

@end

@implementation InternetViewController

@synthesize portal;
@synthesize site;
@synthesize anuncio;
@synthesize venda;
@synthesize portalPicker;
@synthesize sitePicker;
@synthesize anuncioPicker;
@synthesize vendaPicker;
@synthesize buttonPesquisaInt;
@synthesize labelSite;
@synthesize labelVenda;
@synthesize labelPortal;
@synthesize labelAnuncio;
@synthesize botaoOKSite;
@synthesize botaoOKVenda;
@synthesize botaoOKPortal;
@synthesize botaoOKAnuncio;
@synthesize ampulhetaInt;

// Variavies ****
NSString     *portalSelecionado;
NSString     *siteSelecionado;
NSString     *anuncioSelecionado;
NSString     *vendaSelecionada;
NSString     *custoLarguraFCDet;
NSString     *custoAlturaFCDet;
NSString     *custoLarguraABDet;
NSString     *custoAlturaABDet;
NSString     *custoTotalDet;
NSString     *dataTabelaIntDet;
//  -----

-(IBAction)portalPickerShow:(id)sender{
    portalPicker.hidden     =  NO;
    sitePicker.hidden       = YES;
    anuncioPicker.hidden    = YES;
    vendaPicker.hidden      = YES;
    botaoOKPortal.hidden    =  NO;

    labelSite.hidden        = YES;
    site.hidden             = YES;
    botaoOKSite.hidden      = YES;
    site.text               = @"";

    labelAnuncio.hidden     = YES;
    anuncio.hidden          = YES;
    botaoOKAnuncio.hidden   = YES;
    anuncio.text            = @"";

    labelVenda.hidden       = YES;
    venda.hidden            = YES;
    venda.text              = @"";
    buttonPesquisaInt.hidden   = YES;

    self.sitePicker.delegate   = self;
    self.sitePicker.dataSource = self;
    [self.sitePicker reloadAllComponents];
}


-(IBAction)sitePickerShow:(id)sender{
    portalPicker.hidden     = YES;
    sitePicker.hidden       =  NO;
    anuncioPicker.hidden    = YES;
    vendaPicker.hidden      = YES;
    botaoOKSite.hidden      =  NO;
    
    labelAnuncio.hidden     = YES;
    anuncio.hidden          = YES;
    anuncio.text            = @"";
    
    labelVenda.hidden       = YES;
    venda.hidden            = YES;
    botaoOKVenda.hidden     = YES;
    venda.text              = @"";
    buttonPesquisaInt.hidden   = YES;

    self.sitePicker.delegate   = self;
    self.sitePicker.dataSource = self;
    [self.sitePicker reloadAllComponents];

}

-(IBAction)anuncioPickerShow:(id)sender{
    portalPicker.hidden     = YES;
    sitePicker.hidden       = YES;
    anuncioPicker.hidden    =  NO;
    vendaPicker.hidden      = YES;
    botaoOKAnuncio.hidden   =  NO;
    
    labelVenda.hidden       = YES;
    venda.hidden            = YES;
    botaoOKVenda.hidden     = YES;
    venda.text              = @"";
    buttonPesquisaInt.hidden   = YES;

    self.anuncioPicker.delegate = self;
    self.anuncioPicker.dataSource = self;
    [self.anuncioPicker reloadAllComponents];
}

-(IBAction)vendaPickerShow:(id)sender{
    portalPicker.hidden     = YES;
    sitePicker.hidden       = YES;
    anuncioPicker.hidden    = YES;
    vendaPicker.hidden      =  NO;
    botaoOKVenda.hidden     =  NO;
    
    self.vendaPicker.delegate = self;
    self.vendaPicker.dataSource = self;
    [self.vendaPicker reloadAllComponents];
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger numeroDeColunas = 0;
    
    if ([pickerView isEqual:portalPicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:sitePicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:anuncioPicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:vendaPicker]){
        numeroDeColunas = 1;
    }
    
    return numeroDeColunas;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger pickerCount = 0;
    
    if ([pickerView isEqual:portalPicker]){
        pickerCount = [portalCollection count];
    }
    if ([pickerView isEqual:sitePicker]){
        pickerCount = [siteCollection count];
    }
    if ([pickerView isEqual: anuncioPicker]){
        pickerCount = [anuncioCollection count];
    }
    if ([pickerView isEqual: vendaPicker]){
        pickerCount = [vendaCollection count];
    }
    
    return pickerCount;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *pickerRow;
    
    if ([pickerView isEqual:portalPicker]){
        pickerRow = [portalCollection objectAtIndex:row];
        portalSelecionado = [portalValores objectAtIndex:row];
    }
    if ([pickerView isEqual:sitePicker]){
        pickerRow = [siteCollection objectAtIndex:row];
        siteSelecionado = [siteValores objectAtIndex:row];
    }
    if ([pickerView isEqual:anuncioPicker]){
        pickerRow = [anuncioCollection objectAtIndex:row];
        anuncioSelecionado = [anuncioValores objectAtIndex:row];
    }
    if ([pickerView isEqual:vendaPicker]){
        pickerRow = [vendaCollection objectAtIndex:row];
        vendaSelecionada = [vendaValores objectAtIndex:row];
    }
    
    return pickerRow;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ([pickerView isEqual:portalPicker]){
        [portal setText:[portalCollection objectAtIndex:row]];
        portalSelecionado = [portalValores objectAtIndex:row];
    }
    if ([pickerView isEqual:sitePicker]){
        [site setText:[siteCollection objectAtIndex:row]];
        siteSelecionado = [siteValores objectAtIndex:row];
    }
    if ([pickerView isEqual:anuncioPicker]){
        [anuncio setText:[anuncioCollection objectAtIndex:row]];
        anuncioSelecionado = [anuncioValores objectAtIndex:row];
    }
    if ([pickerView isEqual:vendaPicker]){
        [venda setText:[vendaCollection objectAtIndex:row]];
        vendaSelecionada = [vendaValores objectAtIndex:row];
    }
}


-(IBAction)mostraCampoSite:(id)sender{
    ampulhetaInt.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([portal.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Portal'."];
    }else {
        [self filtroSite:portalSelecionado];
        labelSite.hidden     =  NO;
        site.hidden          =  NO;
        portalPicker.hidden  = YES;
    }
    [ampulhetaInt stopAnimating];
    ampulhetaInt.hidden  = YES;
}

-(IBAction)mostraCampoAnuncio:(id)sender{
    ampulhetaInt.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];

    if ([site.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Anuncio'."];
    }else {
        [self filtroAnuncio:siteSelecionado:portalSelecionado];
        labelAnuncio.hidden  =  NO;
        anuncio.hidden       =  NO;
        sitePicker.hidden    =  YES;
    }
    [ampulhetaInt stopAnimating];
    ampulhetaInt.hidden  = YES;
}

-(IBAction)mostraCampoVenda:(id)sender{
    ampulhetaInt.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    if ([anuncio.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Portal'."];
    }else {
        [self filtroVenda:anuncioSelecionado:portalSelecionado:siteSelecionado];
        labelVenda.hidden    =   NO;
        venda.hidden         =   NO;
        anuncioPicker.hidden =  YES;
    }
    [ampulhetaInt stopAnimating];
    ampulhetaInt.hidden  = YES;
}

-(IBAction)mostraBotaoPesquisa:(id)sender{
    ampulhetaInt.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    if ([venda.text isEqualToString:@""]){
        [self alerta:@"Selecione uma 'Venda'."];
    }else {
        [self mostraDetalheInternetPreco:vendaSelecionada:portalSelecionado:siteSelecionado:anuncioSelecionado];
        buttonPesquisaInt.hidden = NO;
        vendaPicker.hidden       = YES;
    }
    [ampulhetaInt stopAnimating];
    ampulhetaInt.hidden  = YES;
}

-(void)alerta:(NSString *)mensagem{
    UIAlertView *alertInt = [[UIAlertView alloc]initWithTitle:@"Alerta!" message:mensagem delegate:self cancelButtonTitle:@"Fechar" otherButtonTitles:nil, nil];
    [alertInt show];
    return;
}
    
    
- (void)viewDidLoad {
  
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ampulhetaInt.hidden = YES;
    UIView* dummyView   =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    portal.inputView    = dummyView;
    site.inputView      = dummyView;
    anuncio.inputView   = dummyView;
    venda.inputView     = dummyView;
    
    botaoOKPortal.hidden  =  YES;
    
    labelSite.hidden      =  YES;
    site.hidden           =  YES;
    botaoOKSite.hidden    =  YES;
    
    labelAnuncio.hidden   =  YES;
    anuncio.hidden        =  YES;
    botaoOKAnuncio.hidden =  YES;
    
    labelVenda.hidden     =  YES;
    venda.hidden          =  YES;
    botaoOKVenda.hidden   =  YES;
    
    portalPicker.hidden   =  YES;
    sitePicker.hidden     =  YES;
    anuncioPicker.hidden  =  YES;
    vendaPicker.hidden    =  YES;
    buttonPesquisaInt.hidden =  YES;
 
    [self listaPortais];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPesquisaClick:(id)sender{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetalheInternetViewController *formIntDet = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Detalhe-Internet"];
    
    formIntDet.custoAlturaFCString      =  custoAlturaFCDet;
    formIntDet.custoLarguraFCString     =  custoLarguraFCDet;
    formIntDet.custoAlturaABString      =  custoAlturaABDet;
    formIntDet.custoLarguraABString     =  custoLarguraABDet;
    formIntDet.custoTotalString         =  custoTotalDet;
    formIntDet.dataTabelaIntString      =  dataTabelaIntDet;
    
    [self.navigationController pushViewController:formIntDet animated:YES];
}

-(void)listaPortais{
    InternetDAO *daoInt = [InternetDAO new];
    BOOL requestOK = [daoInt requestSOAPXMLPortal];
    
    if(requestOK == YES){
        portalCollection = NULL;
        portalValores    = NULL;
        portalCollection = [[NSArray alloc]initWithArray: daoInt.portalListaInt];
        portalValores    = [[NSArray alloc]initWithArray: daoInt.portalListaValores];
    }
}

-(void)filtroSite:(NSString *)numPortal{
    InternetDAO *daoInt = [InternetDAO new];
    BOOL requestOK = [daoInt requestSOAPXMLSite:numPortal];
    
    if(requestOK == YES){
        siteCollection = NULL;
        siteValores    = NULL;
        siteCollection = [[NSArray alloc]initWithArray: daoInt.siteListaInt];
        siteValores    = [[NSArray alloc]initWithArray: daoInt.siteListaValores];
    }
}

-(void)filtroAnuncio:(NSString *)codSite:(NSString *)codPortal{
    InternetDAO *daoInt = [InternetDAO new];
    BOOL requestOK = [daoInt requestSOAPXMLAnuncio:codSite:codPortal];
    
    if(requestOK == YES){
        anuncioCollection = NULL;
        anuncioValores    = NULL;
        anuncioCollection = [[NSArray alloc]initWithArray: daoInt.anuncioListaInt];
        anuncioValores    = [[NSArray alloc]initWithArray: daoInt.anuncioListaValores];
    }
}

-(void)filtroVenda:(NSString *)numAnuncio:(NSString *)codPortal:(NSString *)codSite{
    InternetDAO *daoInt = [InternetDAO new];
    BOOL requestOK = [daoInt requestSOAPXMLVenda:numAnuncio:codPortal:codSite];
    
    if(requestOK == YES){
        vendaCollection = NULL;
        vendaValores    = NULL;
        vendaCollection = [[NSArray alloc]initWithArray: daoInt.vendaListaInt];
        vendaValores    = [[NSArray alloc]initWithArray: daoInt.vendaListaValores];
    }
}

-(void)mostraDetalheInternetPreco:(NSString *)codVenda:(NSString *)codPortal:(NSString *)codSite:(NSString *)numAnuncio{
    InternetDAO *daoInt = [InternetDAO new];
    BOOL requestOK = [daoInt requestSOAPXMLDetInt:codVenda:codPortal:codSite:numAnuncio];
    
    if(requestOK == YES){
        custoLarguraFCDet   = [daoInt detalheCustoAlturaFC];
        custoAlturaFCDet    = [daoInt detalheCustoLarguraFC];
        custoLarguraABDet   = [daoInt detalheCustoAlturaAB];
        custoAlturaABDet    = [daoInt detalheCustoLarguraAB];
        custoTotalDet       = [daoInt detalheCustoTotal];
        dataTabelaIntDet    = [daoInt detalheDataTabelaInt];
    }
}

- (void) threadStartAnimating {
    [ampulhetaInt setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulhetaInt];
    [ampulhetaInt startAnimating];
}


@end

















