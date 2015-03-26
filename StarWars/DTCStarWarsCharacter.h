//
//  DTCStarWarsCharacter.h
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DTCStarWarsCharacter : NSObject

#pragma mark - Properties
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *alias;
@property (strong,nonatomic) NSURL *wikiURL;
@property (strong,nonatomic) NSData *soundData;
@property (strong,nonatomic) UIImage *photo;


#pragma mark - Instance methods

// Designated
- (id) initWithName:(NSString *) name
              alias:(NSString*) alias
                url:(NSURL *) wikiURL
          soundData:(NSData *) soundData
              photo:(UIImage *)photo;


// Other init
- (id) initWithAlias:(NSString*) alias
                url:(NSURL *) wikiURL
          soundData:(NSData *) soundData
              photo:(UIImage *)photo;

@end
