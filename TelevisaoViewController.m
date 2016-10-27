//
//  TelevisaoViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 25/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "TelevisaoViewController.h"
#import "TelevisaoDAO.h"
#import "DetalheTelevisaoViewController.h"

@interface TelevisaoViewController ()

@end

@implementation TelevisaoViewController

@synthesize ampulhetaTV;
@synthesize buttonPesquisaTv;
@synthesize tipoPicker;
@synthesize mercadoPicker;
@synthesize redePicker;
@synthesize programaPicker;
@synthesize lbRedeTv;
@synthesize lbTipoTv;
@synthesize lbMercadoTv;
@synthesize lbProgramaTv;
@synthesize tipoTv;
@synthesize redeTv;
@synthesize mercadoTv;
@synthesize programaTv;
@synthesize buttonOKTipoTv;
@synthesize buttonOKRedeTv;
@synthesize buttonOKMercadoTv;
@synthesize buttonOKProgramaTv;

//NSInteger    pickerLinhaSelecionadaTv = 0;
NSString     *redeTvSelecionada;
NSMutableString     *tipoTvSelecionado;
NSString     *mercadoTvSelecionado;
NSString     *programaTvSelecionado;
NSString     *pracaSelecionada;
NSString     *programaTvParametro;
NSString     *mneumonicoTvParametro;
NSString     *horaIniTvParametro;
NSString     *horaFimTvParametro;
NSString     *semanaTvParametro;
NSString     *custo30TvParametro;
NSString     *dataTabelaTvParametro;

-(IBAction)tipoTvPickerShow:(id)sender{
    tipoPicker.hidden      =     NO;
    buttonOKTipoTv.hidden  =     NO;
    
    lbRedeTv.hidden        =    YES;
    redeTv.hidden          =    YES;
    redePicker.hidden      =    YES;
    redeTv.text            =    @"";
    buttonOKRedeTv.hidden  =    YES;
    
    lbMercadoTv.hidden     =    YES;
    mercadoTv.hidden       =    YES;
    mercadoTv.text         =    @"";
    mercadoPicker.hidden   =    YES;
    buttonOKMercadoTv.hidden =  YES;
    
    lbProgramaTv.hidden    =    YES;
    programaTv.hidden      =    YES;
    programaTv.text        =    @"";
    programaPicker.hidden  =    YES;
    buttonOKProgramaTv.hidden = YES;
    
    buttonPesquisaTv.hidden   = YES;

}

-(IBAction)redeTvPickerShow:(id)sender{
    redePicker.hidden      =     NO;
    buttonOKRedeTv.hidden  =     NO;
    
    lbMercadoTv.hidden     =    YES;
    mercadoTv.hidden       =    YES;
    mercadoTv.text         =    @"";
    mercadoPicker.hidden   =    YES;
    buttonOKMercadoTv.hidden =  YES;
    
    lbProgramaTv.hidden    =    YES;
    programaTv.hidden      =    YES;
    programaTv.text        =    @"";
    programaPicker.hidden  =    YES;
    buttonOKProgramaTv.hidden = YES;
    
    buttonPesquisaTv.hidden   = YES;

    self.redePicker.delegate = self;
    self.redePicker.dataSource = self;
    [self.redePicker reloadAllComponents];
}

-(IBAction)mercadoTvPickerShow:(id)sender{
    mercadoPicker.hidden   =     NO;
    buttonOKMercadoTv.hidden =   NO;
    
    lbProgramaTv.hidden    =    YES;
    programaTv.hidden      =    YES;
    programaTv.text        =    @"";
    programaPicker.hidden  =    YES;
    buttonOKProgramaTv.hidden = YES;
    
    buttonPesquisaTv.hidden   = YES;

    self.mercadoPicker.delegate = self;
    self.mercadoPicker.dataSource = self;
    [self.mercadoPicker reloadAllComponents];
}

-(IBAction)programaTvPickerShow:(id)sender{
    tipoPicker.hidden          =  YES;
    redePicker.hidden          =  YES;
    mercadoPicker.hidden       =  YES;
    programaPicker.hidden      =   NO;
    buttonOKProgramaTv.hidden  =   NO;
    buttonPesquisaTv.hidden    =  YES;
    
    self.programaPicker.delegate = self;
    self.programaPicker.dataSource = self;
    [self.programaPicker reloadAllComponents];

}



// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger numeroDeColunas = 0;
    
    if ([pickerView isEqual:tipoPicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:redePicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:mercadoPicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:programaPicker]){
        numeroDeColunas = 1;
    }
    
    return numeroDeColunas;
}


// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger pickerCount = 0;
    
    if ([pickerView isEqual:tipoPicker]){
        pickerCount = [tipoTVCollection count];
    }
    if ([pickerView isEqual:redePicker]){
        pickerCount = [redeTVCollection count];
    }
    if ([pickerView isEqual: mercadoPicker]){
        pickerCount = [mercadoTVCollection count];
    }
    if ([pickerView isEqual: programaPicker]){
        pickerCount = [programaTVCollection count];
    }
    
    return pickerCount;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *pickerRow;
    
    if ([pickerView isEqual:tipoPicker]){
        pickerRow = [tipoTVCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:redePicker]){
        pickerRow = [redeTVCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:mercadoPicker]){
        pickerRow = [mercadoTVCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:programaPicker]){
        pickerRow = [programaTVCollection objectAtIndex:row];
    }
    
    return pickerRow;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ([pickerView isEqual:tipoPicker]){
        [tipoTv setText:[tipoTVCollection objectAtIndex:row]];
        tipoTvSelecionado = [self pegaValorTipoTv:tipoTv.text];
    }
    if ([pickerView isEqual:redePicker]){
        [redeTv setText:[redeTVCollection objectAtIndex:row]];
        redeTvSelecionada = [redesListaValor objectAtIndex:row];
    }
    if ([pickerView isEqual:mercadoPicker]){
        [mercadoTv setText:[mercadoTVCollection objectAtIndex:row]];
        mercadoTvSelecionado     = [mercadosListaValor objectAtIndex:row];
        pracaSelecionada         = [mercadosListaValor objectAtIndex:row];
    }
    if ([pickerView isEqual:programaPicker]){
        [programaTv setText:[programaTVCollection objectAtIndex:row]];
        programaTvSelecionado = [programasListaValor objectAtIndex:row];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    ampulhetaTV.hidden = YES;
    // Do any additional setup after loading the view.
    UIView* dummyView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    tipoTv.inputView        = dummyView;
    redeTv.inputView        = dummyView;
    mercadoTv.inputView     = dummyView;
    programaTv.inputView    = dummyView;
    
    lbTipoTv.hidden           =  NO;
    tipoTv.hidden             =  NO;
    tipoPicker.hidden         = YES;
    buttonOKTipoTv.hidden     = YES;
    
    lbRedeTv.hidden           = YES;
    redePicker.hidden         = YES;
    redeTv.hidden             = YES;
    buttonOKRedeTv.hidden     = YES;
    
    lbMercadoTv.hidden        = YES;
    mercadoPicker.hidden      = YES;
    mercadoTv.hidden          = YES;
    buttonOKMercadoTv.hidden  = YES;
    
    lbProgramaTv.hidden       = YES;
    programaTv.hidden         = YES;
    programaPicker.hidden     = YES;
    buttonOKProgramaTv.hidden = YES;
    
    buttonPesquisaTv.hidden   = YES;
    
    tipoTVCollection =  [[NSArray alloc]initWithObjects:@"TV-ABERTA",@"TV-FECHADA", nil, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)mostraBotaoPesquisa:(id)sender{
    ampulhetaTV.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    if ([programaTv.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Programa de Tv'."];
    }else{
        [self mostraDetalheTvPreco:programaTvSelecionado:pracaSelecionada:redeTvSelecionada];
        buttonPesquisaTv.hidden = NO;
        programaPicker.hidden = YES;
    }
    [ampulhetaTV stopAnimating];
    ampulhetaTV.hidden = YES;
    
}

-(IBAction)pesquisaButtonClick:(id)sender{
    ampulhetaTV.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetalheTelevisaoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Detalhe-Televisao"];
    
    form.nomeDaProgTvString         =  programaTvParametro;
    form.mneumonicoProgrTvString    =  mneumonicoTvParametro;
    form.semanaTvString             =  semanaTvParametro;
    form.horaInicioTvString         =  horaIniTvParametro;
    form.horaFimTvString            =  horaFimTvParametro;
    form.custo30TvString            =  custo30TvParametro;
    form.dataTabelaTvString         =  dataTabelaTvParametro;
    
    [ampulhetaTV stopAnimating];
    ampulhetaTV.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
    
}


-(void)alerta:(NSString *)mensagem{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message:mensagem delegate:self cancelButtonTitle:@"Fechar" otherButtonTitles:nil, nil];
    [alert show];
    return;
}


-(IBAction)mostraCampoRede:(id)sender{
    ampulhetaTV.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([tipoTv.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Tipo de Tv'."];
    }else{
        [self listaTiposTv:tipoTvSelecionado];
        lbRedeTv.hidden       =  NO;
        redeTv.hidden         =  NO;
        buttonOKRedeTv.hidden =  NO;
        tipoPicker.hidden     = YES;
    }
    [ampulhetaTV stopAnimating];
    ampulhetaTV.hidden = YES;
}


-(IBAction)mostraCampoMercado:(id)sender{
    ampulhetaTV.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    if ([redeTv.text isEqualToString:@""]){
        [self alerta:@"Selecione uma 'Rede de Tv'."];
    }else{
        [self filtroMercado:redeTvSelecionada];
        lbMercadoTv.hidden        =  NO;
        mercadoTv.hidden          =  NO;
        buttonOKMercadoTv.hidden  =  NO;
        redePicker.hidden         = YES;
    }
    [ampulhetaTV stopAnimating];
    ampulhetaTV.hidden = YES;
    
}

-(IBAction)mostraCampoPrograma:(id)sender{
    ampulhetaTV.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    if ([redeTv.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Programa de Tv'."];
    }else{
        [self filtroProgramaTv:redeTvSelecionada :mercadoTvSelecionado];
        lbProgramaTv.hidden        =  NO;
        programaTv.hidden          =  NO;
        buttonOKProgramaTv.hidden  =  NO;
        mercadoPicker.hidden       = YES;
    }
    [ampulhetaTV stopAnimating];
    ampulhetaTV.hidden = YES;
}


-(NSString *)pegaValorTipoTv:(NSString *)tipoTvSelecionadoString{
    NSString *resposta;
    
    if([tipoTvSelecionadoString isEqual: @"TV-ABERTA"])
        resposta = @"1";
    
    if([tipoTvSelecionadoString isEqual: @"TV-FECHADA"])
        resposta = @"2";
    
    return resposta;
}


-(void)listaTiposTv:(NSString *)numTipoTv{
    TelevisaoDAO *daoTv = [TelevisaoDAO new];
    BOOL requestOK = [daoTv requestSOAPXMLTipoTv:numTipoTv];
    
    if(requestOK == YES){
        redeTVCollection = NULL;
        redesListaValor  = NULL;
        redeTVCollection = [[NSArray alloc]initWithArray: daoTv.tipoTvNomes];
        redesListaValor  = [[NSArray alloc]initWithArray: daoTv.tipoTvValor];
    }
}


-(void)filtroMercado:(NSString *)numRede{
    TelevisaoDAO *daoTv = [TelevisaoDAO new];
    BOOL requestOK = [daoTv requestSOAPXMLMercadoTv:numRede];
    
    if(requestOK == YES){
        mercadoTVCollection  = NULL;
        mercadosListaValor   = NULL;
        mercadoTVCollection = [[NSArray alloc]initWithArray: daoTv.mercadoTvNomes];
        mercadosListaValor  = [[NSArray alloc]initWithArray: daoTv.mercadoTvValor];
    }
}


-(void)filtroProgramaTv:(NSString*)numRedeTv:(NSString *)valorProgTv{
    TelevisaoDAO *daoTv = [TelevisaoDAO new];
    BOOL requestOK = [daoTv requestSOAPXMLProgramaTv:numRedeTv:valorProgTv];
    
    if(requestOK == YES){
        programaTVCollection = NULL;
        programasListaValor  = NULL;
        programaTVCollection = [[NSArray alloc]initWithArray: daoTv.programaTvNomes];
        programasListaValor  = [[NSArray alloc]initWithArray: daoTv.programaTvValor];
    }
}


-(void)mostraDetalheTvPreco:(NSString *)numProgTv:(NSString *)pracaTv:(NSString *)siglaRedeTv{
    TelevisaoDAO *daoTv = [TelevisaoDAO new];
    BOOL requestOK = [daoTv requestSOAPXMLDetalheTv:numProgTv:pracaTv:siglaRedeTv];
    
    if(requestOK == YES){
        programaTvParametro      = [daoTv detalheNomeDoProgramaTv];
        mneumonicoTvParametro    = [daoTv detalheMneumonicoTv];
        horaIniTvParametro       = [daoTv detalheHoraInicioTv];
        horaFimTvParametro       = [daoTv detalheHoraFimTv];
        semanaTvParametro        = [daoTv detalheSemanaTv];
        custo30TvParametro       = [daoTv detalheCusto30Tv];
        dataTabelaTvParametro    = [daoTv detalheDataTabTv];
    }
}

- (void) threadStartAnimating {
    [ampulhetaTV setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulhetaTV];
    [ampulhetaTV startAnimating];
}

@end











