//
//  DTCStarWarsCharacter.m
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCStarWarsCharacter.h"

@implementation DTCStarWarsCharacter


#pragma mark - Init

// Designated
- (id) initWithName:(NSString *) name
              alias:(NSString*) alias
                url:(NSURL *) wikiURL
          soundData:(NSData *) soundData
              photo:(UIImage *)photo
              icon:(UIImage *)icon{

    if(self = [super init]){
        _name = name;
        _alias = alias;
        _wikiURL = wikiURL;
        _soundData = soundData;
        _photo = photo;
        _icon = icon;
    }
    return self;
}

// Another initializer
- (id) initWithAlias:(NSString*) alias
                 url:(NSURL *) wikiURL
           soundData:(NSData *) soundData
               photo:(UIImage *)photo
                icon:(UIImage *)icon{
    return [self initWithName:nil
                        alias:alias
                          url:wikiURL
                    soundData:soundData
                        photo:photo
                         icon:icon];
}

@end
