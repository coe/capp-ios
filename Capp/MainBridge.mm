//
//  MainBridge.m
//  Capp
//
//  Created by COFFEE on 2016/10/29.
//  Copyright © 2016年 COFFEE. All rights reserved.
//

#import "MainBridge.h"
#import "MainNative.hpp"

class IosMainNative : public MainNative {
private:
    MainBridge* bridge_;
    
public:
    IosMainNative(MainBridge* bridge);
    void showDiarog() {
        [bridge_ showDiarog];
    }
    void connect(std::function< void() > callback) {
        [bridge_ connect:^{
            callback();
        }];
    }
    void dismiss(){
        [bridge_ dismiss];
    }
    void playSound(){
        [bridge_ playSound];
    }
};

IosMainNative::IosMainNative(MainBridge* bridge) {
    bridge_ = bridge;
}

@interface MainBridge()
@property MainNative* native;

@end

@implementation MainBridge

- (id) initWithDelegate:(id<MainBridgeDelegate>)delegate {
    if (self = [super init]) {
        _native = new IosMainNative(self);
        _delegate = delegate;
    }
    return self;
}

-(void)test{
    _native->test();
}

-(void)onClick {
    _native->onClick();
}

# pragma mark - MainBridgeDelegate

-(void)showDiarog {
    [_delegate showDiarog];
}

-(void)connect:(MainBridgeDelegateConnectCallback)callback
{
    [_delegate connect:callback];
}

-(void)dismiss {
    [_delegate dismiss];
}

-(void)playSound {
    [_delegate playSound];
}

@end
