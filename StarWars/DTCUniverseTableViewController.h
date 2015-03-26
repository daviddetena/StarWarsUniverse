//
//  DTCUniverseTableViewController.h
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTCStarWarsUniverse.h"

#define IMPERIAL_SECTION 0

@interface DTCUniverseTableViewController : UITableViewController

#pragma mark - Properties
@property (strong,nonatomic) DTCStarWarsUniverse *model;

#pragma mark - Init
- (id) initWithModel: (DTCStarWarsUniverse *) aModel
               style: (UITableViewStyle) aStyle;

@end
