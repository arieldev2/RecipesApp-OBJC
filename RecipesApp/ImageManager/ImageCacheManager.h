//
//  ImageCacheManager.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageCacheManager : NSObject

+ (id)sharedImageCache;

- (nullable UIImage *)getImage:(NSString *)key;
- (void)saveImage:(UIImage *)img key:(NSString *)key;
- (void)removeAll;


@end

NS_ASSUME_NONNULL_END
