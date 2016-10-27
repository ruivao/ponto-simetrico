//
//  TableViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 09/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuPrincipalTableViewController : UITableViewController{
    
    
}

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *ampulhetaMenuTabela;
@property (strong, nonatomic) NSMutableArray *valores;
@property (strong, nonatomic) NSMutableArray *imagens;

@property (strong, nonatomic) NSMutableArray *midiasNomesParametros;
@property (strong, nonatomic) NSMutableArray *midiasValoresParametros;

@end
