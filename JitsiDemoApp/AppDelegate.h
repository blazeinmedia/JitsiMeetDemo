//
//  AppDelegate.h
//  JitsiDemoApp
//
//  Created by Parvendra Kumar on 10/02/18.
//  Copyright © 2018 Parvendra Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

