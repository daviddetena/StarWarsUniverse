//
//  DTCWikiViewController.h
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTCStarWarsCharacter.h"

#define CHARACTER_SELECTED_WIKI_NOTIFICATION_NAME @"newCharacterWiki"
#define CHARACTER_KEY @"character"

// This controller will be the delegate of UIWebViewController. With that, we can,
// among other things, know when an url starts orr finishes loading
@interface DTCWikiViewController : UIViewController<UIWebViewDelegate>

#pragma mark - Properties
@property (weak,nonatomic) IBOutlet UIWebView *browser;
@property (strong,nonatomic) DTCStarWarsCharacter *model;
@property (strong,nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

#pragma mark - Init
- (id) initWithModel:(DTCStarWarsCharacter *) model;

@end
