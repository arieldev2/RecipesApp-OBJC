//
//  RecipeDetailHeaderUIView.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/2/24.
//

#import "RecipeDetailHeaderUIView.h"

@interface RecipeDetailHeaderUIView ()

@property(strong, nonatomic) UIImageView *recipeImageView;
@property(strong, nonatomic) CAGradientLayer *colorLayer;
@property(strong, nonatomic) UILabel *nameLabel;
@property(strong, nonatomic) UILabel *ratingLabel;
@property(strong, nonatomic) UILabel *cuisineLabel;
@property(strong, nonatomic) UILabel *difficultyLabel;
@property(strong, nonatomic) UILabel *prepTimeMinutesLabel;
@property(strong, nonatomic) UILabel *cookTimeMinutesLabel;
@property(strong, nonatomic) UILabel *caloriesPerServingLabel;
@property(strong, nonatomic) UILabel *reviewCountLabel;
@property(strong, nonatomic) UILabel *servingsLabel;


@end

@implementation RecipeDetailHeaderUIView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
    }
    return self;
}


- (void)configureUI{
    
    _recipeImageView = [[UIImageView alloc] init];
    _recipeImageView.translatesAutoresizingMaskIntoConstraints = false;
    _recipeImageView.contentMode = UIViewContentModeScaleAspectFill;
    _recipeImageView.clipsToBounds = true;
    [self addSubview:_recipeImageView];
    
    _colorLayer = [[CAGradientLayer alloc] init];
    _colorLayer.colors = @[(id)[[UIColor blackColor] colorWithAlphaComponent:0.0].CGColor, (id)[[UIColor blackColor] colorWithAlphaComponent:0.0].CGColor, (id)[[UIColor blackColor] colorWithAlphaComponent:0.0].CGColor, (id)[[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor];
    [_recipeImageView.layer addSublayer:_colorLayer];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    _nameLabel.numberOfLines = 0;
    _nameLabel.textColor = UIColor.whiteColor;
    _nameLabel.font = [UIFont systemFontOfSize:19 weight:UIFontWeightBold];
    [_recipeImageView addSubview:_nameLabel];
    
    _ratingLabel = [[UILabel alloc] init];
    _ratingLabel.translatesAutoresizingMaskIntoConstraints = false;
    _ratingLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self addSubview:_ratingLabel];
    
    _cuisineLabel = [[UILabel alloc] init];
    _cuisineLabel.translatesAutoresizingMaskIntoConstraints = false;
    _cuisineLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self addSubview:_cuisineLabel];
    
    _prepTimeMinutesLabel = [[UILabel alloc] init];
    _prepTimeMinutesLabel.translatesAutoresizingMaskIntoConstraints = false;
    _prepTimeMinutesLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self addSubview:_prepTimeMinutesLabel];
    
    _cookTimeMinutesLabel = [[UILabel alloc] init];
    _cookTimeMinutesLabel.translatesAutoresizingMaskIntoConstraints = false;
    _cookTimeMinutesLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self addSubview:_cookTimeMinutesLabel];
    
    _caloriesPerServingLabel = [[UILabel alloc] init];
    _caloriesPerServingLabel.translatesAutoresizingMaskIntoConstraints = false;
    _caloriesPerServingLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self addSubview:_caloriesPerServingLabel];
    
    _caloriesPerServingLabel = [[UILabel alloc] init];
    _caloriesPerServingLabel.translatesAutoresizingMaskIntoConstraints = false;
    _caloriesPerServingLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self addSubview:_caloriesPerServingLabel];
    
    _servingsLabel = [[UILabel alloc] init];
    _servingsLabel.translatesAutoresizingMaskIntoConstraints = false;
    _servingsLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self addSubview:_servingsLabel];
    
    _difficultyLabel = [[UILabel alloc] init];
    _difficultyLabel.translatesAutoresizingMaskIntoConstraints = false;
    _difficultyLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self addSubview:_difficultyLabel];
    
    _reviewCountLabel = [[UILabel alloc] init];
    _reviewCountLabel.translatesAutoresizingMaskIntoConstraints = false;
    _reviewCountLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self addSubview:_reviewCountLabel];
    

}

