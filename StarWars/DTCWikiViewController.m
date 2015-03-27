//
//  DTCWikiViewController.m
//  StarWars
//
//  Created by David de Tena on 26/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCWikiViewController.h"

@interface DTCWikiViewController ()

@end

@implementation DTCWikiViewController


#pragma mark - Init

// Designated
- (id) initWithModel:(DTCStarWarsCharacter *)model{
    if(self = [super initWithNibName:nil bundle:nil]){
        _model = model;
        // We must use self.title instead of _title because of restrictions
        self.title = @"Wikipedia";
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Suscribe to the Notification Center and keep observing for notifications with the notification name
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(characterDidChange:) name:CHARACTER_SELECTED_WIKI_NOTIFICATION_NAME object:nil];
    
    
    // Make sure the view not to use the whole screen when embeded in combinators
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Subscribe to the Notification Center
    
    // Set delegate of browser
    self.browser.delegate = self;
    [self syncWithView];
}


- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //Unsuscribe from the Notification Center
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) syncWithView{
    // Make the activity indicator appear and start animating
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    // Load model url in the browser
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiURL]];
}


#pragma mark - UIWebViewDelegate
- (void) webViewDidFinishLoad:(UIWebView *)webView{
    // Make the activity indicator appear and start animating
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    // Hide activity view
    self.activityIndicator.hidden = YES;
    NSLog(@"Error when loading URL: %@",error.localizedDescription);
}


- (BOOL)webView:(UIWebView *) webView
shouldStartLoadWithRequest:(NSURLRequest *) request
 navigationType:(UIWebViewNavigationType) navigationType{
    
    // Deny navigation when clicking or submitting a form
    if (navigationType == UIWebViewNavigationTypeLinkClicked || navigationType == UIWebViewNavigationTypeFormSubmitted) {
        return NO;
    }
    return YES;
}

#pragma mark - Notifications
- (void) characterDidChange:(NSNotification *) notification{
    // Receive the notification and extract the info
    NSDictionary *dict = [notification userInfo];
    DTCStarWarsCharacter *character = [dict objectForKey:CHARACTER_KEY];
    
    // Update the model and the url to show
    self.model = character;
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiURL]];
}

@end
