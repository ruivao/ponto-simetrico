//
//  JornalPagina2ViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 03/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "JornalPagina2ViewController.h"
#import "DetalheJornalViewController.h"
#import "JornalDAO.h"

@interface JornalPagina2ViewController ()

@end

@implementation JornalPagina2ViewController

@synthesize detalheCidadeJr;
@synthesize detalheMnemJr;
@synthesize detalheJornalJr;
@synthesize detalheRepresJr;
@synthesize detalhePosJr;
@synthesize detalheRetrancaJr;
@synthesize detalheCorJr;
@synthesize detalhePrecoDomJr;
@synthesize detalhePrecoSegJr;
@synthesize detalhePrecoTerJr;
@synthesize detalhePrecoQuaJr;
@synthesize detalhePrecoQuiJr;
@synthesize detalhePrecoSexJr;
@synthesize detalhePrecoSabJr;
@synthesize detalheDataTabJr;
@synthesize retrancaPickerJr;
@synthesize corPickerJr;
@synthesize retrancaJornal;
@synthesize corJornal;
@synthesize ampulhetaJr2;
@synthesize lbCorJornal;
@synthesize botaoOKCorJr;
@synthesize botaoPesquisaJr;


//NSInteger pickerLinhaSelecionada = 0;
NSString  *retrancaSelecionadaJr2;
NSString  *corSelecionadaJr2;



- (IBAction)mostraRetrancaPicker:(id)sender {
    retrancaPickerJr.hidden   =   NO;
    
    lbCorJornal.hidden        =  YES;
    corPickerJr.hidden        =  YES;
    corJornal.hidden          =  YES;
    corJornal.text            =  @"";
    botaoOKCorJr.hidden       =  YES;
    botaoPesquisaJr.hidden    =  YES;

    self.retrancaPickerJr.delegate = self;
    self.retrancaPickerJr.dataSource = self;
    [self.retrancaPickerJr reloadAllComponents];
}

