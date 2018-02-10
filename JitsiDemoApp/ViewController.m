//
//  ViewController.m
//  JitsiDemoApp
//
//  Created by Parvendra Kumar on 10/02/18.
//  Copyright © 2018 Parvendra Singh. All rights reserved.
//

#import "ViewController.h"
#import <JitsiMeet/JitsiMeet.h>

@interface ViewController ()<JitsiMeetViewDelegate>

@end

@implementation ViewController
@synthesize jitsiMeetView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JitsiMeetView *jitsiMeetView = (JitsiMeetView *)self.jitsiMeetView;
    jitsiMeetView.delegate = self;
    jitsiMeetView.welcomePageEnabled = YES;

    [jitsiMeetView loadURLObject:@{
                                   @"config": @{@"startWithAudioMuted":@NO,
                                                @"startWithVideoMuted":@NO},
                                   @"url": [NSString stringWithFormat:@"https://meet.jit.si/%@",@"parvendra9090"]}];
    
    jitsiMeetView.welcomePageEnabled = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark `- JITSI Delegates

//#if DEBUG

void _onJitsiMeetViewDelegateEvent(NSString *name, NSDictionary *data) {
    NSLog(
          @"[%s:%d] JitsiMeetViewDelegate %@ %@",
          __FILE__, __LINE__, name, data);
}

- (void)conferenceFailed:(NSDictionary *)data {
    _onJitsiMeetViewDelegateEvent(@"CONFERENCE_FAILED", data);
}

- (void)conferenceJoined:(NSDictionary *)data {
    _onJitsiMeetViewDelegateEvent(@"CONFERENCE_JOINED", data);
}

- (void)conferenceLeft:(NSDictionary *)data {
    _onJitsiMeetViewDelegateEvent(@"CONFERENCE_LEFT", data);
    [self.view removeFromSuperview];
}

- (void)conferenceWillJoin:(NSDictionary *)data {
    _onJitsiMeetViewDelegateEvent(@"CONFERENCE_WILL_JOIN", data);
}

- (void)conferenceWillLeave:(NSDictionary *)data {
    _onJitsiMeetViewDelegateEvent(@"CONFERENCE_WILL_LEAVE", data);
}

- (void)loadConfigError:(NSDictionary *)data {
    _onJitsiMeetViewDelegateEvent(@"LOAD_CONFIG_ERROR", data);
}


@end
