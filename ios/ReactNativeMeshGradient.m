#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
 
@interface RCT_EXTERN_MODULE(ReactNativeMeshGradient, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(points, NSArray)
RCT_EXPORT_VIEW_PROPERTY(colors, NSArray)
RCT_EXPORT_VIEW_PROPERTY(animatedColors, NSArray)
RCT_EXPORT_VIEW_PROPERTY(animationDuration, NSNumber)
 
@end
