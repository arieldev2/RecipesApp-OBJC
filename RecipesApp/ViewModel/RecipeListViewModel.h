//
//  RecipeListViewModel.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import <Foundation/Foundation.h>
#import "RecipeServiceProtocol.h"
#import "RecipeCellViewModel.h"
#import "RecipeDetailViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RecipeListViewModelDelegate <NSObject>

- (void)update;

@end

@interface RecipeListViewModel : NSObject

- (instancetype)initWithService:(id<RecipeServiceProtocol>)service;
@property(weak, nonatomic) id<RecipeListViewModelDelegate> delegate;

- (void)getRecipes;
- (NSInteger)numberOfRecipes;
- (nullable RecipeCellViewModel *)getByIndexViewModel:(NSInteger)index;
- (nullable RecipeDetailViewModel *)getByIndexDetailViewModel:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
