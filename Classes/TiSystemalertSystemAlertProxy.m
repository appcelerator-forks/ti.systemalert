/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2018 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiSystemalertSystemAlertProxy.h"
#import "TiUtils.h"

@implementation TiSystemalertSystemAlertProxy

#pragma mark Proxy Lifecycle

- (void)_destroy
{
  AudioServicesDisposeSystemSoundID(_sound);
  _url = nil;

  [super _destroy];
}

#pragma mark Public API's

- (NSString *)url
{
  return [_url absoluteString];
}

- (void)setUrl:(id)url
{
  // Handle string url
  if ([url isKindOfClass:[NSString class]]) {
    _url = [TiUtils toURL:url proxy:self];

    if ([_url isFileURL] == NO) {
      // we need to download it and save it off into temp file
      NSData *data = [NSData dataWithContentsOfURL:_url];
      NSString *ext = [[[_url path] lastPathComponent] pathExtension];
      TiFile *tempFile = [TiFile createTempFile:ext]; // file auto-deleted on release
      [data writeToFile:[tempFile path] atomically:YES];
      _url = [NSURL fileURLWithPath:[tempFile path]];
    }

    // Handle file blob
  } else if ([url isKindOfClass:[TiBlob class]]) {
    TiBlob *blob = (TiBlob *)url;
    if ([blob type] == TiBlobTypeFile) {
      _url = [NSURL fileURLWithPath:[blob path]];
    }

    // Handle file object
  } else if ([url isKindOfClass:[TiFile class]]) {
    _url = [NSURL fileURLWithPath:[(TiFile *)url path]];
  }

  // Dispose sound before re-referencing
  AudioServicesDisposeSystemSoundID(_sound);
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)_url, &_sound);
}

- (void)play:(NSArray *)unused
{
  if (_url == nil) {
    NSLog(@"[ERROR] Trying to play a system alert without having specified the `url` property. Skipping playback.");
    return;
  }

  AudioServicesPlayAlertSound(_sound);
}

@end