- (IBAction)mostraCorPicker:(id)sender {
    corPickerJr.hidden        =   NO;
    retrancaPickerJr.hidden   =  YES;
    botaoPesquisaJr.hidden    =  YES;

    self.corPickerJr.delegate = self;
    self.corPickerJr.dataSource = self;
    [self.corPickerJr reloadAllComponents];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger numeroDeColunas = 0;
    
    if ([pickerView isEqual:retrancaPickerJr]){
        numeroDeColunas = 1;
    }
    if ([pickerView isEqual:corPickerJr]){
        numeroDeColunas = 1;
    }
    
    return numeroDeColunas;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger pickerCount = 0;
    
    if ([pickerView isEqual:retrancaPickerJr]){
        pickerCount = [retrancaCollectionJr count];
    }
    if ([pickerView isEqual:corPickerJr]){
        pickerCount = [corCollectionJr count];
    }
    
    return pickerCount;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *pickerRow;
    
    if ([pickerView isEqual:retrancaPickerJr]){
        pickerRow = [retrancaCollectionJr objectAtIndex:row];
    }
    if ([pickerView isEqual:corPickerJr]){
        pickerRow = [corCollectionJr objectAtIndex:row];
    }
    
    return pickerRow;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ([pickerView isEqual:retrancaPickerJr]){
        [retrancaJornal setText:[retrancaCollectionJr objectAtIndex:row]];
        retrancaSelecionadaJr2 = [retrancaListaValoresJr objectAtIndex:row];
    }
    if ([pickerView isEqual:corPickerJr]){
        [corJornal setText:[corCollectionJr objectAtIndex:row]];
        corSelecionadaJr2 = [corListaValoresJr objectAtIndex:row];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    ampulhetaJr2.hidden     =  YES;
    // Do any additional setup after loading the view.
    UIView* dummyView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    retrancaJornal.inputView    = dummyView;
    corJornal.inputView         = dummyView;
    
    lbCorJornal.hidden          =  YES;
    botaoOKCorJr.hidden         =  YES;
    corJornal.hidden            =  YES;
    corPickerJr.hidden          =  YES;
    retrancaPickerJr.hidden     =  YES;
    
    botaoPesquisaJr.hidden      =  YES;
    [self filtroRetranca:_jornalSelect :_posicaoSelect];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mostraCampoCor:(id)sender {
    ampulhetaJr2.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    [self filtroCorJornal:_jornalSelect:retrancaSelecionadaJr2];
    lbCorJornal.hidden      =   NO;
    corJornal.hidden        =   NO;
    botaoOKCorJr.hidden     =   NO;
    retrancaPickerJr.hidden =  YES;
    botaoPesquisaJr.hidden  =  YES;

    [ampulhetaJr2 stopAnimating];
    ampulhetaJr2.hidden     =  YES;
}

- (IBAction)mostraBotaoPesquisa:(id)sender {
    ampulhetaJr2.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    corPickerJr.hidden     =  YES;
    botaoPesquisaJr.hidden =   NO;
    [self filtroDetalheJornal:_jornalSelect :_posicaoSelect:corSelecionadaJr2];
    [ampulhetaJr2 stopAnimating];
    ampulhetaJr2.hidden     =  YES;
}

- (IBAction)botaoPesquisaClick:(id)sender {
    ampulhetaJr2.hidden = NO;
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetalheJornalViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Detalhe-Jornal"];
    
    form.estadoCidadeJornal          = [[_estadoSelect stringByAppendingString:@" - "] stringByAppendingString:_cideadeSelect];
    form.mnemJornal                  = detalheMnemJr;
    form.nomeJornal                  = _nomeJornalSelect;
    form.nomeRepresentanteJornal     = detalheRepresJr;
    form.posicaoJornal               = detalhePosJr;
    form.retrancaJornal              = detalheRetrancaJr;
    form.corJornal                   = detalheCorJr;
    form.custoDom                    = detalhePrecoDomJr;
    form.custoSeg                    = detalhePrecoSegJr;
    form.custoTer                    = detalhePrecoTerJr;
    form.custoQua                    = detalhePrecoQuaJr;
    form.custoQui                    = detalhePrecoQuiJr;
    form.custoSex                    = detalhePrecoSexJr;
    form.custoSab                    = detalhePrecoSabJr;
    form.dataTabelaJornal            = detalheDataTabJr;
    
    [ampulhetaJr2 stopAnimating];
    ampulhetaJr2.hidden = YES;
    [self.navigationController pushViewController:form animated:YES];
}


-(void)filtroRetranca:(NSString *)mnemJr:(NSString *)numPosicao{
    JornalDAO *dao = [JornalDAO new];
    BOOL requestOK = [dao requestSOAPXMLRetrancaJr:mnemJr:numPosicao];
    
    if(requestOK == YES){
        retrancaCollectionJr      = NULL;
        retrancaListaValoresJr    = NULL;
        retrancaCollectionJr      = [[NSArray alloc]initWithArray: dao.retrancaListaNomesJr];
        retrancaListaValoresJr    = [[NSArray alloc]initWithArray: dao.retrancaListaParametroJr];
    }
}

-(void)filtroCorJornal:(NSString *)mnemCorJr:(NSString *)valorRetranca{
    JornalDAO *dao = [JornalDAO new];
    BOOL requestOK = [dao requestSOAPXMLCorJr:mnemCorJr:valorRetranca];
    
    if(requestOK == YES){
        corCollectionJr      = NULL;
        corListaValoresJr    = NULL;
        corCollectionJr      = [[NSArray alloc]initWithArray: dao.corListaNomesJr];
        corListaValoresJr    = [[NSArray alloc]initWithArray: dao.corListaParametroJr];
    }
}

-(void)filtroDetalheJornal:(NSString *)nomeMnemJr:(NSString *)numPosicaoJr:(NSString *)numRetrancaJr{
    JornalDAO *dao = [JornalDAO new];
    BOOL requestOK = [dao requestSOAPXMLDetalheJr:nomeMnemJr :numPosicaoJr :numRetrancaJr];
    
    if(requestOK == YES){
        detalheCidadeJr      =  [dao detalheNomeCidadeJr];
        detalheMnemJr        =  [dao detalheMnemJr];
        detalheJornalJr      =  [dao detalheNomeJornalJr];
        detalheRepresJr      =  [dao detalheNomeRepresJr];
        detalhePosJr         =  [dao detalhePosJr];
        detalheCorJr         =  [dao detalheCorJr];
        detalheRetrancaJr    =  [dao detalheNomeRetrancaJr];
        detalhePrecoDomJr    =  [dao detalhePrecoDomJr];
        detalhePrecoSegJr    =  [dao detalhePrecoSegJr];
        detalhePrecoTerJr    =  [dao detalhePrecoTerJr];
        detalhePrecoQuaJr    =  [dao detalhePrecoQuaJr];
        detalhePrecoQuiJr    =  [dao detalhePrecoQuiJr];
        detalhePrecoSexJr    =  [dao detalhePrecoSexJr];
        detalhePrecoSabJr    =  [dao detalhePrecoSabJr];
        detalheDataTabJr     =  [dao detalheDataTabJr];
    }
}

- (void) threadStartAnimating {
    [ampulhetaJr2 setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulhetaJr2];
    [ampulhetaJr2 startAnimating];
}

@end
