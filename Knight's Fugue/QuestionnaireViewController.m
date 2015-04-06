//
//  QuestionnaireViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/23/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "QuestionnaireViewController.h"

@interface QuestionnaireViewController ()

@end

NSDictionary *classQuestions;
NSDictionary *rogueAnswers;
NSDictionary *mageAnswers;
NSDictionary *berserkerAnswers;

NSDictionary *moralityQuestions;
NSDictionary *goodAnswers;
NSDictionary *neutralAnswers;
NSDictionary *evilAnswers;

NSMutableArray *classQuestionKeys;
NSMutableArray *moralityQuestionKeys;

NSString* currentQuestion;

int chosenRogueAnswers;
int chosenMageAnswers;
int chosenBerserkerAnswers;
int numberOfClassQs;

int chosenGoodAnswers;
int chosenNeutralAnswers;
int chosenEvilAnswers;
int numberOfMoralityQs;

@implementation QuestionnaireViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.backgroundColor = [[self view] tintColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(popToRootView)];
    [Connector customizeBarButton:self.navigationItem.leftBarButtonItem];
    
    [self createQuestionAndAnswerDicts];
        
    [self chooseCreationMode];
    
    classQuestionKeys = [[classQuestions allKeys] mutableCopy];
    moralityQuestionKeys = [[moralityQuestions allKeys] mutableCopy];
    
    chosenRogueAnswers = 0;
    chosenMageAnswers = 0;
    chosenBerserkerAnswers = 0;
    numberOfClassQs = 0;
    
    chosenGoodAnswers = 0;
    chosenNeutralAnswers = 0;
    chosenEvilAnswers = 0;
    numberOfMoralityQs = 0;
    
    //[self createQuestionAndAnswers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)chooseCreationMode{
    _questionLabel.text = @"Manual or Questionnaire?";
    [_answer1UI_B setTitle:@"Manual" forState:UIControlStateNormal];
    [_answer2UI_B setTitle:@"Questionnaire" forState:UIControlStateNormal];
    [_answer3UI_B setTitle:@"Nothing Here..." forState:UIControlStateNormal];
    _answer3UI_B.enabled = false;
    [_answer3UI_B setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
}

- (void)createQuestionAndAnswerDicts{
    classQuestions = @{@"q1" : @"I enjoy the thought of...", @"q2" : @"I prefer working with my...", @"q3" : @"My temperament would best be described as...", @"q4" : @"I feel most at ease...", @"q5" : @"cQuestion 5", @"q6" : @"cQuestion 6", @"q7" : @"cQuestion 7", @"q8" : @"cQuestion 8", @"q9" : @"cQuestion 9", @"q10" : @"cQuestion 10"};
    
    rogueAnswers = @{@"q1" : @"Cunning", @"q2" : @"Tools", @"q3" : @"Relaxed", @"q4" : @"In a crowd", @"q5" : @"rAnswer 5", @"q6" : @"rAnswer 6", @"q7" : @"rAnswer 7", @"q8" : @"rAnswer 8", @"q9" : @"rAnswer 9", @"q10" : @"rAnswer 10"};
    
    mageAnswers = @{@"q1" : @"Discovery", @"q2" : @"Mind", @"q3" : @"Patient", @"q4" : @"Alone", @"q5" : @"mAnswer 5", @"q6" : @"mAnswer 6", @"q7" : @"mAnswer 7", @"q8" : @"mAnswer 8", @"q9" : @"mAnswer 9", @"q10" : @"mAnswer 10"};
    
    berserkerAnswers = @{@"q1" : @"War", @"q2" : @"Hands", @"q3" : @"Confident", @"q4" : @"In the open", @"q5" : @"bAnswer 5", @"q6" : @"bAnswer 6", @"q7" : @"bAnswer 7", @"q8" : @"bAnswer 8", @"q9" : @"bAnswer 9", @"q10" : @"bAnswer 10"};
    
    moralityQuestions = @{@"q1" : @"Morality Question 1", @"q2" : @"Morality Question 2", @"q3" : @"Morality Question 3", @"q4" : @"Morality Question 4", @"q5" : @"Morality Question 5"};
    
    goodAnswers = @{@"q1" : @"gAnswer 1", @"q2" : @"gAnswer 2", @"q3" : @"gAnswer 3", @"q4" : @"gAnswer 4", @"q5" : @"gAnswer 5"};
    
    neutralAnswers = @{@"q1" : @"nAnswer 1", @"q2" : @"nAnswer 2", @"q3" : @"nAnswer 3", @"q4" : @"nAnswer 4", @"q5" : @"nAnswer 5"};
    
    evilAnswers = @{@"q1" : @"eAnswer 1", @"q2" : @"eAnswer 2", @"q3" : @"eAnswer 3", @"q4" : @"eAnswer 4", @"q5" : @"eAnswer 5"};
}

