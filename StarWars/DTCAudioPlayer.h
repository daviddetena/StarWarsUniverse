//
//  DTCAudioPlayer.h
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface DTCAudioPlayer : NSObject

#pragma mark - Properties
@property (strong,nonatomic) AVAudioPlayer *player;

#pragma mark - Class method
+ (instancetype) audioPlayer;

#pragma mark - Instance methods
- (void) playSoundData: (NSData *) soundData;
- (void) playFile: (NSURL *) aSoundFile;

@end
