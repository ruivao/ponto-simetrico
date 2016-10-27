//
//  LoginViewController.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 05/05/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController{
    NSMutableArray *midiasNomesMenu;
    NSMutableArray *midiasValoresMenu;
}

@property (strong, nonatomic) IBOutlet UITextField *usuario;
@property (strong, nonatomic) IBOutlet UITextField *senha;
@property IBOutlet UIButton *ok;
@property IBOutlet UIActivityIndicatorView *ampulheta;


-(void)mostraTelaDeMenu;

@end
