//
//  AppDelegate.m
//  Rotten Tomatoes
//
//  Created by Xu He on 1/22/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "AppDelegate.h"
#import "MoviesController.h"
#import "SecondView.h"
#import "TabController.h"

@implementation AppDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", error.description);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window makeKeyAndVisible];
    
    SecondView *second=[[SecondView alloc]init];
    
    MoviesController *vc=[[MoviesController alloc]init];
    UINavigationController *nvc=[[UINavigationController alloc]initWithRootViewController:vc];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:
                                        nvc,
                                        second,
                                        nil];
    
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    
    tabBarItem1.title = @"Movies";
    tabBarItem1.titlePositionAdjustment = UIOffsetMake(0, -15.0);
    tabBarItem2.title = @"DVDs";
    tabBarItem2.titlePositionAdjustment = UIOffsetMake(0, -15.0);
    
    [tabBarItem1 setImage:[UIImage imageNamed:@"movie.png"]];
    [tabBarItem2 setImage:[UIImage imageNamed:@"dvd.png"]];
    
//    [tabBarItem1 initWithTitle:@"Movies" image:[UIImage imageNamed:@"movie.png"] selectedImage:[UIImage imageNamed:@"movie.png"]];
//    [tabBarItem2 initWithTitle:@"DVDs" image:[UIImage imageNamed:@"dvd.png"] selectedImage:[UIImage imageNamed:@"dvd.png"]];
//    UIImage *movie=[UIImage imageNamed:@"movie.png"];
//    UIImage *movie=[UIImage alloc] initwith:;
//    [movie
//    tabBarItem1.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
//    tabBarItem2.selectedImage=[UIImage imageNamed:@"dvd.png"];
    
    
    
    
    
//    MoviesController *vc1=[[MoviesController alloc]init];
//    UINavigationController *nvc1=[[UINavigationController alloc]initWithRootViewController:vc];
    
    
    // set as the root window
    self.window.rootViewController = tabBarController;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
