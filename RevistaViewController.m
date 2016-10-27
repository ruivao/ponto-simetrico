//
//  RevistaViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 01/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "RevistaViewController.h"
#import "RevistaDAO.h"
#import "DetalheRevistaViewController.h"

@interface RevistaViewController ()

@end

@implementation RevistaViewController

@synthesize localizaRevista;
@synthesize nomeRevistaRv;
@synthesize formatoRevistaRv;
@synthesize botaoLocalizar;
@synthesize botaoOKRevistaRv;
@synthesize botaoOKFormatoRv;
@synthesize botaoPesquisaRv;
@synthesize nomeRevistaPickerRv;
@synthesize ampulhetaRv;
@synthesize lbFormatoRv;
@synthesize lbRevistaRv;
@synthesize formatoRevistaPickerRv;

@synthesize detalheDetRevista;
@synthesize detalheNomeRevista;
@synthesize detalheEditoraRevista;
@synthesize detalheCoresRevista;
@synthesize detalheLarguraRevista;
@synthesize detalheAlturaRevista;
@synthesize detalheIndRevista;

@synthesize detalheDataTabelaRevista;

//NSInteger pickerLinhaSelecionada = 0;
NSString  *revistaSelecionada;
NSString  *formatoSelecionado;


-(IBAction)mostraRevistaPicker:(id)sender{
    nomeRevistaPickerRv.hidden     =  NO;
   
    lbFormatoRv.hidden             = YES;
    botaoOKFormatoRv.hidden        = YES;
    formatoRevistaRv.text          = @"";
    formatoRevistaRv.hidden        = YES;
    formatoRevistaPickerRv.hidden  = YES;
    
    botaoPesquisaRv.hidden         = YES;
    
    self.nomeRevistaPickerRv.delegate = self;
    self.nomeRevistaPickerRv.dataSource = self;
    [self.nomeRevistaPickerRv reloadAllComponents];
}

