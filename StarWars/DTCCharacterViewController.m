//
//  DTCCharacterViewController.m
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCCharacterViewController.h"
#import "DTCWikiViewController.h"

@interface DTCCharacterViewController ()

@end

@implementation DTCCharacterViewController

#pragma mark - Init
- (id) initWithModel:(DTCStarWarsCharacter *) aModel{
    if(self = [super initWithNibName:nil
                              bundle:nil]){
        _model = aModel;
        // We must use self.title instead of _title because of restrictions
        self.tabBarItem.image = aModel.icon;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Make sure the view not to use the whole screen when embeded in combiners
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self syncModelWithView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Utils
- (void) syncModelWithView{
    self.photoView.image = self.model.photo;
    self.title = self.model.alias;
}

#pragma mark - Actions
// Play the character's sound
- (IBAction)playSound:(id)sender{
    // Play the sound of the model
    self.player = [DTCAudioPlayer audioPlayer];
    [self.player playSoundData:self.model.soundData];
}

// Create a wikiVC and push it to the navigation controller
- (IBAction)displayWiki:(id)sender{
    DTCWikiViewController *wikiVC = [[DTCWikiViewController alloc]initWithModel:self.model];
    [self.navigationController pushViewController:wikiVC animated:YES];
}

#pragma mark - UISplitViewControllerDelegate
- (void) splitViewController:(UISplitViewController *)svc
     willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{

    // Find out if the table is visible
    
    if (displayMode==UISplitViewControllerDisplayModePrimaryHidden) {
        // Table hidden => show button on the navigation
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }
    else{
        // Table visible => Hide split button
        self.navigationItem.leftBarButtonItem = nil;
    }
}

#pragma mark - DTCUniverseTableViewControllerDelegate
- (void) universeTableViewController:(DTCUniverseTableViewController *)universe
                       didSelectBook:(DTCStarWarsCharacter *)character{
    self.model = character;
    [self syncModelWithView];
}

@end
