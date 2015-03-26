//
//  DTCCharacterViewController.h
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTCStarWarsCharacter.h"

@interface DTCCharacterViewController : UIViewController

#pragma mark - Properties
@property (weak,nonatomic) IBOutlet UIImageView *photoView;
@property (strong,nonatomic) DTCStarWarsCharacter *model;

#pragma mark - Init
// Init Controller with a model
- (id) initWithModel:(DTCStarWarsCharacter *) aModel;


- (IBAction)playSound:(id)sender;

@end
