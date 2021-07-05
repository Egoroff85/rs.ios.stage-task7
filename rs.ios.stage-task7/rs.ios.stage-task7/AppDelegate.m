//
//  AppDelegate.m
//  rs.ios.stage-task7
//
//  Created by WiCKed on 04.07.2021.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    RootViewController *rootVC = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    [self.window setRootViewController:rootVC];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
