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
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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

}

@end
