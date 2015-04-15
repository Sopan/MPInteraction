//
//  ViewController.m
//  MPInteraction
//
//  Created by Sopan Shekhar Sharma on 7/30/14.
//  Copyright (c) 2014 Sopan Shekhar Sharma. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	
	[self.appDelegate.clientManager setupPeerWithDisplayName:[UIDevice currentDevice].name];
	[self.appDelegate.clientManager setupSession];
	[self.appDelegate.clientManager advertiseSelf:YES];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(peerChangedStateWithNotification:)
												 name:@"DidChangeStateNotification"
											   object:nil];
}


- (IBAction)browseForDevices:(id)sender {
	if (self.appDelegate.clientManager.session != nil) {
		[[self.appDelegate clientManager] setupBrowser];
		[[[self.appDelegate clientManager] browser] setDelegate:self];
		
		[self presentViewController:self.appDelegate.clientManager.browser
						   animated:YES
						 completion:nil];
	}
}


#pragma mark - MCBrowserViewControllerDelegate

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)iBrowserViewController {
	[self.appDelegate.clientManager.browser dismissViewControllerAnimated:YES completion:nil];
}


- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)iBrowserViewController {
	[self.appDelegate.clientManager.browser dismissViewControllerAnimated:YES completion:nil];
}


- (void)peerChangedStateWithNotification:(NSNotification *)notification {
	
}


@end