- (void)configureViewModel:(RecipeDetailHeaderViewModel *)viewModel{
    _nameLabel.text = viewModel.name;
    _ratingLabel.text = [NSString stringWithFormat:@"Rating: %@", viewModel.rating.stringValue];
    _cuisineLabel.text = [NSString stringWithFormat:@"Cuisine: %@", viewModel.cuisine];
    _prepTimeMinutesLabel.text = [NSString stringWithFormat:@"Prep Time: %@ min", viewModel.prepTimeMinutes];
    _cookTimeMinutesLabel.text = [NSString stringWithFormat:@"Cook time: %@ min", viewModel.cookTimeMinutes];
    _caloriesPerServingLabel.text = [NSString stringWithFormat:@"Calories: %@", viewModel.caloriesPerServing];
    _servingsLabel.text = [NSString stringWithFormat:@"Servings: %@", viewModel.servings.stringValue];
    _difficultyLabel.text = [NSString stringWithFormat:@"Difficulty: %@", viewModel.difficulty];
    _reviewCountLabel.text = [NSString stringWithFormat:@"Reviews: %@", viewModel.reviewCount.stringValue];
    
    __typeof(self) __weak weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewModel downloadImage:^(UIImage * _Nullable image, NSError * _Nullable error) {
            if(image != nil){
                weakSelf.recipeImageView.image = image;
            }
        } stringUrl:viewModel.urlStringImage];
    });
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [NSLayoutConstraint activateConstraints:@[
        [_recipeImageView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [_recipeImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_recipeImageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [_recipeImageView.heightAnchor constraintEqualToConstant:400],
        
        [_nameLabel.leadingAnchor constraintEqualToAnchor:_recipeImageView.leadingAnchor constant:10],
        [_nameLabel.trailingAnchor constraintEqualToAnchor:_recipeImageView.trailingAnchor constant:-10],
        [_nameLabel.bottomAnchor constraintEqualToAnchor:_recipeImageView.bottomAnchor constant:-10],
        
        [_cuisineLabel.topAnchor constraintEqualToAnchor:_recipeImageView.bottomAnchor constant:10],
        [_cuisineLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [_cuisineLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5],
        
        [_ratingLabel.topAnchor constraintEqualToAnchor:_recipeImageView.bottomAnchor constant:10],
        [_ratingLabel.leadingAnchor constraintEqualToAnchor:_cuisineLabel.trailingAnchor constant:10],
        [_ratingLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5],
        
        [_prepTimeMinutesLabel.topAnchor constraintEqualToAnchor:_cuisineLabel.bottomAnchor constant:10],
        [_prepTimeMinutesLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [_prepTimeMinutesLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5],
        
        [_cookTimeMinutesLabel.topAnchor constraintEqualToAnchor:_ratingLabel.bottomAnchor constant:10],
        [_cookTimeMinutesLabel.leadingAnchor constraintEqualToAnchor:_prepTimeMinutesLabel.trailingAnchor constant:10],
        [_cookTimeMinutesLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5],
        
        [_caloriesPerServingLabel.topAnchor constraintEqualToAnchor:_prepTimeMinutesLabel.bottomAnchor constant:10],
        [_caloriesPerServingLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [_caloriesPerServingLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5],
        
        [_servingsLabel.topAnchor constraintEqualToAnchor:_cookTimeMinutesLabel.bottomAnchor constant:10],
        [_servingsLabel.leadingAnchor constraintEqualToAnchor:_caloriesPerServingLabel.trailingAnchor constant:10],
        [_servingsLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5],
        
        [_difficultyLabel.topAnchor constraintEqualToAnchor:_caloriesPerServingLabel.bottomAnchor constant:10],
        [_difficultyLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
        [_difficultyLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5],
        
        [_reviewCountLabel.topAnchor constraintEqualToAnchor:_servingsLabel.bottomAnchor constant:10],
        [_reviewCountLabel.leadingAnchor constraintEqualToAnchor:_difficultyLabel.trailingAnchor constant:10],
        [_reviewCountLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5],

    ]];
    
    _colorLayer.frame = _recipeImageView.bounds;
}

@end
