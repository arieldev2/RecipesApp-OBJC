//
//  RecipeService.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import <Foundation/Foundation.h>
#import "Recipe.h"
#import "RecipeServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecipeService : NSObject <RecipeServiceProtocol>

+ (id)sharedService;

- (void)getRecipes:(void (^)( NSArray<Recipe *> * _Nullable recipes, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
