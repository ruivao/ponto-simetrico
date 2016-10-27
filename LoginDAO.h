//
//  LoginDAO.h
//  Consulta Midia
//
//  Created by Rodrigo Pinheiro Moreira on 28/04/16.
//  Copyright © 2016 Jovedata. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LoginDAO : NSObject{
    

}

@property (strong, nonatomic) NSMutableData *webResponseData;
@property (strong, nonatomic) NSMutableData *webData;
@property  BOOL                              login;
@property (strong, nonatomic) NSMutableArray  *midiasNomes;
@property (strong, nonatomic) NSMutableArray  *midiasValores;

-(BOOL)requestSOAPXML:(NSString*)user:(NSString*)senha;
-(void)erro:(NSString *)mensagem;

@end
