//
//  MainBridge.h
//  Capp
//
//  Created by COFFEE on 2016/10/29.
//  Copyright © 2016年 COFFEE. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MainBridgeDelegateConnectCallback)(void);

@protocol MainBridgeDelegate <NSObject>

-(void)showDiarog;
-(void)connect:(MainBridgeDelegateConnectCallback)callback;
-(void)dismiss;
-(void)playSound;

@end

@interface MainBridge : NSObject<MainBridgeDelegate>

- (id) initWithDelegate:(id<MainBridgeDelegate>)delegate;
-(void)test;
-(void)onClick;

@property id<MainBridgeDelegate> delegate;

@end
