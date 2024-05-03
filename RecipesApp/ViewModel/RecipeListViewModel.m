//
//  RecipeListViewModel.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import "RecipeListViewModel.h"

@interface RecipeListViewModel ()

@property(strong, nonatomic) id<RecipeServiceProtocol> service;
@property(strong, nullable) NSArray<Recipe *> *recipes;

@end

@implementation RecipeListViewModel

- (nonnull instancetype)initWithService:(nonnull id<RecipeServiceProtocol>)service {
    if(self = [super init]){
        _service = service;
    }
    return self;
}

- (void)getRecipes {
    __typeof(self) __weak weakSelf = self;
    [_service getRecipes:^(NSArray<Recipe *> * _Nullable recipes, NSError * _Nullable error) {
        if(recipes != nil){
            weakSelf.recipes = recipes;
            [weakSelf.delegate update];
        }
    }];
}

- (NSInteger)numberOfRecipes{
    if(_recipes == nil){
        return 0;
    }
    return _recipes.count;
}

- (nullable RecipeCellViewModel *)getByIndexViewModel:(NSInteger)index{
    if(_recipes == nil){
        return nil;
    }
    Recipe *recipe = _recipes[index];
    RecipeCellViewModel *viewModel = RecipeCellViewModel.new;
    viewModel.name = recipe.name;
    viewModel.stringUrlImage = recipe.image;
    viewModel.rating = recipe.rating;
    viewModel.difficulty = recipe.difficulty;
    return viewModel;
}

- (nullable RecipeDetailViewModel *)getByIndexDetailViewModel:(NSInteger)index{
    if(_recipes == nil){
        return nil;
    }
    Recipe *recipe = _recipes[index];
    RecipeDetailViewModel *detailVM = RecipeDetailViewModel.new;
    detailVM.name = recipe.name;
    detailVM.urlStringImage = recipe.image;
    detailVM.ingredients = recipe.ingredients;
    detailVM.instructions = recipe.instructions;
    detailVM.prepTimeMinutes = recipe.prepTimeMinutes;
    detailVM.cookTimeMinutes = recipe.cookTimeMinutes;
    detailVM.servings = recipe.servings;
    detailVM.difficulty = recipe.difficulty;
    detailVM.cuisine = recipe.cuisine;
    detailVM.caloriesPerServing = recipe.caloriesPerServing;
    detailVM.tags = recipe.tags;
    detailVM.rating = recipe.rating;
    detailVM.reviewCount = recipe.reviewCount;
    detailVM.mealType = recipe.mealType;
    return detailVM;
}



@end
