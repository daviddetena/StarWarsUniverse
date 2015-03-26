//
//  DTCCharacterViewController.m
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCCharacterViewController.h"

@interface DTCCharacterViewController ()

@end

@implementation DTCCharacterViewController

#pragma mark - Init
- (id) initWithModel:(DTCStarWarsCharacter *) aModel{
    if(self = [super initWithNibName:nil
                              bundle:nil]){
        _model = aModel;
        // We must use self.title instead of _title because of restrictions
        self.title = aModel.alias;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Make sure the view not to use the whole screen when embeded in combinators
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
}

#pragma mark - Actions
- (IBAction)playSound:(id)sender{
    // Play the sound of the model
    self.player = [DTCAudioPlayer audioPlayer];
    [self.player playSoundData:self.model.soundData];
}

@end
