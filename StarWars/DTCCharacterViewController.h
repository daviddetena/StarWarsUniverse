//
//  DTCCharacterViewController.h
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTCStarWarsCharacter.h"
#import "DTCAudioPlayer.h"

@interface DTCCharacterViewController : UIViewController<UISplitViewControllerDelegate>

#pragma mark - Properties
@property (weak,nonatomic) IBOutlet UIImageView *photoView;
@property (strong,nonatomic) DTCStarWarsCharacter *model;

// Need a property for the audio player so it lives as the controller does
@property (strong,nonatomic) DTCAudioPlayer *player;

#pragma mark - Init
// Init Controller with a model
- (id) initWithModel:(DTCStarWarsCharacter *) aModel;

#pragma mark - Actions
- (IBAction)playSound:(id)sender;
- (IBAction)displayWiki:(id)sender;

@end
