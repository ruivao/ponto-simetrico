//
//  JornalViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 03/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "JornalViewController.h"
#import "JornalPagina2ViewController.h"
#import "JornalDAO.h"

@interface JornalViewController ()

@end

@implementation JornalViewController

@synthesize ampulhetaJr;
@synthesize botaoOKCidadeJr;
@synthesize botaoOKEstadoJr;
@synthesize botaoOKJornalJr;
@synthesize botaoOKPosicaoJr;
@synthesize botaoProximaJr;
@synthesize cidadeJornal;
@synthesize cidadePicker;
@synthesize estadoJornal;
@synthesize jornalJornal;
@synthesize jornalPicker;
@synthesize lbCidadeJr;
@synthesize lbEstadoJr;
@synthesize lbJornalJr;
@synthesize lbPosicaoJr;
@synthesize posicaoJornal;
@synthesize posicaoPickerJr;
@synthesize estadoPickerJr;


//NSInteger pickerLinhaSelecionada = 0;
NSString  *estadoSelecionadaJr;
NSString  *cidadeSelecionadaJr;
NSString  *jornalSelecionadoJr;
NSString  *mnemSelecionadoJr;
NSString  *posicaoSelecionadaJr;


- (IBAction)mostraEstadoPicker:(id)sender {
    estadoPickerJr.hidden          =   NO;
    
    cidadePicker.hidden            =  YES;
    lbCidadeJr.hidden              =  YES;
    botaoOKCidadeJr.hidden         =  YES;
    cidadeJornal.text              =  @"";
    cidadeJornal.hidden            =  YES;
    
    jornalPicker.hidden            =  YES;
    lbJornalJr.hidden              =  YES;
    botaoOKJornalJr.hidden         =  YES;
    jornalJornal.text              =  @"";
    jornalJornal.hidden            =  YES;
    
    posicaoPickerJr.hidden         =  YES;
    lbPosicaoJr.hidden             =  YES;
    botaoOKPosicaoJr.hidden        =  YES;
    posicaoJornal.text             =  @"";
    posicaoJornal.hidden           =  YES;
    lbJornalJr.hidden              =  YES;
    
    botaoProximaJr.hidden          =  YES;
}


- (IBAction)mostraCidadePicker:(id)sender {
    estadoPickerJr.hidden          =  YES;
    cidadePicker.hidden            =   NO;
    
    jornalPicker.hidden            =  YES;
    lbJornalJr.hidden              =  YES;
    botaoOKJornalJr.hidden         =  YES;
    jornalJornal.text              =  @"";
    jornalJornal.hidden            =  YES;
    
    posicaoPickerJr.hidden         =  YES;
    lbPosicaoJr.hidden             =  YES;
    botaoOKPosicaoJr.hidden        =  YES;
    posicaoJornal.text             =  @"";
    posicaoJornal.hidden           =  YES;
    lbJornalJr.hidden              =  YES;
    
    botaoProximaJr.hidden          =  YES;

    self.cidadePicker.delegate     = self;
    self.cidadePicker.dataSource   = self;
    [self.cidadePicker reloadAllComponents];
}


- (IBAction)mostraJornalPicker:(id)sender {
    cidadePicker.hidden            =  YES;
    jornalPicker.hidden            =   NO;
    
    posicaoPickerJr.hidden         =  YES;
    lbPosicaoJr.hidden             =  YES;
    botaoOKPosicaoJr.hidden        =  YES;
    posicaoJornal.text             =  @"";
    posicaoJornal.hidden           =  YES;
    
    botaoProximaJr.hidden          =  YES;
    
    self.jornalPicker.delegate     = self;
    self.jornalPicker.dataSource   = self;
    [self.jornalPicker reloadAllComponents];
}

- (IBAction)mostraPosicaoPicker:(id)sender {
    jornalPicker.hidden            =  YES;
    posicaoPickerJr.hidden         =   NO;
    
    botaoProximaJr.hidden          =  YES;

    self.posicaoPickerJr.delegate     = self;
    self.posicaoPickerJr.dataSource   = self;
    [self.posicaoPickerJr reloadAllComponents];
}


