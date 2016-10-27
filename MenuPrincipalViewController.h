//
//  MenuPrincipalViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 02/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuPrincipalViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *buttonCinema;
@property (strong, nonatomic) IBOutlet UIButton *buttonInternet;
@property (strong, nonatomic) IBOutlet UIButton *buttonTelevisao;
@property (strong, nonatomic) IBOutlet UIButton *buttonRevista;
@property (strong, nonatomic) IBOutlet UIButton *buttonRadio;
@property (strong, nonatomic) IBOutlet UIButton *buttonJornal;

@property IBOutlet UIActivityIndicatorView          *ampulhetaMenu;

-(IBAction)botaoCinemaClick:(id)sender;

@end
