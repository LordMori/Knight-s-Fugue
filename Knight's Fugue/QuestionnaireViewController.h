//
//  QuestionnaireViewController.h
//  Knight's Fugue
//
//  Created by Marc Becker on 3/23/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connector.h"

@interface QuestionnaireViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (weak, nonatomic) IBOutlet UIButton *answer1UI_B;
@property (weak, nonatomic) IBOutlet UIButton *answer2UI_B;
@property (weak, nonatomic) IBOutlet UIButton *answer3UI_B;

@end
