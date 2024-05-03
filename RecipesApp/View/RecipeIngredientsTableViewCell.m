//
//  RecipeIngredientsTableViewCell.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/2/24.
//

#import "RecipeIngredientsTableViewCell.h"

@implementation RecipeIngredientsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
    }
    return self;
}

+ (nonnull NSString *)identifier {
    return NSStringFromClass([RecipeIngredientsTableViewCell class]);
}

@end
