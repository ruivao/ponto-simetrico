//
//  RadioViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 31/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "RadioViewController.h"
#import "RadioDAO.h"
#import "DetalheRadioViewController.h"

@interface RadioViewController ()

@end

@implementation RadioViewController

@synthesize lbEstadoRadio;
@synthesize lbCidadeRadio;
@synthesize lbNomeRadio;
@synthesize lbProgramaRadio;
@synthesize estadoRadio;
@synthesize cidadeRadio;
@synthesize nomeRadio;
@synthesize programaRadio;
@synthesize botaoPesquisaRadio;
@synthesize estadoRadioPicker;
@synthesize cidadeRadioPicker;
@synthesize nomeRadioPicker;
@synthesize programaRadioPicker;
@synthesize cidadeBotaoOKRd;
@synthesize estadoBotaoOKRd;
@synthesize radioBotaoOKRd;
@synthesize programaBotaoOKRd;
@synthesize ampulhetaRd;
@synthesize detalheProgramaRd;
@synthesize detalheMneuRd;
@synthesize detalheHoraIniRd;
@synthesize detalheHoraFimRd;
@synthesize detalheCusto30Rd;
@synthesize detalheSemanaRd;
@synthesize detalheDataTabRd;

//NSInteger pickerLinhaSelecionada = 0;
NSString  *cidadeRadioSelecionada;
NSString  *estadoRadioSelecionado;
NSString  *programaRadioSelecionado;
NSString  *nomeRadioSelecionada;


- (IBAction)mostraEstadoRadioPicker:(id)sender {
    estadoRadioPicker.hidden      =   NO;
    
    cidadeRadioPicker.hidden      =  YES;
    lbCidadeRadio.hidden          =  YES;
    cidadeBotaoOKRd.hidden        =  YES;
    cidadeRadio.text              =  @"";
    cidadeRadio.hidden            =  YES;
    
    nomeRadioPicker.hidden        =  YES;
    lbNomeRadio.hidden            =  YES;
    radioBotaoOKRd.hidden         =  YES;
    nomeRadio.text                =  @"";
    nomeRadio.hidden              =  YES;
    
    programaRadioPicker.hidden    =  YES;
    lbProgramaRadio.hidden        =  YES;
    programaBotaoOKRd.hidden      =  YES;
    programaRadio.text            =  @"";
    programaRadio.hidden          =  YES;
    
    botaoPesquisaRadio.hidden     =  YES;
    
}



- (IBAction)mostraCidadeRadioPicker:(id)sender {
    cidadeRadioPicker.hidden      =   NO;
    
    nomeRadioPicker.hidden        =  YES;
    lbNomeRadio.hidden            =  YES;
    radioBotaoOKRd.hidden         =  YES;
    nomeRadio.text                =  @"";
    nomeRadio.hidden              =  YES;
    
    programaRadioPicker.hidden    =  YES;
    lbProgramaRadio.hidden        =  YES;
    programaBotaoOKRd.hidden      =  YES;
    programaRadio.text            =  @"";
    programaRadio.hidden          =  YES;
    
    botaoPesquisaRadio.hidden     =  YES;
    
    self.cidadeRadioPicker.delegate = self;
    self.cidadeRadioPicker.dataSource = self;
    [self.cidadeRadioPicker reloadAllComponents];
}

- (IBAction)mostraNomeRadioPicker:(id)sender {
    nomeRadioPicker.hidden        =   NO;
    
    programaRadioPicker.hidden    =  YES;
    lbProgramaRadio.hidden        =  YES;
    programaBotaoOKRd.hidden      =  YES;
    programaRadio.text            =  @"";
    programaRadio.hidden          =  YES;
    
    botaoPesquisaRadio.hidden     =  YES;
    
    self.nomeRadioPicker.delegate = self;
    self.nomeRadioPicker.dataSource = self;
    [self.nomeRadioPicker reloadAllComponents];
    
}

