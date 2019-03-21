// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#import "MSDataSourceError.h"
#import "MSDataStoreErrors.h"

/**
 * CosmosDb Http code key.
 */
static NSString *const kMSCosmosDbHttpCodeKey = @"com.Microsoft.AppCenter.HttpCodeKey";

@implementation MSDataSourceError

@synthesize error = _error;
@synthesize errorCode = _errorCode;

- (instancetype)initWithError:(NSError *)error {
  return [self initWithError:error errorCode:[MSDataSourceError errorCodeWithError:error]];
}
- (instancetype)initWithError:(NSError *)error errorCode:(NSInteger)errorCode {
  if ((self = [super init])) {
    _error = error;
    _errorCode = errorCode;
  }
  return self;
}

+ (NSInteger)errorCodeWithError:(NSError *)error {
  if (error == nil) {
    return kMSACDocumentSucceededErrorCode;
  }
  return (NSInteger)[error userInfo][kMSCosmosDbHttpCodeKey];
}

@end