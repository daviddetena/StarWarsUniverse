//
//  DTCStarWarsUniverse.m
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCStarWarsUniverse.h"

@interface DTCStarWarsUniverse()

@property (strong,nonatomic) NSArray *rebels;
@property (strong,nonatomic) NSArray *imperials;

@end

@implementation DTCStarWarsUniverse

#pragma mark - Private properties
- (NSUInteger) rebelCount{
    return [self.rebels count];
}

- (NSUInteger) imperialCount{
    return [self.imperials count];
}


#pragma mark - Init
// Overwrite init
- (id) init{
    if(self = [super init]){
        // Create models
        NSBundle *b = [NSBundle mainBundle];
        
        // Create the models
        NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        NSData *vaderSound = [NSData dataWithContentsOfURL:[b URLForResource:@"vader" withExtension:@"caf"]];
        UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
        UIImage *vaderIcon = [UIImage imageNamed:@"vader_icon"];
        DTCStarWarsCharacter *vader = [[DTCStarWarsCharacter alloc]
                                       initWithName:@"Anakin Skywalker"
                                       alias:@"Darth Vader"
                                       url:vaderURL
                                       soundData:vaderSound
                                       photo:vaderImage
                                       icon:vaderIcon];
        
        NSURL *tarkinURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Grand_Moff_Tarkin"];
        NSData *tarkinSound = [NSData dataWithContentsOfURL:[b URLForResource:@"tarkin" withExtension:@"caf"]];
        UIImage *tarkinImage = [UIImage imageNamed:@"tarkin.jpg"];        
        DTCStarWarsCharacter *tarkin = [[DTCStarWarsCharacter alloc]
                                        initWithName:@"Wilhuf Tarkin"
                                        alias:@"Grand Moff Tarkin"
                                        url:tarkinURL
                                        soundData:tarkinSound
                                        photo:tarkinImage icon:nil];
        
        // Palpatine
        NSURL *palpatineURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Palpatine"];
        NSData *palpatineSound = [NSData dataWithContentsOfURL:[b URLForResource:@"palpatine" withExtension:@"caf"]];
        UIImage *palpatineImage = [UIImage imageNamed:@"palpatine.jpg"];
        DTCStarWarsCharacter *palpatine = [[DTCStarWarsCharacter alloc]
                                           initWithAlias:@"Palpatine"
                                           url:palpatineURL
                                           soundData:palpatineSound
                                           photo:palpatineImage
                                           icon:nil];
        
        // Chewbacca
        NSURL *chewieURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chewbacca"];
        NSData *chewieSound = [NSData dataWithContentsOfURL:[b URLForResource:@"chewbacca" withExtension:@"caf"]];
        UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
        UIImage *chewieIcon = [UIImage imageNamed:@"chewbacca_icon"];
        DTCStarWarsCharacter *chewie = [[DTCStarWarsCharacter alloc]
                                        initWithAlias:@"Chewbacca"
                                        url:chewieURL
                                        soundData:chewieSound
                                        photo:chewieImage
                                        icon:chewieIcon];
        
        // C-3PO
        NSURL *c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/C-3PO"];
        NSData *c3poSound = [NSData dataWithContentsOfURL:[b URLForResource:@"c3po" withExtension:@"caf"]];
        UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
        UIImage *c3poIcon = [UIImage imageNamed:@"c-3po_icon"];
        DTCStarWarsCharacter *c3po = [[DTCStarWarsCharacter alloc]
                                      initWithAlias:@"C-3PO"
                                      url:c3poURL
                                      soundData:c3poSound
                                      photo:c3poImage
                                      icon:c3poIcon];
        
        // Yoda
        NSURL *yodaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Yoda"];
        NSData *yodaSound = [NSData dataWithContentsOfURL:[b URLForResource:@"yoda" withExtension:@"caf"]];
        UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
        UIImage *yodaIcon = [UIImage imageNamed:@"yoda_icon"];
        DTCStarWarsCharacter *yoda = [[DTCStarWarsCharacter alloc]
                                      initWithName:@"Minch Yoda"
                                      alias:@"Master Yoda"
                                      url:yodaURL
                                      soundData:yodaSound
                                      photo:yodaImage
                                      icon:yodaIcon];
        
        // R2-D2
        NSURL *r2d2URL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/R2-D2"];
        NSData *r2d2Sound = [NSData dataWithContentsOfURL:[b URLForResource:@"r2-d2" withExtension:@"caf"]];
        UIImage *r2d2Image = [UIImage imageNamed:@"R2-D2.jpg"];
        UIImage *r2d2Icon = [UIImage imageNamed:@"r2d2_icon"];
        DTCStarWarsCharacter *r2d2 = [[DTCStarWarsCharacter alloc]
                                      initWithAlias:@"R2-D2"
                                      url:r2d2URL
                                      soundData:r2d2Sound
                                      photo:r2d2Image
                                      icon:r2d2Icon];
        
        self.imperials = @[vader,palpatine,tarkin];
        self.rebels = @[chewie,c3po,yoda,r2d2];
    }
    return self;
}

- (DTCStarWarsCharacter *) rebelAtIndex:(NSUInteger) index{
    return [self.rebels objectAtIndex:index];
}

- (DTCStarWarsCharacter *) imperialAtIndex:(NSUInteger) index{
    return [self.imperials objectAtIndex:index];
}

@end
