//
//  RecipeService.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import "RecipeService.h"
#import "ConstantsEndpoints.h"

@implementation RecipeService

+ (id)sharedService {
    static RecipeService *service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self alloc] init];
    });
    return service;
}

- (void)getRecipes:(nonnull void (^)(NSArray<Recipe *> * _Nullable __strong, NSError * _Nullable __strong))completion {
    NSURL *url = [NSURL URLWithString:ConstantsEndpoints.BASE_URL];
    if(url == nil){
        NSError *err = [[NSError alloc] initWithDomain:@"" code:NSURLErrorBadURL userInfo:@{}];
        completion(nil, err);
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error != nil){
            NSError *err = [[NSError alloc] initWithDomain:@"" code:NSURLErrorBadServerResponse userInfo:@{}];
            completion(nil, err);
        }
        
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        if(res.statusCode != 200){
            NSError *err = [[NSError alloc] initWithDomain:@"" code:NSURLErrorBadServerResponse userInfo:@{}];
            completion(nil, err);
        }
        @try {
            NSError *err;
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            if(result == nil){
                completion(nil, err);
            }
            
            NSMutableArray<Recipe *> *recipes = [[NSMutableArray alloc] init];
            for(NSDictionary *recipe in result[@"recipes"]){
                NSNumber *id = recipe[@"id"];
                NSString *name = recipe[@"name"];
                NSArray<NSString *> *ingredients = recipe[@"ingredients"];
                NSArray<NSString *> *instructions = recipe[@"instructions"];
                NSNumber *prepTimeMinutes = recipe[@"prepTimeMinutes"];
                NSNumber *cookTimeMinutes = recipe[@"cookTimeMinutes"];
                NSNumber *servings = recipe[@"servings"];
                NSString *difficulty = recipe[@"difficulty"];
                NSString *cuisine = recipe[@"cuisine"];
                NSNumber *caloriesPerServing = recipe[@"caloriesPerServing"];
                NSArray<NSString *> *tags = recipe[@"tags"];
                NSString *image = recipe[@"image"];
                NSNumber *rating = recipe[@"rating"];
                NSNumber *reviewCount = recipe[@"reviewCount"];
                NSArray<NSString *> *mealType = recipe[@"mealType"];

                Recipe *newRecipe = Recipe.new;
                newRecipe.id = id;
                newRecipe.name = name;
                newRecipe.ingredients = ingredients;
                newRecipe.instructions = instructions;
                newRecipe.prepTimeMinutes = prepTimeMinutes;
                newRecipe.cookTimeMinutes = cookTimeMinutes;
                newRecipe.servings = servings;
                newRecipe.difficulty = difficulty;
                newRecipe.cuisine = cuisine;
                newRecipe.caloriesPerServing = caloriesPerServing;
                newRecipe.tags = tags;
                newRecipe.image = image;
                newRecipe.rating = rating;
                newRecipe.reviewCount = reviewCount;
                newRecipe.mealType = mealType;
                
                [recipes addObject:newRecipe];
                
            }
            
            completion(recipes, nil);
            
        } @catch (NSException *exception) {
            NSError *err = [[NSError alloc] initWithDomain:@"" code:NSURLErrorCannotDecodeContentData userInfo:@{}];
            completion(nil, err);
        }
        
        
    }];
    
    [task resume];
    
}

@end
