//
//  AppDelegate.h
//  ios-timer
//
//  Created by WangDongya on 2017/12/28.
//  Copyright © 2017年 example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

