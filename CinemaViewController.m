//
//  CinemaViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 02/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "CinemaViewController.h"
#import "DetalheCinemaViewController.h"
#import "CinemaDAO.h"

@interface CinemaViewController ()

@end

@implementation CinemaViewController

@synthesize estado;
@synthesize estadoPicker;
@synthesize cidade;
@synthesize cidadePicker;
@synthesize salaPicker;
@synthesize sala;
@synthesize programaPicker;
@synthesize programa;
@synthesize labelSala;
@synthesize labelCidade;
@synthesize labelprograma;
@synthesize buttonPesquisa;
@synthesize buttonOKSala;
@synthesize buttonOKCidade;
@synthesize buttonOKEstado;
@synthesize buttonOKPrograma;
@synthesize ampulheta;

//NSInteger pickerLinhaSelecionada = 0;
NSString  *siglaCidadeSelecionada;
NSString  *numSalaSelecionada;
NSString  *numProgramaSelecionado;
NSString  *nomeRepr;
NSString  *nomeExib;
NSString  *semana;
NSString  *custo30;
NSString  *dataTabela;

-(IBAction)estadoPickerShow:(id)sender{
    estadoPicker.hidden     =  NO;
    cidadePicker.hidden     = YES;
    salaPicker.hidden       = YES;
    programaPicker.hidden   = YES;
    buttonOKEstado.hidden   =  NO;
    
    labelCidade.hidden      = YES;
    cidade.hidden           = YES;
    buttonOKCidade.hidden   = YES;
    cidade.text             = @"";
    
    labelSala.hidden        = YES;
    sala.hidden             = YES;
    buttonOKSala.hidden     = YES;
    sala.text               = @"";
    
    labelprograma.hidden    = YES;
    programa.hidden         = YES;
    programa.text           = @"";
    buttonPesquisa.hidden   = YES;
}

-(IBAction)cidadePickerShow:(id)sender{
    estadoPicker.hidden     = YES;
    cidadePicker.hidden     =  NO;
    salaPicker.hidden       = YES;
    programaPicker.hidden   = YES;
    buttonOKCidade.hidden   =  NO;
    
    self.cidadePicker.delegate = self;
    self.cidadePicker.dataSource = self;
    [self.cidadePicker reloadAllComponents];

    labelSala.hidden        = YES;
    sala.hidden             = YES;
    buttonOKSala.hidden     = YES;
    sala.text               = @"";
    
    labelprograma.hidden    = YES;
    programa.hidden         = YES;
    buttonOKPrograma.hidden = YES;
    programa.text           = @"";
    buttonPesquisa.hidden   = YES;

}

-(IBAction)salaPickerShow:(id)sender{
    estadoPicker.hidden     = YES;
    cidadePicker.hidden     = YES;
    salaPicker.hidden       =  NO;
    programaPicker.hidden   = YES;
    buttonOKSala.hidden     =  NO;
    
    self.salaPicker.delegate = self;
    self.salaPicker.dataSource = self;
    [self.salaPicker reloadAllComponents];

    labelprograma.hidden    = YES;
    programa.hidden         = YES;
    buttonOKPrograma.hidden = YES;
    programa.text           = @"";
    buttonPesquisa.hidden   = YES;
}

-(IBAction)programaPickerShow:(id)sender{
    estadoPicker.hidden     = YES;
    cidadePicker.hidden     = YES;
    salaPicker.hidden       = YES;
    programaPicker.hidden   =  NO;
    buttonOKPrograma.hidden =  NO;

    self.programaPicker.delegate = self;
    self.programaPicker.dataSource = self;
    [self.programaPicker reloadAllComponents];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
   NSInteger numeroDeColunas = 0;

    if ([pickerView isEqual:estadoPicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:cidadePicker]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:salaPicker]){
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
    
    if ([pickerView isEqual:estadoPicker]){
        pickerCount = [estadoCollection count];
    }
    if ([pickerView isEqual:cidadePicker]){
        pickerCount = [cidadeCollection count];
    }
    if ([pickerView isEqual: salaPicker]){
        pickerCount = [salaCollection count];
    }
    if ([pickerView isEqual: programaPicker]){
        pickerCount = [programaCollection count];
    }
    
    return pickerCount;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *pickerRow;
    
    if ([pickerView isEqual:estadoPicker]){
        pickerRow = [estadoCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:cidadePicker]){
        pickerRow = [cidadeCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:programaPicker]){
        pickerRow = [programaCollection objectAtIndex:row];
    }
    if ([pickerView isEqual:salaPicker]){
        pickerRow = [salaCollection objectAtIndex:row];
    }

    return pickerRow;

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ([pickerView isEqual:estadoPicker]){
        [estado setText:[estadoCollection objectAtIndex:row]];
    }
    if ([pickerView isEqual:cidadePicker]){
        [cidade setText:[cidadeCollection objectAtIndex:row]];
        siglaCidadeSelecionada = [siglas objectAtIndex:row];
    }
    if ([pickerView isEqual:salaPicker]){
        [sala setText:[salaCollection objectAtIndex:row]];
        numSalaSelecionada     = [salas objectAtIndex:row];
    }
    if ([pickerView isEqual:programaPicker]){
        [programa setText:[programaCollection objectAtIndex:row]];
         numProgramaSelecionado = [programas objectAtIndex:row];
    }
}


