/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2018 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiProxy.h"
#import <AudioToolbox/AudioServices.h>

@interface TiSystemalertSystemAlertProxy : TiProxy {
  @private
  NSURL *_url;
  SystemSoundID _sound;
}

#pragma mark Public API's

- (void)play:(NSArray *)unused;

@end
