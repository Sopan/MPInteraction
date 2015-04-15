//
//  ViewController.h
//  MPInteraction
//
//  Created by Sopan Shekhar Sharma on 7/30/14.
//  Copyright (c) 2014 Sopan Shekhar Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ViewController : UIViewController <MCBrowserViewControllerDelegate>

- (IBAction)browseForDevices:(id)iSender;

@end