-(IBAction)mostraCampoCidade:(id)sender{
    ampulheta.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    if ([estado.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Estado'."];
    }else{
        [self filtroCidades:estado.text];
        labelCidade.hidden    =  NO;
        cidade.hidden         =  NO;
        buttonOKEstado.hidden =  NO;
        estadoPicker.hidden   = YES;
    }
    [ampulheta stopAnimating];
    ampulheta.hidden = YES;
}


-(IBAction)mostraCampoSala:(id)sender{
    ampulheta.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];

    if ([cidade.text isEqualToString:@""]){
        [self alerta:@"Selecione uma 'Cidade'."];
    }else{
        [self filtroSalas:siglaCidadeSelecionada];
        labelSala.hidden      =  NO;
        sala.hidden           =  NO;
        cidadePicker.hidden   = YES;
    }
    [ampulheta stopAnimating];
    ampulheta.hidden = YES;
}

-(IBAction)mostraCampoPrograma:(id)sender{
    ampulheta.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];

    if ([sala.text isEqualToString:@""]){
        [self alerta:@"Selecione uma 'Sala'."];
    }else{
        [self filtroProgramas:numSalaSelecionada];
        labelprograma.hidden  =  NO;
        programa.hidden       =  NO;
        salaPicker.hidden     = YES;
    }
    [ampulheta stopAnimating];
    ampulheta.hidden = YES;
}

-(IBAction)mostraBotaoPesquisa:(id)sender{
    ampulheta.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    if ([programa.text isEqualToString:@""]){
        [self alerta:@"Selecione um 'Programa'."];
    }else{
        [self mostraDetalheCinemaPreco:numSalaSelecionada :numProgramaSelecionado];
        buttonPesquisa.hidden = NO;
        programaPicker.hidden = YES;
    }
    [ampulheta stopAnimating];
    ampulheta.hidden = YES;
}

-(IBAction)pesquisaButtonClick:(id)sender{
    ampulheta.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetalheCinemaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Detalhe-Cinema"];
    form.nomeExibString = nomeExib;
    form.nomeReprString = nomeRepr;
    form.semanaString   = semana;
    form.custo30String  = custo30;
    form.dtTabelaString = dataTabela;
    [ampulheta stopAnimating];
    ampulheta.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];

}

-(void)alerta:(NSString *)mensagem{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alerta!" message:mensagem delegate:self cancelButtonTitle:@"Fechar" otherButtonTitles:nil, nil];
    [alert show];
    return;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ampulheta.hidden = YES;
    UIView* dummyView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    estado.inputView       = dummyView;
    cidade.inputView       = dummyView;
    sala.inputView         = dummyView;
    programa.inputView     = dummyView;
    
    estadoPicker.hidden     = YES;
    cidadePicker.hidden     = YES;
    salaPicker.hidden       = YES;
    programaPicker.hidden   = YES;
    buttonPesquisa.hidden   = YES;
    buttonOKSala.hidden     = YES;
    buttonOKPrograma.hidden = YES;
    buttonOKCidade.hidden   = YES;
    buttonOKEstado.hidden   = YES;
    
    labelCidade.hidden      = YES;
    cidade.hidden           = YES;
    
    labelSala.hidden        = YES;
    sala.hidden             = YES;
    
    labelprograma.hidden    = YES;
    programa.hidden         = YES;
    
    estadoCollection      =  [[NSArray alloc]initWithObjects:@"AC",@"AL",@"AP",@"AM",@"BA",@"CE",@"DF",@"ES",@"GO",@"MA",@"MT",@"MS",@"MG",@"PA",@"PB",@"PR",@"PE",@"PI",@"RN",@"RS",@"RJ",@"RO",@"RR",@"SC",@"SP",@"SE",@"TO", nil, nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)filtroCidades:(NSString *)uf{
    CinemaDAO *dao = [CinemaDAO new];
    BOOL requestOK = [dao requestSOAPXMLCin:uf];
    
    if(requestOK == YES){
        cidadeCollection = NULL;
        siglas           = NULL;
        cidadeCollection = [[NSArray alloc]initWithArray: dao.cidadesListaCin];
        siglas           = [[NSArray alloc]initWithArray: dao.siglasListaCin];
    }
}

-(void)filtroSalas:(NSString *)siglaCidade{
    CinemaDAO *dao = [CinemaDAO new];
    BOOL requestOK = [dao requestSOAPXMLSala:siglaCidade];
    
    if(requestOK == YES){
        salaCollection   = NULL;
        salas            = NULL;
        salaCollection   = [[NSArray alloc]initWithArray: dao.salasNomesCin];
        salas            = [[NSArray alloc]initWithArray: dao.salasValorCin];
    }
}

-(void)filtroProgramas:(NSString *)numSala{
    
    CinemaDAO *dao = [CinemaDAO new];
    BOOL requestOK = [dao requestSOAPXMLProg:numSala];
    
    if(requestOK == YES){
        programaCollection   = NULL;
        programas            = NULL;
        programaCollection   = [[NSArray alloc]initWithArray: dao.programaNomes];
        programas            = [[NSArray alloc]initWithArray: dao.programaValor];
        salas                = [[NSArray alloc]initWithArray: dao.salasValorCin];
    }
}

-(void)mostraDetalheCinemaPreco:(NSString *)numSala:(NSString *)valor{
    CinemaDAO *dao = [CinemaDAO new];
    BOOL requestOK = [dao requestSOAPXMLDetCin:numSala :valor];
    
    if(requestOK == YES){
       nomeExib   = [dao detalheNomeExibCin];
       nomeRepr   = [dao detalheNomeReprCin];
       semana     = [dao detalheSemanaCin];
       custo30    = [dao detalheCusto30Cin];
       dataTabela = [dao detalheDataTabCin];
    }
}

- (void) threadStartAnimating {
    [ampulheta setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulheta];
    [ampulheta startAnimating];
}

@end















