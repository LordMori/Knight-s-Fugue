//
//  QuestionnaireViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/23/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "QuestionnaireViewController.h"

@interface QuestionnaireViewController ()

@property NSDictionary *questions;
@property NSDictionary *rogueAnswers;
@property NSDictionary *mageAnswers;
@property NSDictionary *berserkerAnswers;
@property NSMutableArray *questionKeys;

@property NSString* currentQuestion;
@property int chosenRogueAnswers;
@property int chosenMageAnswers;
@property int chosenBerserkerAnswers;
@property int numberOfQs;

@end

@implementation QuestionnaireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _questions = @{@"q1" : @"I enjoy the thought of...", @"q2" : @"I prefer working with my...", @"q3" : @"My temperament would best be described as...", @"q4" : @"I feel most at ease...", @"q5" : @"Question 5", @"q6" : @"Question 6", @"q7" : @"Question 7", @"q8" : @"Question 8", @"q9" : @"Question 9", @"q10" : @"Question 10"};
    
    _rogueAnswers = @{@"q1" : @"Cunning", @"q2" : @"Tools", @"q3" : @"Relaxed", @"q4" : @"In a crowd", @"q5" : @"rAnswer 5", @"q6" : @"rAnswer 6", @"q7" : @"rAnswer 7", @"q8" : @"rAnswer 8", @"q9" : @"rAnswer 9", @"q10" : @"rAnswer 10"};
    
    _mageAnswers = @{@"q1" : @"Discovery", @"q2" : @"Mind", @"q3" : @"Patient", @"q4" : @"Alone", @"q5" : @"mAnswer 5", @"q6" : @"mAnswer 6", @"q7" : @"mAnswer 7", @"q8" : @"mAnswer 8", @"q9" : @"mAnswer 9", @"q10" : @"mAnswer 10"};
    
    _berserkerAnswers = @{@"q1" : @"War", @"q2" : @"Hands", @"q3" : @"Confident", @"q4" : @"In the open", @"q5" : @"bAnswer 5", @"q6" : @"bAnswer 6", @"q7" : @"bAnswer 7", @"q8" : @"bAnswer 8", @"q9" : @"bAnswer 9", @"q10" : @"bAnswer 10"};
    
    _questionKeys = [[_questions allKeys] mutableCopy];
    _chosenRogueAnswers = 0;
    _chosenMageAnswers = 0;
    _chosenBerserkerAnswers = 0;
    _numberOfQs = 0;
    
    [self createQuestionAndAnswers];
}

- (void)viewWillAppear:(BOOL)animated{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"cancelPressed"]){
        [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createQuestionAndAnswers{
    NSLog(@"%@",[NSString stringWithFormat:@"rogue: %d\nmage: %d\nberserker: %d",_chosenRogueAnswers,_chosenMageAnswers,_chosenBerserkerAnswers]);
    _numberOfQs++;

    if(_numberOfQs <= 10){
        int random = arc4random()%[_questionKeys count];
        NSString *key = [_questionKeys objectAtIndex:random];
        
        _questionLabel.text = [_questions objectForKey:key];
        _currentQuestion = key;

        NSMutableArray *ansArr = [@[_rogueAnswers, _mageAnswers, _berserkerAnswers] mutableCopy];
        bool ans1Set = false, ans2Set = false, ans3Set = false;
        int ansArrCount = (int)[ansArr count];
        
        for(int i = 0; i < ansArrCount; i++){
            int index = arc4random()%[ansArr count];
            
            if(!ans1Set){
                [_answer1UI_B setTitle:[[ansArr objectAtIndex:index] objectForKey:key] forState:UIControlStateNormal];
                ans1Set = true;
            }else if(!ans2Set){
                [_answer2UI_B setTitle:[[ansArr objectAtIndex:index] objectForKey:key] forState:UIControlStateNormal];
                ans2Set = true;
            }else if(!ans3Set){
                [_answer3UI_B setTitle:[[ansArr objectAtIndex:index] objectForKey:key] forState:UIControlStateNormal];
                ans3Set = true;
            }
            
            [ansArr removeObjectAtIndex:index];
        }
        
        [_questionKeys removeObject:key];
    }else{
        [self performSegueWithIdentifier:@"showMorality" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showMorality"]) {
        double roguePercentage = (_chosenRogueAnswers/10.0)*100.0;
        double magePercentage = (_chosenMageAnswers/10.0)*100.0;
        double berserkerPercentage = (_chosenBerserkerAnswers/10.0)*100.0;
                
        NSLog(@"rogue: %f\nmage: %f\nberserker: %f",roguePercentage,magePercentage,berserkerPercentage);

        if(roguePercentage == 40.0 || magePercentage == 40.0 || berserkerPercentage == 40.0){
            int random = arc4random()%2;
            
            if(roguePercentage == 40.0){
                if(random == 1){
                    [self saveGame:@"assassin"];
                }else{
                    [self saveGame:@"warrior"];
                }
            }else if(magePercentage == 40.0){
                if(random == 1){
                    [self saveGame:@"assassin"];
                }else{
                    [self saveGame:@"templar"];
                }
            }else if(berserkerPercentage == 40.0){
                if(random == 1){
                    [self saveGame:@"warrior"];
                }else{
                    [self saveGame:@"templar"];
                }
            }
        }else if(roguePercentage >= 66.0){
            [self saveGame:@"rogue"];
        }else if(magePercentage >= 66.0){
            [self saveGame:@"mage"];
        }else if(berserkerPercentage >= 66.0){
            [self saveGame:@"berserker"];
        }else if(roguePercentage >= 33.0 && magePercentage >= 33.0){
            [self saveGame:@"assassin"];
        }else if(roguePercentage >= 33.0 && berserkerPercentage >= 33.0){
            [self saveGame:@"warrior"];
        }else{
            [self saveGame:@"templar"];
        }
    }
}

- (IBAction)answer1UI_A:(id)sender {
    [self checkButton:sender];
}

- (IBAction)answer2UI_A:(id)sender {
    [self checkButton:sender];
}

- (IBAction)answer3UI_A:(id)sender {
    [self checkButton:sender];
}

- (void) checkButton: (UIButton*)button{
    if([button.titleLabel.text isEqualToString:[_rogueAnswers objectForKey:_currentQuestion]]){
        _chosenRogueAnswers++;
    }else if([button.titleLabel.text isEqualToString:[_mageAnswers objectForKey:_currentQuestion]]){
        _chosenMageAnswers++;
    }else{
        _chosenBerserkerAnswers++;
    }
    
    [self createQuestionAndAnswers];
}

- (void) saveGame:(NSString*)class{
    SavedGameData *sgd = [[SavedGameData alloc] init];
    Knight *knight = [[Knight alloc] init];
    knight.class = class;
    
    sgd.knight = [knight toDictionary];
    sgd.saveDate = [NSDate date];
    
    //NSData* data=[NSKeyedArchiver archivedDataWithRootObject:sgd];
    
    [[NSUserDefaults standardUserDefaults] setObject:[sgd toDictionary] forKey:@"savedGame"];
}

- (IBAction)cancelUI_A:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
