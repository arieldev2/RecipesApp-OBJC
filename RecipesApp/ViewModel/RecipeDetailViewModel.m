//
//  RecipeDetailViewModel.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import "RecipeDetailViewModel.h"

@interface RecipeDetailViewModel ()

@property(strong, nonatomic) NSArray<RecipeSectionsViewModel *> *sections;

@end

@implementation RecipeDetailViewModel

- (RecipeDetailHeaderViewModel *)headerViewModel{
    RecipeDetailHeaderViewModel *headerVM = RecipeDetailHeaderViewModel.new;
    headerVM.name = _name;
    headerVM.urlStringImage = _urlStringImage;
    headerVM.prepTimeMinutes = _prepTimeMinutes;
    headerVM.cookTimeMinutes = _cookTimeMinutes;
    headerVM.servings = _servings;
    headerVM.difficulty = _difficulty;
    headerVM.cuisine = _cuisine;
    headerVM.caloriesPerServing = _caloriesPerServing;
    headerVM.rating = _rating;
    headerVM.reviewCount = _reviewCount;
    return headerVM;
}

- (void)setupSections:(NSArray<NSString *> *)instructions ingredients:(NSArray<NSString *> *)ingredients{
    RecipeSectionsViewModel *ingredientsVM = RecipeSectionsViewModel.new;
    ingredientsVM.titleSection = @"Ingredients";
    ingredientsVM.contentRow = ingredients;
    RecipeSectionsViewModel *instructionsVM = RecipeSectionsViewModel.new;
    instructionsVM.titleSection = @"Instructions";
    instructionsVM.contentRow = instructions;
    _sections = @[
        ingredientsVM,
        instructionsVM
    ];
}

- (NSUInteger)numberOfRows:(NSInteger)index{
    return _sections[index].contentRow.count;
}

- (NSInteger)numberOfSections {
    return _sections.count;
}

- (NSString *)infoRow:(NSIndexPath *)indexPath{
    return _sections[indexPath.section].contentRow[indexPath.row];
}

- (NSString *)titleSection:(NSInteger)index{
    return _sections[index].titleSection;
}

@end
