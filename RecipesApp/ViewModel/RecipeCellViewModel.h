//
//  RecipeCellViewModel.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageCacheManager.h"


NS_ASSUME_NONNULL_BEGIN

@interface RecipeCellViewModel : NSObject

@property(strong, nonnull) NSString *stringUrlImage;
@property(strong, nonnull) NSString *name;
@property(strong, nonnull) NSNumber *rating;
@property(strong, nonatomic) NSString *difficulty;


- (void)downloadImage:(void (^)( UIImage * _Nullable image, NSError * _Nullable error))completion stringUrl:(NSString *)stringUrl;

@end

NS_ASSUME_NONNULL_END
