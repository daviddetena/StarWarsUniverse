//
//  DTCUniverseTableViewController.m
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCUniverseTableViewController.h"
#import "DTCCharacterViewController.h"

@interface DTCUniverseTableViewController ()

@end

@implementation DTCUniverseTableViewController

#pragma mark - Init
// Designated
- (id) initWithModel:(DTCStarWarsUniverse *) aModel
               style:(UITableViewStyle) aStyle{
    
    if(self = [super initWithStyle:aStyle]){
        _model = aModel;
        self.title = @"StarWars Universe";
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==IMPERIAL_SECTION){
        return [self.model imperialCount];
    }
    else{
        return [self.model rebelCount];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Need to know which character the table is talking about
    DTCStarWarsCharacter *character = [self characterAtIndexPath:indexPath];
    
    // Create the cell, initialized once and reused every time this method is called
    static NSString *cellId = @"StarWarsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        // Create a new cell by hand
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // Configure the cell (sync model with view)
    cell.imageView.image = character.photo;
    cell.textLabel.text = character.alias;
    cell.detailTextLabel.text = character.name;
    
    // Return the cell
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==IMPERIAL_SECTION){
        return @"Imperials";
    }
    else{
        return @"Rebels";
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section==IMPERIAL_SECTION) {
        return [NSString stringWithFormat:@"%ld characters",(unsigned long)self.model.imperialCount];
    }
    else{
        return [NSString stringWithFormat:@"%ld characters",(unsigned long)self.model.rebelCount];
    }
}

#pragma mark - TableView Delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Check current character
    DTCStarWarsCharacter *character = [self characterAtIndexPath:indexPath];
    
    // Notify the delegate the model has changed (only if the delegate understands the message [implements it])
    if([self.delegate respondsToSelector:@selector(universeTableViewController:didSelectBook:)]){
        [self.delegate universeTableViewController:self didSelectBook:character];
    }
    
    // Need notifications to tell the WikiVC the model has changed
}


#pragma mark - Utils
- (DTCStarWarsCharacter *) characterAtIndexPath:(NSIndexPath *) indexPath{
    DTCStarWarsCharacter *character = nil;
    
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
    }
    else{
        character = [self.model rebelAtIndex:indexPath.row];
    }
    return character;
}


@end