- (IBAction)mostraProgramaRadioPicker:(id)sender {
    programaRadioPicker.hidden    =   NO;
    botaoPesquisaRadio.hidden     =  YES;

    self.programaRadioPicker.delegate = self;
    self.programaRadioPicker.dataSource = self;
    [self.programaRadioPicker reloadAllComponents];
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger numeroDeColunas = 0;
    
    if ([pickerView isEqual:estadoRadioPicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:cidadeRadioPicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:nomeRadioPicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:programaRadioPicker]){
        numeroDeColunas = 1;
    }
    
    return numeroDeColunas;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger pickerCount = 0;
    
    if ([pickerView isEqual:estadoRadioPicker]){
        pickerCount = [estadoRdCollection count];
    }
    if ([pickerView isEqual:cidadeRadioPicker]){
        pickerCount = [cidadeRdCollection count];
    }
    if ([pickerView isEqual: nomeRadioPicker]){
        pickerCount = [radioCollection count];
    }
    if ([pickerView isEqual: programaRadioPicker]){
        pickerCount = [programaRadioCollection count];
    }
    
    return pickerCount;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *pickerRow;
    
    if ([pickerView isEqual:estadoRadioPicker]){
        pickerRow = [estadoRdCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:cidadeRadioPicker]){
        pickerRow = [cidadeRdCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:nomeRadioPicker]){
        pickerRow = [radioCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:programaRadioPicker]){
        pickerRow = [programaRadioCollection objectAtIndex:row];
    }
    
    return pickerRow;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ([pickerView isEqual:estadoRadioPicker]){
        [estadoRadio setText:[estadoRdCollection objectAtIndex:row]];
    }
    if ([pickerView isEqual:cidadeRadioPicker]){
        [cidadeRadio setText:[cidadeRdCollection objectAtIndex:row]];
        cidadeRadioSelecionada = [cidadeListaValoresRd objectAtIndex:row];
    }
    if ([pickerView isEqual:nomeRadioPicker]){
        [nomeRadio setText:[radioCollection objectAtIndex:row]];
        nomeRadioSelecionada   = [radioListaValoresRd objectAtIndex:row];
    }
    if ([pickerView isEqual:programaRadioPicker]){
        [programaRadio setText:[programaRadioCollection objectAtIndex:row]];
         programaRadioSelecionado = [programaListaValoresRd objectAtIndex:row];
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    ampulhetaRd.hidden   = YES;
    // Do any additional setup after loading the view.
    UIView* dummyView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    estadoRadio.inputView       = dummyView;
    cidadeRadio.inputView       = dummyView;
    nomeRadio.inputView         = dummyView;
    programaRadio.inputView     = dummyView;

    estadoRadioPicker.hidden      =  YES;
    
    cidadeRadioPicker.hidden      =  YES;
    lbCidadeRadio.hidden          =  YES;
    cidadeBotaoOKRd.hidden        =  YES;
    cidadeRadio.text              =  @"";
    cidadeRadio.hidden            =  YES;
    
    nomeRadioPicker.hidden        =  YES;
    lbNomeRadio.hidden            =  YES;
    radioBotaoOKRd.hidden         =  YES;
    nomeRadio.text                =  @"";
    nomeRadio.hidden              =  YES;
    
    programaRadioPicker.hidden    =  YES;
    lbProgramaRadio.hidden        =  YES;
    programaBotaoOKRd.hidden      =  YES;
    programaRadio.text            =  @"";
    programaRadio.hidden          =  YES;
    
    botaoPesquisaRadio.hidden     =  YES;
    
    estadoRdCollection =  [[NSArray alloc]initWithObjects:@"AC",@"AL",@"AP",@"AM",@"BA",@"CE",@"DF",@"ES",@"GO",@"MA",@"MT",@"MS",@"MG",@"PA",@"PB",@"PR",@"PE",@"PI",@"RN",@"RS",@"RJ",@"RO",@"RR",@"SC",@"SP",@"SE",@"TO", nil, nil];
    
}

-(void)alerta:(NSString *)mensagem{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message:mensagem delegate:self cancelButtonTitle:@"Fechar" otherButtonTitles:nil, nil];
    [alert show];
    return;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)mostraCampoCidadeRd:(id)sender {
    ampulhetaRd.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([estadoRadio.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Estado'."];
    }else{
        [self filtroCidades:estadoRadio.text];
        lbCidadeRadio.hidden       =  NO;
        cidadeRadio.hidden         =  NO;
        cidadeBotaoOKRd.hidden     =  NO;
        estadoRadioPicker.hidden   = YES;
    }
    [ampulhetaRd stopAnimating];
    ampulhetaRd.hidden = YES;
    
}

- (IBAction)mostraCampoRadioRd:(id)sender {
    ampulhetaRd.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([cidadeRadio.text isEqualToString:@""]){
        [self alerta:@"Selecione uma 'Cidade'."];
    }else{
        [self filtroRadios:cidadeRadioSelecionada];
        lbNomeRadio.hidden         =  NO;
        nomeRadio.hidden           =  NO;
        radioBotaoOKRd.hidden      =  NO;
        cidadeRadioPicker.hidden   = YES;
    }
    [ampulhetaRd stopAnimating];
    ampulhetaRd.hidden = YES;
    
}

- (IBAction)mostraCampoProgramaRd:(id)sender {
    ampulhetaRd.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([nomeRadio.text isEqualToString:@""]){
        [self alerta:@"Selecione uma 'Rádio'."];
    }else{
        [self filtroProgramas:nomeRadioSelecionada];
        lbProgramaRadio.hidden      =  NO;
        programaRadio.hidden        =  NO;
        programaBotaoOKRd.hidden    =  NO;
        nomeRadioPicker.hidden      = YES;
    }
    [ampulhetaRd stopAnimating];
    ampulhetaRd.hidden = YES;
    
}


- (IBAction)mostraBotaoPesquisaRd:(id)sender {
    ampulhetaRd.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    if ([programaRadio.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Programa'."];
    }else{
        [self mostraDetalheRadioPreco:programaRadioSelecionado:nomeRadioSelecionada];
        botaoPesquisaRadio.hidden = NO;
        programaRadioPicker.hidden = YES;
    }
    [ampulhetaRd stopAnimating];
    ampulhetaRd.hidden = YES;
}
 

- (IBAction)botaoPesquisaRdOnClick:(id)sender {
    ampulhetaRd.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetalheRadioViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Detalhe-Radio"];
    
    form.nomeProgramaRadioString = detalheProgramaRd;
    form.mneuRadioString         = detalheMneuRd;
    form.horaIniRadioString      = detalheHoraIniRd;
    form.horaFimRadioString      = detalheHoraFimRd;
    form.semanaRadioString       = detalheSemanaRd;
    form.custo30RadioString      = detalheCusto30Rd;
    form.dataTabelaRadioString   = detalheDataTabRd;
    
    [ampulhetaRd stopAnimating];
    ampulhetaRd.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
}


-(void)filtroCidades:(NSString *)uf{
    RadioDAO *dao = [RadioDAO new];
    BOOL requestOK = [dao requestSOAPXMLCidadeRd:uf];
    
    if(requestOK == YES){
        cidadeRdCollection    = NULL;
        cidadeListaValoresRd  = NULL;
        cidadeRdCollection    = [[NSArray alloc]initWithArray: dao.cidadeListaNomesRd];
        cidadeListaValoresRd  = [[NSArray alloc]initWithArray: dao.cidadeListaParametroRd];
    }
}

-(void)filtroRadios:(NSString *)cidadeRd{
    RadioDAO *dao = [RadioDAO new];
    BOOL requestOK = [dao requestSOAPXMLRadioRd:cidadeRd];
    
    if(requestOK == YES){
        radioCollection       = NULL;
        radioListaValoresRd   = NULL;
        radioCollection       = [[NSArray alloc]initWithArray: dao.radiosListaNomesRd];
        radioListaValoresRd   = [[NSArray alloc]initWithArray: dao.radiosListaParametroRd];
    }
}

-(void)filtroProgramas:(NSString *)numRadioRd{
    RadioDAO *dao = [RadioDAO new];
    BOOL requestOK = [dao requestSOAPXMLProgramaRd:numRadioRd];
    
    if(requestOK == YES){
        programaRadioCollection  = NULL;
        programaListaValoresRd   = NULL;
        programaRadioCollection  = [[NSArray alloc]initWithArray: dao.programasListaNomesRd];
        programaListaValoresRd   = [[NSArray alloc]initWithArray: dao.programasListaParametroRd];
    }
}

-(void)mostraDetalheRadioPreco:(NSString *)numProgRd:(NSString *)numRadioRd{
    RadioDAO *dao = [RadioDAO new];
    BOOL requestOK = [dao requestSOAPXMLDetetalheRd:numProgRd:numRadioRd];
    
    if(requestOK == YES){
        detalheProgramaRd = [dao detalheNomeProgramaRd];
        detalheMneuRd     = [dao detalheMneumonicoRd];
        detalheHoraIniRd  = [dao detalheHoraIniRd];
        detalheHoraFimRd  = [dao detalheHoraFimRd];
        detalheSemanaRd   = [dao detalheSemanaRd];
        detalheCusto30Rd  = [dao detalheCusto30Rd];
        detalheDataTabRd  = [dao detalheDataTabelaRd];
    }
}

- (void) threadStartAnimating {
    [ampulhetaRd setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulhetaRd];
    [ampulhetaRd startAnimating];
}



@end