- (void)createQuestionAndAnswers{
    NSLog(@"rogue: %d\nmage: %d\nberserker: %d\ngood: %d\nneutral: %d\nevil: %d",chosenRogueAnswers,chosenMageAnswers,chosenBerserkerAnswers,chosenGoodAnswers,chosenNeutralAnswers,chosenEvilAnswers);
    
    _answer1UI_B.hidden = true;
    _answer2UI_B.hidden = true;
    _answer3UI_B.hidden = true;
    
    int qSelection = arc4random_uniform(100);
    
    if(qSelection > 40){
        if(numberOfClassQs<=10){
            numberOfClassQs++;
        }else{
            numberOfMoralityQs++;
        }
    }else if(qSelection <= 40){
        if(numberOfMoralityQs<=5){
            numberOfMoralityQs++;
        }else{
            numberOfClassQs++;
        }
    }
    
    NSLog(@"Number of class Qs: %d\nNumber of morality Qs: %d",numberOfClassQs,numberOfMoralityQs);

    if((qSelection > 40 && numberOfClassQs <= 10 && numberOfMoralityQs != 6) || (numberOfMoralityQs > 5 && numberOfClassQs < 10)){
        int random = arc4random()%[classQuestionKeys count];
        NSString *key = [classQuestionKeys objectAtIndex:random];
        
        _questionLabel.text = [classQuestions objectForKey:key];
        currentQuestion = key;

        NSMutableArray *ansArr = [@[rogueAnswers, mageAnswers, berserkerAnswers] mutableCopy];
        bool ans1Set = false, ans2Set = false, ans3Set = false;
        int ansArrCount = (int)[ansArr count];
        
        for(int i = 0; i < ansArrCount; i++){
            int index = arc4random()%[ansArr count];
            
            if(!ans1Set){
                [_answer1UI_B setTitle:[[ansArr objectAtIndex:index] objectForKey:key] forState:UIControlStateNormal];
                ans1Set = true;
                _answer1UI_B.hidden = false;
            }else if(!ans2Set){
                [_answer2UI_B setTitle:[[ansArr objectAtIndex:index] objectForKey:key] forState:UIControlStateNormal];
                ans2Set = true;
                _answer2UI_B.hidden = false;
            }else if(!ans3Set){
                [_answer3UI_B setTitle:[[ansArr objectAtIndex:index] objectForKey:key] forState:UIControlStateNormal];
                ans3Set = true;
                _answer3UI_B.hidden = false;
            }
            
            [ansArr removeObjectAtIndex:index];
        }
        
        [classQuestionKeys removeObject:key];

    }else if((qSelection <= 40 && numberOfMoralityQs <= 5 && numberOfClassQs != 11) || (numberOfClassQs > 10 && numberOfMoralityQs < 5)){
        int random = arc4random()%[moralityQuestionKeys count];
        NSString *key = [moralityQuestionKeys objectAtIndex:random];
        
        _questionLabel.text = [moralityQuestions objectForKey:key];
        currentQuestion = key;
        
        NSMutableArray *ansArr = [@[goodAnswers, neutralAnswers, evilAnswers] mutableCopy];
        bool ans1Set = false, ans2Set = false, ans3Set = false;
        int ansArrCount = (int)[ansArr count];
        
        for(int i = 0; i < ansArrCount; i++){
            int index = arc4random()%[ansArr count];
            
            if(!ans1Set){
                [_answer1UI_B setTitle:[[ansArr objectAtIndex:index] objectForKey:key] forState:UIControlStateNormal];
                ans1Set = true;
                _answer1UI_B.hidden = false;
            }else if(!ans2Set){
                [_answer2UI_B setTitle:[[ansArr objectAtIndex:index] objectForKey:key] forState:UIControlStateNormal];
                ans2Set = true;
                _answer2UI_B.hidden = false;
            }else if(!ans3Set){
                [_answer3UI_B setTitle:[[ansArr objectAtIndex:index] objectForKey:key] forState:UIControlStateNormal];
                ans3Set = true;
                _answer3UI_B.hidden = false;
            }
            
            [ansArr removeObjectAtIndex:index];
        }
        
        [moralityQuestionKeys removeObject:key];
        
    }else if((numberOfClassQs > 10 && numberOfMoralityQs >= 5) || (numberOfClassQs >= 10 && numberOfMoralityQs > 5)){
        [self performSegueWithIdentifier:@"showQCharacterCreation" sender:self];
    }
}

- (IBAction)answer1UI_A:(id)sender {
    [self checkButton:_answer1UI_B];
}

- (IBAction)answer2UI_A:(id)sender {
    [self checkButton:_answer2UI_B];
}

- (IBAction)answer3UI_A:(id)sender {
    [self checkButton:_answer3UI_B];
}

