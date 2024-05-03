//
//  RecipeSectionsViewModel.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/3/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecipeSectionsViewModel : NSObject

@property(strong, nonatomic) NSString *titleSection;
@property(strong, nonatomic) NSArray<NSString *> *contentRow;

@end

NS_ASSUME_NONNULL_END
