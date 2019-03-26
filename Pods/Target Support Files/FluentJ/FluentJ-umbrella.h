#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FluentJ.h"
#import "JSONSerializationLifecycleProtocol.h"
#import "JSONSerializationProtocol.h"
#import "NSManagedObject+FluentJ.h"
#import "NSObject+FluentJ.h"
#import "NSObject+KVC.h"
#import "NSObject+PredefinedTransformers.h"
#import "NSObject+Update.h"
#import "FJModelValueTransformer.h"
#import "FJValueTransformer.h"
#import "NSValueTransformer+PredefinedTransformers.h"
#import "FJPropertyDescriptor.h"
#import "FluentJConfiguration.h"
#import "NSDictionary+Init.h"
#import "NSObject+Class.h"
#import "NSObject+ClassIdentifier.h"
#import "NSObject+Collection.h"
#import "NSObject+Definition.h"
#import "NSObject+Mutable.h"
#import "NSObject+Properties.h"
#import "NSString+Capitalize.h"

FOUNDATION_EXPORT double FluentJVersionNumber;
FOUNDATION_EXPORT const unsigned char FluentJVersionString[];

