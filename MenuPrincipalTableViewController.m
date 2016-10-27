//
//  TableViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 09/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "MenuPrincipalTableViewController.h"
#import "CinemaViewController.h"
#import "TelevisaoViewController.h"
#import "RadioViewController.h"
#import "RevistaViewController.h"
#import "JornalViewController.h"
#import "InternetViewController.h"

@interface MenuPrincipalTableViewController ()

@end

@implementation MenuPrincipalTableViewController

@synthesize ampulhetaMenuTabela;
@synthesize valores;
@synthesize imagens;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    ampulhetaMenuTabela.hidden   = YES;
    [self.navigationItem setHidesBackButton:YES];
    
    UIImage      *midiaCinema    = [UIImage imageNamed:@"cnVeic.png"];
    UIImage      *midiaInternet  = [UIImage imageNamed:@"inVeic.png"];
    UIImage      *midiaTelevisao = [UIImage imageNamed:@"tvVeic.png"];
    UIImage      *midiaRevista   = [UIImage imageNamed:@"rvVeic.png"];
    UIImage      *midiaRadio     = [UIImage imageNamed:@"rdVeic.png"];
    UIImage      *midiaJornal    = [UIImage imageNamed:@"jrVeic.png"];
    CGSize        imageSize;
    NSInteger     i = 0;
    
    CGFloat largura = 90;
    CGFloat altura =  30;
    imageSize = CGSizeMake(largura, altura);
    
    UIGraphicsBeginImageContext( imageSize );
    [midiaCinema    drawInRect:CGRectMake(0,0,imageSize.width,imageSize.height)];
    midiaCinema     = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext( imageSize );
    [midiaInternet  drawInRect:CGRectMake(0,0,imageSize.width,imageSize.height)];
    midiaInternet   = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    UIGraphicsBeginImageContext( imageSize );
    [midiaTelevisao drawInRect:CGRectMake(0,0,imageSize.width,imageSize.height)];
    midiaTelevisao  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext( imageSize );
    [midiaRevista   drawInRect:CGRectMake(0,0,imageSize.width,imageSize.height)];
    midiaRevista    = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext( imageSize );
    [midiaRadio     drawInRect:CGRectMake(0,0,imageSize.width,imageSize.height)];
    midiaRadio      = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext( imageSize );
    [midiaJornal    drawInRect:CGRectMake(0,0,imageSize.width,imageSize.height)];
    midiaJornal     = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
   
    //valores = _midiasNomesParametros;
    
    while(i < _midiasNomesParametros.count){
        if([[_midiasNomesParametros objectAtIndex:i] isEqualToString:@"Cinema"]){
            if(i == 0){
                valores = [[NSMutableArray alloc]initWithObjects:@"Preços de Cinema  ->",nil];
                imagens = [[NSMutableArray alloc]initWithObjects:midiaCinema,nil];
            }else{
                [valores  addObject:@"Preços de Cinema  ->"];
                [imagens  addObject:midiaCinema];
            }
        }
        if([[_midiasNomesParametros objectAtIndex:i] isEqualToString:@"Internet"]){
            if(i == 0){
                valores = [[NSMutableArray alloc]initWithObjects:@"Preços de Internet  ->",nil];
                imagens = [[NSMutableArray alloc]initWithObjects:midiaInternet,nil];
            }else{
                [valores  addObject:@"Preços de Internet  ->"];
                [imagens  addObject:midiaInternet];
            }
        }
        if([[_midiasNomesParametros objectAtIndex:i] isEqualToString:@"TV"]){
            if(i == 0){
                valores = [[NSMutableArray alloc]initWithObjects:@"Preços de TV          ->",nil];
                imagens = [[NSMutableArray alloc]initWithObjects:midiaTelevisao,nil];
            }else{
                [valores  addObject:@"Preços de TV          ->"];
                [imagens  addObject:midiaTelevisao];
            }
        }
        if([[_midiasNomesParametros objectAtIndex:i] isEqualToString:@"Revista"]){
            if(i == 0){
                valores = [[NSMutableArray alloc]initWithObjects:@"Preços de Revistas ->",nil];
                imagens = [[NSMutableArray alloc]initWithObjects:midiaRevista,nil];
            }else{
                [valores  addObject:@"Preços de Revistas ->"];
                [imagens  addObject:midiaRevista];
            }
        }
        if([[_midiasNomesParametros objectAtIndex:i] isEqualToString:@"Radio"]){
            if(i == 0){
                valores = [[NSMutableArray alloc]initWithObjects:@"Preços de Rádio     ->",nil];
                imagens = [[NSMutableArray alloc]initWithObjects:midiaRadio,nil];
            }else{
                [valores  addObject:@"Preços de Rádio     ->"];
                [imagens  addObject:midiaRadio];
            }
        }
        if([[_midiasNomesParametros objectAtIndex:i] isEqualToString:@"Jornal"]){
            if(i == 0){
                valores = [[NSMutableArray alloc]initWithObjects:@"Preços de Jornal     ->",nil];
                imagens = [[NSMutableArray alloc]initWithObjects:midiaJornal,nil];
            }else{
                [valores  addObject:@"Preços de Jornal     ->"];
                [imagens  addObject:midiaJornal];
            }
        }
       ++i;
    }
    
    
    
    /*
    valores = [NSMutableArray arrayWithObjects:
               @"Preços de Cinema  ->",
               @"Preços de Internet  ->",
               @"Preços de TV          ->",
               @"Preços de Revistas ->",
               @"Preços de Rádio     ->",
               @"Preços de Jornal     ->",nil,nil];
    
    imagens = [NSMutableArray arrayWithObjects:
               midiaCinema,
               midiaInternet,
               midiaTelevisao,
               midiaRevista,
               midiaRadio,
               midiaJornal,nil,nil];
    
    */
    
    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [valores count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identificadorSimples = @"Celula";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identificadorSimples forIndexPath:indexPath];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificadorSimples];
    }
    // Configure the cell...
    cell.textLabel.text  = [valores objectAtIndex:indexPath.row];
    cell.imageView.image = [imagens objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // NSLog([valores objectAtIndex:indexPath.row] );
    switch ((indexPath.row)) {
        case 0:{
            if([[valores objectAtIndex:0] isEqualToString:@"Preços de Cinema  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
            
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                CinemaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Cinema"];
            
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:0] isEqualToString:@"Preços de Internet  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                InternetViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Internet"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:0] isEqualToString:@"Preços de TV          ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                TelevisaoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-TV"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:0] isEqualToString:@"Preços de Revistas ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RevistaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Revista"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:0] isEqualToString:@"Preços de Rádio     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RadioViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Radio"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:0] isEqualToString:@"Preços de Jornal     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                JornalViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Jornal"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
        }
            break;
        case 1:{
            if([[valores objectAtIndex:1] isEqualToString:@"Preços de Cinema  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                CinemaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Cinema"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:1] isEqualToString:@"Preços de Internet  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                InternetViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Internet"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:1] isEqualToString:@"Preços de TV          ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                TelevisaoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-TV"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:1] isEqualToString:@"Preços de Revistas ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RevistaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Revista"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:1] isEqualToString:@"Preços de Rádio     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RadioViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Radio"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:1] isEqualToString:@"Preços de Jornal     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                JornalViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Jornal"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
        }
            break;
        case 2:{
            if([[valores objectAtIndex:2] isEqualToString:@"Preços de Cinema  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                CinemaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Cinema"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:2] isEqualToString:@"Preços de Internet  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                InternetViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Internet"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:2] isEqualToString:@"Preços de TV          ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                TelevisaoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-TV"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:2] isEqualToString:@"Preços de Revistas ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RevistaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Revista"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:2] isEqualToString:@"Preços de Rádio     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RadioViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Radio"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:2] isEqualToString:@"Preços de Jornal     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                JornalViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Jornal"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
        }
            break;
        case 3:{
            if([[valores objectAtIndex:3] isEqualToString:@"Preços de Cinema  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                CinemaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Cinema"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:3] isEqualToString:@"Preços de Internet  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                InternetViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Internet"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:3] isEqualToString:@"Preços de TV          ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                TelevisaoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-TV"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:3] isEqualToString:@"Preços de Revistas ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RevistaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Revista"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:3] isEqualToString:@"Preços de Rádio     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RadioViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Radio"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:3] isEqualToString:@"Preços de Jornal     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                JornalViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Jornal"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
        }
            break;
        case 4:{
            if([[valores objectAtIndex:4] isEqualToString:@"Preços de Cinema  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                CinemaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Cinema"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:4] isEqualToString:@"Preços de Internet  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                InternetViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Internet"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:4] isEqualToString:@"Preços de TV          ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                TelevisaoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-TV"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:4] isEqualToString:@"Preços de Revistas ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RevistaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Revista"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:4] isEqualToString:@"Preços de Rádio     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RadioViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Radio"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:4] isEqualToString:@"Preços de Jornal     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                JornalViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Jornal"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
        }
            break;
        case 5:{
            if([[valores objectAtIndex:5] isEqualToString:@"Preços de Cinema  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                CinemaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Cinema"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:5] isEqualToString:@"Preços de Internet  ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                InternetViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Internet"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:5] isEqualToString:@"Preços de TV          ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                TelevisaoViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-TV"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:5] isEqualToString:@"Preços de Revistas ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RevistaViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Revista"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:5] isEqualToString:@"Preços de Rádio     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RadioViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Radio"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
            else if([[valores objectAtIndex:5
                      ] isEqualToString:@"Preços de Jornal     ->"]){
                ampulhetaMenuTabela.hidden = NO;
                [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                JornalViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-Jornal"];
                
                [ampulhetaMenuTabela stopAnimating];
                ampulhetaMenuTabela.hidden = YES;
                [self.navigationController pushViewController:form animated:YES];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void) threadStartAnimating {
    [ampulhetaMenuTabela setCenter:CGPointMake(160,124)];
    [self.view addSubview:ampulhetaMenuTabela];
    [ampulhetaMenuTabela startAnimating];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