- (IBAction)mostraFormatoPicker:(id)sender {
    formatoRevistaPickerRv.hidden  =  NO;
    botaoPesquisaRv.hidden         = YES;
    
    self.formatoRevistaPickerRv.delegate = self;
    self.formatoRevistaPickerRv.dataSource = self;
    [self.formatoRevistaPickerRv reloadAllComponents];
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger numeroDeColunas = 0;
    
    if ([pickerView isEqual:nomeRevistaPickerRv]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:formatoRevistaPickerRv]){
        numeroDeColunas = 1;
    }
    
    return numeroDeColunas;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger pickerCount = 0;
    
    if ([pickerView isEqual:nomeRevistaPickerRv]){
        pickerCount = [nomeRevistaCollection count];
    }
    if ([pickerView isEqual:formatoRevistaPickerRv]){
        pickerCount = [formatoCollection count];
    }
    
    return pickerCount;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *pickerRow;
    
    if ([pickerView isEqual:nomeRevistaPickerRv]){
        pickerRow = [nomeRevistaCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:formatoRevistaPickerRv]){
        pickerRow = [formatoCollection objectAtIndex:row];
    }
    
    return pickerRow;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ([pickerView isEqual:nomeRevistaPickerRv]){
        [nomeRevistaRv setText:[nomeRevistaCollection objectAtIndex:row]];
        revistaSelecionada = [revistaListaValoresRv objectAtIndex:row];
    }
    
    if ([pickerView isEqual:formatoRevistaPickerRv]){
        [formatoRevistaRv setText:[formatoCollection objectAtIndex:row]];
        formatoSelecionado = [formatoListaValoresRv objectAtIndex:row];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ampulhetaRv.hidden       =  YES;
    UIView* dummyView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    nomeRevistaRv.inputView       = dummyView;
    formatoRevistaRv.inputView    = dummyView;
    
    localizaRevista.hidden        =   NO;
    botaoLocalizar.hidden         =   NO;
    
    nomeRevistaPickerRv.hidden    =  YES;
    lbRevistaRv.hidden            =  YES;
    botaoOKRevistaRv.hidden       =  YES;
    nomeRevistaRv.hidden          =  YES;
    
    formatoRevistaPickerRv.hidden =  YES;
    formatoRevistaRv.hidden       =  YES;
    lbFormatoRv.hidden            =  YES;
    botaoOKFormatoRv.hidden       =  YES;
    
    botaoPesquisaRv.hidden        =  YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botaoLocalizaRevistaOnClick:(id)sender {
    BOOL localizado    = NO;
    ampulhetaRv.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if([[self localizaRevista] isEqual: @""]){
        [self alerta:@"O campo da pesquisa não pode estar vazio."];
    }else{
        localizado = [self buscaLocalizarRevistas:localizaRevista.text];
        if(localizado == YES){
            [self mostraCampoNomeRevista];
        }else{
            [self alerta:@"Revista não localizada."];
        }
    }
    [ampulhetaRv stopAnimating];
    ampulhetaRv.hidden = YES;
}

-(void)mensagemAlertaPopUp:(NSString *)msg{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)buscaLocalizarRevistas:(NSString *)nomeRevista{
    BOOL find = NO;
    RevistaDAO *dao = [RevistaDAO new];
    find = [dao requestSOAPXMLRevistasRv:nomeRevista];
    nomeRevistaCollection = [[NSArray alloc]initWithArray: dao.revistaListaNomesRd];
    revistaListaValoresRv = [[NSArray alloc]initWithArray: dao.revistaListaParametroRv];
    
    return find;
}


-(IBAction)escondeCampos:(id)sender{
    lbRevistaRv.hidden            =  YES;
    nomeRevistaRv.hidden          =  YES;
    botaoOKRevistaRv.hidden       =  YES;
    nomeRevistaPickerRv.hidden    =  YES;
    
    lbFormatoRv.hidden            =  YES;
    formatoRevistaRv.hidden       =  YES;
    botaoOKFormatoRv.hidden       =  YES;
    formatoRevistaPickerRv.hidden =  YES;
    
    botaoPesquisaRv.hidden        =  YES;
}

-(void)mostraCampoNomeRevista{
    ampulhetaRv.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([localizaRevista.text isEqualToString:@""]){
        [self alerta:@"Preencha o nome de uma revista."];
    }else{
        lbRevistaRv.hidden              =  NO;
        nomeRevistaRv.hidden            =  NO;
        botaoOKRevistaRv.hidden         =  NO;
        formatoRevistaPickerRv.hidden   = YES;
    }
    [ampulhetaRv stopAnimating];
    ampulhetaRv.hidden = YES;
}


- (IBAction)mostraCampoFormato:(id)sender {
    ampulhetaRv.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([nomeRevistaRv.text isEqualToString:@""]){
        [self alerta:@"Selecione uma revista."];
    }else{
        [self filtroFormatoRv:revistaSelecionada];
        lbFormatoRv.hidden           =  NO;
        formatoRevistaRv.hidden      =  NO;
        botaoOKFormatoRv.hidden      =  NO;
        nomeRevistaPickerRv.hidden   = YES;
    }
    [ampulhetaRv stopAnimating];
    ampulhetaRv.hidden = YES;
}


- (IBAction)mostraBotaoPesquisa:(id)sender {
    ampulhetaRv.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([nomeRevistaRv.text isEqualToString:@""]){
        [self alerta:@"Selecione uma revista."];
    }else{
        [self filtroListaDetalheRv:revistaSelecionada:formatoSelecionado];
        botaoPesquisaRv.hidden       =  NO;
        nomeRevistaPickerRv.hidden   = YES;
    }
    [ampulhetaRv stopAnimating];
    ampulhetaRv.hidden = YES;
}


- (IBAction)botaoPesquisaOnClick:(id)sender{
    ampulhetaRv.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetalheRevistaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Detalhe-Revista"];

    form.nomeRevistaString         =  detalheNomeRevista;
    form.editoraRevistaString      =  detalheEditoraRevista;
    form.corRevistaString          =  detalheCoresRevista;
    form.larguraRevistaString      =  detalheLarguraRevista;
    form.alturaRevistaString       =  detalheAlturaRevista;
    form.indRevistaString          =  detalheIndRevista;
    form.detRevistaString          =  detalheDetRevista;
    form.dataTabelaRevistaString   =  detalheDataTabelaRevista;

    [ampulhetaRv stopAnimating];
    ampulhetaRv.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
}

-(void)filtroFormatoRv:(NSString *)nomeRevistaRv{
    RevistaDAO *dao = [RevistaDAO new];
    BOOL requestOK = [dao requestSOAPXMLFormatosRv:nomeRevistaRv];
    
    if(requestOK == YES){
        formatoCollection      = NULL;
        formatoListaValoresRv  = NULL;
        formatoCollection      = [[NSArray alloc]initWithArray: dao.formatoListaNomesRd];
        formatoListaValoresRv  = [[NSArray alloc]initWithArray: dao.formatosListaParametroRv];
    }
}

-(void)filtroListaDetalheRv:(NSString *)mnemRv:(NSString* )formatoRv{
    RevistaDAO *dao = [RevistaDAO new];
    BOOL requestOK = [dao requestSOAPXMLDetRevistaRv:mnemRv :formatoRv];
    
    if(requestOK == YES){
        detalheNomeRevista         = [dao detalheNomeRevistaRv];
        detalheEditoraRevista      = [dao detalheEditoraRevistaRv];
        detalheCoresRevista        = [dao detalheCorRevistaRv];
        detalheLarguraRevista      = [dao detalheLarguraRevistaRv];
        detalheAlturaRevista       = [dao detalheAlturaRevistaRv];
        detalheIndRevista          = [dao detalheIndRevistaRv];
        detalheDetRevista          = [dao detalheDetRevistaRv];
        detalheDataTabelaRevista   = [dao detalheDataTabelaRevistaRv];
    }
}


-(void)alerta:(NSString *)mensagem{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message:mensagem delegate:self cancelButtonTitle:@"Fechar" otherButtonTitles:nil, nil];
    [alert show];
    return;
}

- (void) threadStartAnimating {
    [ampulhetaRv setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulhetaRv];
    [ampulhetaRv startAnimating];
}


@end











