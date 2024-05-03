//
//  RecipeDetailHeaderViewModel.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/2/24.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "ImageCacheManager.h"


NS_ASSUME_NONNULL_BEGIN

@interface RecipeDetailHeaderViewModel : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSNumber *prepTimeMinutes;
@property(strong, nonatomic) NSNumber *cookTimeMinutes;
@property(strong, nonatomic) NSNumber *servings;
@property(strong, nonatomic) NSString *difficulty;
@property(strong, nonatomic) NSString *cuisine;
@property(strong, nonatomic) NSNumber *caloriesPerServing;
@property(strong, nonatomic) NSString *urlStringImage;
@property(strong, nonatomic) NSNumber *rating;
@property(strong, nonatomic) NSNumber *reviewCount;

- (void)downloadImage:(void (^)( UIImage * _Nullable image, NSError * _Nullable error))completion stringUrl:(NSString *)stringUrl;

@end

NS_ASSUME_NONNULL_END
