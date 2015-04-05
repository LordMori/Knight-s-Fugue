//
//  Connector.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/27/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "Connector.h"

@implementation Connector

+ (void)customizeBarButton:(UIBarButtonItem*)bbt{
    NSDictionary* barButtonItemAttributes =
    @{NSFontAttributeName:
          [UIFont fontWithName:@"Planewalker" size:20.0f],
      NSForegroundColorAttributeName:
          [UIColor whiteColor]
      };
    [bbt setTitleTextAttributes:barButtonItemAttributes forState:UIControlStateNormal];
}



+ (void)createAlertController:(UIViewController*)vc title:(NSString*)title message:(NSString*)message{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 if(![[NSUserDefaults standardUserDefaults] boolForKey:@"gameSaved"]){
                                     [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"gameSaved"];
                                     [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"savedGame"];
                                 }
                                 [vc.navigationController popToRootViewControllerAnimated:YES];
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                             }];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Continue"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alert addAction:cancel];
    [alert addAction:ok];
    
    [vc presentViewController:alert animated:YES completion:nil];
}

@end
