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



+ (void)createCancelAlertController:(UIViewController*)vc title:(NSString*)title message:(NSString*)message{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:title];
    [titleString addAttribute:NSForegroundColorAttributeName
                        value:[[vc view] tintColor]
                        range:NSMakeRange(0, [title length])];
    [alert setValue:titleString forKey:@"attributedTitle"];
    
    NSMutableAttributedString *messageString = [[NSMutableAttributedString alloc] initWithString:message];
    [messageString addAttribute:NSForegroundColorAttributeName
                        value:[[vc view] tintColor]
                        range:NSMakeRange(0, [title length])];
    [alert setValue:messageString forKey:@"attributedMessage"];
    
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
    alertContentView.backgroundColor = [UIColor lightGrayColor];
    
    alert.view.backgroundColor = [UIColor clearColor];
    alert.view.tintColor = [[vc view] tintColor];
    
    [vc presentViewController:alert animated:YES completion:nil];
}

+ (void)createCustomAlertController:(UIViewController*)vc title:(NSString*)title message:(NSString*)message actions:(NSArray*)actions{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:title];
    [titleString addAttribute:NSForegroundColorAttributeName
                        value:[[vc view] tintColor]
                        range:NSMakeRange(0, [title length])];
    [alert setValue:titleString forKey:@"attributedTitle"];
    
    NSMutableAttributedString *messageString = [[NSMutableAttributedString alloc] initWithString:message];
    [messageString addAttribute:NSForegroundColorAttributeName
                          value:[[vc view] tintColor]
                          range:NSMakeRange(0, [message length])];
    [alert setValue:messageString forKey:@"attributedMessage"];
    
    UILabel * appearanceLabel = [UILabel appearanceWhenContainedIn:UIAlertController.class, nil];
    [appearanceLabel setAppearanceFont:[UIFont fontWithName:@"Alagard" size:20]];
    
    for(UIAlertAction *action in actions){
        [alert addAction:action];
    }
    
    UIView *subview = alert.view.subviews.firstObject;
    UIView *alertContentView = subview.subviews.firstObject;
    alertContentView.backgroundColor = [UIColor lightGrayColor];
    
    alert.view.backgroundColor = [UIColor clearColor];
    alert.view.tintColor = [[vc view] tintColor];
    
    [vc presentViewController:alert animated:YES completion:nil];
}

+ (void)createNameTextAlertController:(UIViewController*)vc title:(NSString*)title message:(NSString*)message{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:title];
    [titleString addAttribute:NSForegroundColorAttributeName
                        value:[[vc view] tintColor]
                        range:NSMakeRange(0, [title length])];
    [alert setValue:titleString forKey:@"attributedTitle"];
    
    NSMutableAttributedString *messageString = [[NSMutableAttributedString alloc] initWithString:message];
    [messageString addAttribute:NSForegroundColorAttributeName
                          value:[[vc view] tintColor]
                          range:NSMakeRange(0, [message length])];
    [alert setValue:messageString forKey:@"attributedMessage"];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"Enter a new name";
         textField.textAlignment = NSTextAlignmentCenter;
         textField.font = [UIFont fontWithName:@"Alagard" size:20];
         [textField setTextColor:[[vc view] tintColor]];
         textField.keyboardAppearance = UIKeyboardAppearanceDark;
     }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   UITextField *login = alert.textFields.firstObject;
                                   if(login.text.length > 0){
                                       [[NSNotificationCenter defaultCenter] postNotificationName:@"customNameEntered" object:login.text];
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                   }else{
#warning Always dismisses alert
                                       login.placeholder = @"Please enter a valid name";
                                       //[vc presentViewController:alert animated:YES completion:nil];
                                   }
                               }];
    
    UILabel * appearanceLabel = [UILabel appearanceWhenContainedIn:UIAlertController.class, nil];
    [appearanceLabel setAppearanceFont:[UIFont fontWithName:@"Alagard" size:20]];
    
    [alert addAction:okAction];
    
    UIView *subview = alert.view.subviews.firstObject;
    UIView *alertContentView = subview.subviews.firstObject;
    alertContentView.backgroundColor = [UIColor lightGrayColor];
    
    alert.view.backgroundColor = [UIColor clearColor];
    alert.view.tintColor = [[vc view] tintColor];
    
    [vc presentViewController:alert animated:YES completion:nil];
}


@end
