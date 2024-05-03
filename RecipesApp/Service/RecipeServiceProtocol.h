//
//  RecipeServiceProtocol.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import <Foundation/Foundation.h>
#import "Recipe.h"


NS_ASSUME_NONNULL_BEGIN

@protocol RecipeServiceProtocol <NSObject>

+ (id)sharedService;

- (void)getRecipes:(void (^)( NSArray<Recipe *> * _Nullable recipes, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
