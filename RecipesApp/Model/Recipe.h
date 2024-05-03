//
//  Recipe.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Recipe : NSObject

@property(strong, nonatomic) NSNumber *id;
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSArray<NSString *> *ingredients;
@property(strong, nonatomic) NSArray<NSString *> *instructions;
@property(strong, nonatomic) NSNumber *prepTimeMinutes;
@property(strong, nonatomic) NSNumber *cookTimeMinutes;
@property(strong, nonatomic) NSNumber *servings;
@property(strong, nonatomic) NSString *difficulty;
@property(strong, nonatomic) NSString *cuisine;
@property(strong, nonatomic) NSNumber *caloriesPerServing;
@property(strong, nonatomic) NSArray<NSString *> *tags;
@property(strong, nonatomic) NSString *image;
@property(strong, nonatomic) NSNumber *rating;
@property(strong, nonatomic) NSNumber *reviewCount;
@property(strong, nonatomic) NSArray<NSString *> *mealType;

@end

NS_ASSUME_NONNULL_END
