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
          [UIFont fontWithName:@"Alagard" size:20.0f],
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
  
//    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:title];
//    [titleString addAttribute:NSFontAttributeName
//                  value:[UIFont fontWithName:@"Alagard" size:20]
//                  range:NSMakeRange(0, title.length)];
//    [titleString addAttribute:NSForegroundColorAttributeName
//                  value:[UIColor whiteColor]
//                  range:NSMakeRange(0, title.length)];
//    [alert setValue:titleString forKey:@"attributedTitle"];
//    
//    NSMutableAttributedString *messageString = [[NSMutableAttributedString alloc] initWithString:message];
//    [messageString addAttribute:NSFontAttributeName
//                        value:[UIFont fontWithName:@"Alagard" size:20]
//                        range:NSMakeRange(0, message.length)];
//    [messageString addAttribute:NSForegroundColorAttributeName
//                        value:[UIColor whiteColor]
//                        range:NSMakeRange(0, message.length)];
//    [alert setValue:messageString forKey:@"attributedMessage"];
    
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
    
    UILabel * appearanceLabel = [UILabel appearanceWhenContainedIn:UIAlertController.class, nil];
    [appearanceLabel setAppearanceFont:[UIFont fontWithName:@"Alagard" size:20]];
    
    [alert addAction:cancel];
    [alert addAction:ok];
    UIView *subview = alert.view.subviews.firstObject;
    UIView *alertContentView = subview.subviews.firstObject;
    alertContentView.backgroundColor = [[vc view] tintColor];
    alert.view.backgroundColor = [UIColor clearColor];
    alert.view.tintColor = [UIColor whiteColor];
    
    [vc presentViewController:alert animated:YES completion:nil];
}

@end
