//
//  DTCUniverseTableViewController.h
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTCStarWarsUniverse.h"
#import "DTCStarWarsCharacter.h"

#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1

#define CHARACTER_SELECTED_WIKI_NOTIFICATION_NAME @"newCharacterWiki"
#define CHARACTER_KEY @"character"

// Forward declaration needed to define a protocol
@class DTCUniverseTableViewController;

#pragma mark - Protocol

@protocol DTCUniverseTableViewControllerDelegate <NSObject>

// Optional methods
@optional
// Tell the delegate the character selected has changed
- (void) universeTableViewController:(DTCUniverseTableViewController *) universe
                       didSelectCharacter:(DTCStarWarsCharacter *) character;

@end

// Auto-Delegate for managing the table on iPhones
@interface DTCUniverseTableViewController : UITableViewController<DTCUniverseTableViewControllerDelegate>

#pragma mark - Properties
@property (strong,nonatomic) DTCStarWarsUniverse *model;
// Delegate => will be the CharacterVC
@property (weak,nonatomic) id<DTCUniverseTableViewControllerDelegate> delegate;

#pragma mark - Init
- (id) initWithModel: (DTCStarWarsUniverse *) aModel
               style: (UITableViewStyle) aStyle;

@end