- (void) checkButton: (UIButton*)button{
    bool incremented = false;
    
    if([button.titleLabel.text isEqualToString:@"Manual"]){
        [self performSegueWithIdentifier:@"showMCharacterCreation" sender:self];
    }else if([button.titleLabel.text isEqualToString:@"Questionnaire"]){
        [self createQuestionAndAnswers];
        _answer3UI_B.enabled = true;
        [_answer3UI_B setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        return;
    }
    
    if([button.titleLabel.text isEqualToString:[rogueAnswers objectForKey:currentQuestion]]){
        chosenRogueAnswers++;
        incremented = true;
    }else if([button.titleLabel.text isEqualToString:[mageAnswers objectForKey:currentQuestion]]){
        chosenMageAnswers++;
        incremented = true;
    }else if([button.titleLabel.text isEqualToString:[berserkerAnswers objectForKey:currentQuestion]]){
        chosenBerserkerAnswers++;
        incremented = true;
    }else if([button.titleLabel.text isEqualToString:[goodAnswers objectForKey:currentQuestion]]){
        chosenGoodAnswers++;
        incremented = true;
    }else if([button.titleLabel.text isEqualToString:[neutralAnswers objectForKey:currentQuestion]]){
        chosenNeutralAnswers++;
        incremented = true;
    }else if([button.titleLabel.text isEqualToString:[evilAnswers objectForKey:currentQuestion]]){
        chosenEvilAnswers++;
        incremented = true;
    }
    
    if(incremented == true){
        [self createQuestionAndAnswers];
        [NSThread sleepForTimeInterval:0.15f];
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showCharacterCreation"]) {
        double roguePercentage = (chosenRogueAnswers/10.0)*100.0;
        double magePercentage = (chosenMageAnswers/10.0)*100.0;
        double berserkerPercentage = (chosenBerserkerAnswers/10.0)*100.0;
        NSString *classString = @"";
        
        double goodPercentage = (chosenGoodAnswers/5.0)*100.0;
        double neutralPercentage = (chosenNeutralAnswers/5.0)*100.0;
        double evilPercentage = (chosenEvilAnswers/5.0)*100.0;
        NSString *moralityString = @"";
        
        NSLog(@"rogue: %f\nmage: %f\nberserker: %f\n\ngood: %f\nneutral: %f\nevil: %f",roguePercentage,magePercentage,berserkerPercentage,goodPercentage,neutralPercentage,evilPercentage);
        
        if(roguePercentage == 40.0 || magePercentage == 40.0 || berserkerPercentage == 40.0){
            int random = arc4random()%2;
            
            if(roguePercentage == 40.0){
                if(random == 1){
                    classString = @"assassin";
                }else{
                    classString = @"warrior";
                }
            }else if(magePercentage == 40.0){
                if(random == 1){
                    classString = @"assassin";
                }else{
                    classString = @"templar";
                }
            }else if(berserkerPercentage == 40.0){
                if(random == 1){
                    classString = @"warrior";
                }else{
                    classString = @"templar";
                }
            }
        }else if(roguePercentage >= 70.0){
            classString = @"rogue";
        }else if(magePercentage >= 70.0){
            classString = @"mage";
        }else if(berserkerPercentage >= 70.0){
            classString = @"berserker";
        }else if(roguePercentage == 60.0 && magePercentage == 20 && berserkerPercentage == 20){
            classString = @"rogue";
        }else if(magePercentage == 60.0 && roguePercentage == 20 && berserkerPercentage == 20){
            classString = @"mage";
        }else if(berserkerPercentage >= 60.0 && magePercentage == 20 && roguePercentage == 20){
            classString = @"berserker";
        }else if((roguePercentage >= 40.0 && magePercentage >= 30.0) || (roguePercentage >= 30.0 && magePercentage >= 40.0)){
            classString = @"assassin";
        }else if((roguePercentage >= 40.0 && berserkerPercentage >= 30.0) || (roguePercentage >= 30.0 && berserkerPercentage >= 40.0)){
            classString = @"warrior";
        }else{
            classString = @"templar";
        }
        
        if(goodPercentage >= 100){
            moralityString = @"maxGood";
        }else if(goodPercentage >= 50.0){
            moralityString = @"good";
        }else if(evilPercentage >= 100){
            moralityString = @"maxEvil";
        }else if(evilPercentage >= 50.0){
            moralityString = @"evil";
        }else if(neutralPercentage >= 100){
            moralityString = @"maxNeutral";
        }else{
            moralityString = @"neutral";
        }
        
        [self saveGame:classString morality:moralityString];
    }
}

- (void) saveGame:(NSString*)class morality:(NSString*)morality{
    SavedGameData *sgd = [[SavedGameData alloc] init];
    Knight *knight;
    if([class isEqualToString:@"berserker"]){
        knight = [[BerserkerClass alloc] init];
    }else if([class isEqualToString:@"rogue"]){
        knight = [[RogueClass alloc] init];
    }else if([class isEqualToString:@"mage"]){
        knight = [[MageClass alloc]init];
    }else if([class isEqualToString:@"assassin"]){
        knight = [[AssassinClass alloc]init];
    }else if([class isEqualToString:@"warrior"]){
        knight = [[WarriorClass alloc]init];
    }else if([class isEqualToString:@"templar"]){
        knight = [[TemplarClass alloc]init];
    }

    knight.morality = morality;
    
    sgd.knight = [knight toDictionary];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    sgd.saveDate = [formatter stringFromDate:[NSDate date]];
            
    [[NSUserDefaults standardUserDefaults] setObject:[sgd toDictionary] forKey:@"savedSGD"];
}

- (void)popToRootView{
    [Connector createCancelAlertController:self title:@"Cancel Character Creation?" message:@"All data will be lost if cancelled"];
}

@end
