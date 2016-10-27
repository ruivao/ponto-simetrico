//
//  SobreViewController.m
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 16/06/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import "SobreViewController.h"

@interface SobreViewController ()

@end

@implementation SobreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)mapaJove:(id)sender{
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:@"http://maps.apple.com/?q=-23.5737756,-46.6256656"]];
    
 }

/*
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
