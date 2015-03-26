//
//  DTCStarWarsUniverse.h
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTCStarWarsCharacter.h"

@interface DTCStarWarsUniverse : NSObject

#pragma mark - Properties
@property (nonatomic,readonly) NSUInteger rebelCount;
@property (nonatomic,readonly) NSUInteger imperialCount;


#pragma mark - Class methods
// i-Rebel character amongs rebels and i-Imperial characters amongs imperials
- (DTCStarWarsCharacter *) rebelAtIndex:(NSUInteger) index;
- (DTCStarWarsCharacter *) imperialAtIndex:(NSUInteger) index;

@end
