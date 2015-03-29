//
//  AppDelegate.m
//  StarWars
//
//  Created by David de Tena on 24/03/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "AppDelegate.h"
#import "DTCStarWarsCharacter.h"
#import "DTCCharacterViewController.h"
#import "DTCWikiViewController.h"
#import "DTCStarWarsUniverse.h"
#import "DTCUniverseTableViewController.h"
#import "Settings.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Default value for the last selected character
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // First launch
    if(![defaults objectForKey:LAST_SELECTED_CHARACTER]){
        // Save a default value: The first of imperial section
        [defaults setObject:@[@(IMPERIAL_SECTION),@0] forKey:LAST_SELECTED_CHARACTER];
        
        // Save data manually
        [defaults synchronize];
    }
    else{
        
    }
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create the models
    DTCStarWarsUniverse *universe = [[DTCStarWarsUniverse alloc]init];
    
    
    // Detectamos el tipo de pantalla
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        // Tablet
        [self configureForPadWithModel:universe];
    }
    else{
        // iPhone
        [self configureForPhoneWithModel:universe];
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Utils

- (void) configureForPadWithModel: (DTCStarWarsUniverse *) model{
    
    // Create the controllers
    DTCUniverseTableViewController *universeVC = [[DTCUniverseTableViewController alloc]initWithModel:model style:UITableViewStylePlain];
    DTCCharacterViewController *characterVC = [[DTCCharacterViewController alloc]initWithModel:[self lastSelectedCharacterInModel:model]];
    
    // Create the combiners
    UINavigationController *universeNav = [[UINavigationController alloc]initWithRootViewController:universeVC];
    UINavigationController *characterNav = [[UINavigationController alloc]initWithRootViewController:characterVC];
    
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    splitVC.viewControllers = @[universeNav,characterNav];
    
    // Set delegates
    splitVC.delegate = characterVC;
    universeVC.delegate = characterVC;
    
    // Set controller as the root VC
    self.window.rootViewController = splitVC;

}

- (void) configureForPhoneWithModel: (DTCStarWarsUniverse *) model{
    // Create the controllers
    DTCUniverseTableViewController *universeVC = [[DTCUniverseTableViewController alloc]initWithModel:model style:UITableViewStylePlain];
    
    // Create the combiners
    UINavigationController *universeNav = [[UINavigationController alloc]initWithRootViewController:universeVC];
    
    // Set the Delegate
    universeVC.delegate = universeVC;
    
    // Set controller as the root VC
    self.window.rootViewController = universeNav;
}

- (DTCStarWarsCharacter *) lastSelectedCharacterInModel: (DTCStarWarsUniverse *) universe{
    // NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Get the coordinates of the last character
    NSArray *coords = [defaults objectForKey:LAST_SELECTED_CHARACTER];
    NSUInteger section = [[coords objectAtIndex:0] integerValue];
    NSUInteger pos = [[coords objectAtIndex:1] integerValue];

    // Get the character for these coordinates
    DTCStarWarsCharacter *character = nil;
    if (section==IMPERIAL_SECTION) {
        character = [universe imperialAtIndex:pos];
    }
    else{
        character = [universe rebelAtIndex:pos];
    }
    return character;
}

@end
