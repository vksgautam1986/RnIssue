#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <CodePush/CodePush.h>
//#import <IntercomModule.h> // <-- Add This
#import <UserNotifications/UserNotifications.h>// added for notification
#import <Firebase.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"testProject";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};
  [FIRApp configure];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //NSLog("Your Token is %@", deviceToken);
    //[IntercomModule setDeviceToken:deviceToken];
    //[RNNotifications didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    //[RNCPushNotificationIOS didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

// - (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
//   //[RNNotifications didFailToRegisterForRemoteNotificationsWithError:error];
//   //[RNCPushNotificationIOS didFailToRegisterForRemoteNotificationsWithError:error];
// }

//Remote notification funtion--
// - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
//   //  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView"
//   //          message:@"My message" delegate:self cancelButtonTitle:@"Cancel"
//   //          otherButtonTitles:@"OK", nil];
//   //  [alert show];
//   //[alert release];
//   //[[RNFirebaseNotifications instance] didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
  
//   //[RNCPushNotificationIOS didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
//   //[RNNotifications didReceiveBackgroundNotification:userInfo withCompletionHandler:completionHandler];
// }
 
//Local notifications function--
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
  //[[RNFirebaseNotifications instance] didReceiveLocalNotification:notification];
}

//get FCM token
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
  //[[RNFirebaseMessaging instance] didRegisterUserNotificationSettings:notificationSettings];
}

//- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
//    //Add any custom push handling for your own app here
//    NSDictionary *userInfo = response.notification.request.content.userInfo;
//    if ([Intercom isIntercomPushNotification:userInfo]) {
//        [Intercom handleIntercomPushNotification:userInfo];
//    }
//    completionHandler(UIBackgroundFetchResultNoData);
//}
// Required for localNotification event
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler
{
  //[RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

// Called when a notification is delivered to a foreground app.
//   -(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
//   {
//     completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
//     //[RNCPushNotificationIOS didReceiveNotificationResponse:notification];
//     UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
//        @"Title" message:@"This is a test alert" delegate:self
//        cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//        [alertView show];
// //    UIAlertController * alertvc = [UIAlertController alertControllerWithTitle: @ "Security alert"
// //                                    message: @"Foreground notification test" preferredStyle: UIAlertControllerStyleAlert
// //                                   ];
// //     UIAlertAction * action = [UIAlertAction actionWithTitle: @ "Dismiss"
// //                               style: UIAlertActionStyleDefault handler: ^ (UIAlertAction * _Nonnull action) {
// //                                 NSLog(@ "Dismiss Tapped");
// //                               }
// //                              ];
// //     [alertvc addAction: action];
// //     [self presentViewController: alertvc animated: true completion: nil];
//   }

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
  //return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}
 
@end