- (IBAction)botaoProximaClick:(id)sender {
    ampulhetaJr.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    JornalPagina2ViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-JornalPagina2"];
    
    form.estadoSelect     =  estadoJornal.text;
    form.cideadeSelect    =  cidadeJornal.text;
    form.jornalSelect     =  jornalSelecionadoJr;
    form.nomeJornalSelect =  jornalJornal.text;
    form.posicaoSelect    =  posicaoSelecionadaJr;
    
    [ampulhetaJr stopAnimating];
    ampulhetaJr.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger numeroDeColunas = 0;
    
    if ([pickerView isEqual:estadoPickerJr]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:cidadePicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:jornalPicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:posicaoPickerJr]){
        numeroDeColunas = 1;
    }
    
    return numeroDeColunas;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger pickerCount = 0;
    
    if ([pickerView isEqual:estadoPickerJr]){
        pickerCount = [estadoCollectionJr count];
    }
    if ([pickerView isEqual:cidadePicker]){
        pickerCount = [cidadeCollectionJr count];
    }
    if ([pickerView isEqual: jornalPicker]){
        pickerCount = [jornalCollectionJr count];
    }
    if ([pickerView isEqual: posicaoPickerJr]){
        pickerCount = [posicaoCollectionJr count];
    }
    
    return pickerCount;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *pickerRow;
    
    if ([pickerView isEqual:estadoPickerJr]){
        pickerRow = [estadoCollectionJr objectAtIndex:row];
    }
    if ([pickerView isEqual:cidadePicker]){
        pickerRow = [cidadeCollectionJr objectAtIndex:row];
    }
    if ([pickerView isEqual:jornalPicker]){
        pickerRow = [jornalCollectionJr objectAtIndex:row];
    }
    if ([pickerView isEqual:posicaoPickerJr]){
        pickerRow = [posicaoCollectionJr objectAtIndex:row];
    }
    
    return pickerRow;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ([pickerView isEqual:estadoPickerJr]){
        [estadoJornal setText:[estadoCollectionJr objectAtIndex:row]];
    }
    if ([pickerView isEqual:cidadePicker]){
        [cidadeJornal setText:[cidadeCollectionJr objectAtIndex:row]];
        cidadeSelecionadaJr = [cidadeListaValoresJr objectAtIndex:row];
    }
    if ([pickerView isEqual:jornalPicker]){
        [jornalJornal setText:[jornalCollectionJr objectAtIndex:row]];
        jornalSelecionadoJr   = [jornalListaValoresJr objectAtIndex:row];
        mnemSelecionadoJr     = [jornalListaValoresJr objectAtIndex:row];
    }
    if ([pickerView isEqual:posicaoPickerJr]){
        [posicaoJornal setText:[posicaoCollectionJr objectAtIndex:row]];
        posicaoSelecionadaJr = [posicaoListaValoresJr objectAtIndex:row];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ampulhetaJr.hidden = YES;
    UIView* dummyView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    estadoJornal.inputView    = dummyView;
    cidadeJornal.inputView    = dummyView;
    jornalJornal.inputView    = dummyView;
    posicaoJornal.inputView   = dummyView;
    
    estadoPickerJr.hidden       = YES;
    lbCidadeJr.hidden           = YES;
    cidadeJornal.hidden         = YES;
    cidadePicker.hidden         = YES;
    botaoOKCidadeJr.hidden      = YES;
    
    lbJornalJr.hidden           = YES;
    jornalPicker.hidden         = YES;
    jornalJornal.hidden         = YES;
    botaoOKJornalJr.hidden      = YES;
    
    lbPosicaoJr.hidden          = YES;
    posicaoPickerJr.hidden      = YES;
    posicaoJornal.hidden        = YES;
    botaoOKPosicaoJr.hidden     = YES;
    
    botaoProximaJr.hidden       = YES;
   
    estadoCollectionJr =  [[NSArray alloc]initWithObjects:@"AC",@"AL",@"AP",@"AM",@"BA",@"CE",@"DF",@"ES",@"GO",@"MA",@"MT",@"MS",@"MG",@"PA",@"PB",@"PR",@"PE",@"PI",@"RN",@"RS",@"RJ",@"RO",@"RR",@"SC",@"SP",@"SE",@"TO", nil, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mostraCampoCidadeJr:(id)sender {
    ampulhetaJr.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([estadoJornal.text isEqualToString:@""]){
        [self alerta:@"Selecione um estado (UF)."];
    }else{
        [self filtroCidadesJr:estadoJornal.text];
        lbCidadeJr.hidden         =  NO;
        cidadeJornal.hidden       =  NO;
        botaoOKCidadeJr.hidden    =  NO;
        estadoPickerJr.hidden     = YES;
    }
    [ampulhetaJr stopAnimating];
    ampulhetaJr.hidden = YES;
}

- (IBAction)mostraCampoJornalJr:(id)sender {
    ampulhetaJr.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([estadoJornal.text isEqualToString:@""]){
        [self alerta:@"Selecione uma cidade."];
    }else{
        [self filtroJornal:cidadeSelecionadaJr];
        lbJornalJr.hidden         =  NO;
        jornalJornal.hidden       =  NO;
        botaoOKJornalJr.hidden    =  NO;
        cidadePicker.hidden       = YES;
    }
    [ampulhetaJr stopAnimating];
    ampulhetaJr.hidden = YES;
}

- (IBAction)mostraCampoPosicao:(id)sender {
    ampulhetaJr.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([estadoJornal.text isEqualToString:@""]){
        [self alerta:@"Selecione um jornal."];
    }else{
        [self filtroPosicao:mnemSelecionadoJr];
        lbPosicaoJr.hidden         =  NO;
        posicaoJornal.hidden       =  NO;
        botaoOKPosicaoJr.hidden    =  NO;
        jornalPicker.hidden        = YES;
    }
    [ampulhetaJr stopAnimating];
    ampulhetaJr.hidden = YES;
}

- (IBAction)mostraBotaoProximaJr:(id)sender {
    ampulhetaJr.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([estadoJornal.text isEqualToString:@""]){
        [self alerta:@"Selecione uma posição."];
    }else{
        posicaoPickerJr.hidden         =  YES;
        botaoProximaJr.hidden          =   NO;
    }
    [ampulhetaJr stopAnimating];
    ampulhetaJr.hidden = YES;
}


-(void)filtroCidadesJr:(NSString *)estadoJr{
    JornalDAO *dao = [JornalDAO new];
    BOOL requestOK = [dao requestSOAPXMLCidadeJr:estadoJr];
    
    if(requestOK == YES){
        cidadeCollectionJr      = NULL;
        cidadeListaValoresJr    = NULL;
        cidadeCollectionJr    = [[NSArray alloc]initWithArray: dao.cidadeListaNomesJr];
        cidadeListaValoresJr  = [[NSArray alloc]initWithArray: dao.cidadeListaParametroJr];
    }
}

-(void)filtroJornal:(NSString *)nomeCidade{
    JornalDAO *dao = [JornalDAO new];
    BOOL requestOK = [dao requestSOAPXMLJornalJr:nomeCidade];
    
    if(requestOK == YES){
        jornalCollectionJr      = NULL;
        jornalListaValoresJr    = NULL;
        jornalCollectionJr      = [[NSArray alloc]initWithArray: dao.jornaisListaNomesJr];
        jornalListaValoresJr    = [[NSArray alloc]initWithArray: dao.jornaisListaParametroJr];
    }
}

-(void)filtroPosicao:(NSString *)mnemJr{
    JornalDAO *dao = [JornalDAO new];
    BOOL requestOK = [dao requestSOAPXMLPosicaoJr:mnemJr];
    
    if(requestOK == YES){
        posicaoCollectionJr      = NULL;
        posicaoListaValoresJr    = NULL;
        posicaoCollectionJr      = [[NSArray alloc]initWithArray: dao.posicaoListaNomesJr];
        posicaoListaValoresJr    = [[NSArray alloc]initWithArray: dao.posicaoListaParametroJr];
    }
}


-(void)alerta:(NSString *)mensagem{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message:mensagem delegate:self cancelButtonTitle:@"Fechar" otherButtonTitles:nil, nil];
    [alert show];
    return;
}

- (void) threadStartAnimating {
    [ampulhetaJr setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulhetaJr];
    [ampulhetaJr startAnimating];
}



@end











