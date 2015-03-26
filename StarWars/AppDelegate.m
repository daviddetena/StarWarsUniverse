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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Tab bar for grouping all the characters
    UITabBarController *tabBar= [[UITabBarController alloc]init];
    tabBar.viewControllers = [self arrayOfControllers];
    
    // Set controller as the root VC
    self.window.rootViewController = tabBar;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor orangeColor];
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
- (NSArray *) arrayOfModels{
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
    
    // Tarkin
    NSURL *tarkinURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Grand_Moff_Tarkin"];
    NSData *tarkinSound = [NSData dataWithContentsOfURL:[b URLForResource:@"tarkin" withExtension:@"caf"]];
    UIImage *tarkinImage = [UIImage imageNamed:@"tarkin.jpg"];
    DTCStarWarsCharacter *tarkin = [[DTCStarWarsCharacter alloc]
                                    initWithName:@"Wilhuf Tarkin"
                                    alias:@"Grand Moff Tarkin"
                                    url:tarkinURL
                                    soundData:tarkinSound
                                    photo:tarkinImage
                                    icon:nil];
    
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
    
    return @[vader,tarkin,palpatine,chewie,c3po,yoda,r2d2];
}

- (NSArray *) arrayOfControllers{
    NSArray *models = [self arrayOfModels];
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:[models count]];

    // One DTCCharacterVC and one NavigationController per model
    for (DTCStarWarsCharacter *model in models) {
        DTCCharacterViewController *characterVC = [[DTCCharacterViewController alloc]initWithModel:model];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:characterVC];
        [controllers addObject:navController];
    }
    return controllers;
}

@end
