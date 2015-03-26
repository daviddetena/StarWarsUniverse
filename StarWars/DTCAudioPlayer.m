//
//  DTCAudioPlayer.m
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>

@implementation DTCAudioPlayer

#pragma mark - Class method
+ (instancetype) audioPlayer{
    return [[[self class]alloc]init];
}

# pragma mark - Actions


- (void) playSoundData:(NSData *)soundData{

    NSError *error;
    self.player = [[AVAudioPlayer alloc]initWithData:soundData error:&error];
    if (self.player == nil) {
        NSLog(@"Error when trying to play the sound file: %@",error.localizedDescription);
    }
    else{
        // Plays once
        self.player.numberOfLoops = 0;
        [self.player play];
    }
}


- (void) playFile:(NSURL *)aSoundFile{
    NSError *error;
    NSData *soundData = [NSData dataWithContentsOfURL:aSoundFile options:kNilOptions error:&error];
    if(soundData==nil){
        NSLog(@"Error when trying to load the sound url: %@",error.localizedDescription);
    }
    else{
        [self playSoundData:soundData];
    }
}

@end
