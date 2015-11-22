//
//  ASCSearchView.h
//  SearchClient
//
//  Created by Alex Hill on 10/19/15.
//  Copyright © 2015 Alex Hill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ASCView.h"

@interface ASCSearchView : ASCView

@property (nonatomic) UILabel *titleLabelPrimary;
@property (nonatomic) UILabel *titleLabelSecondary;

- (void)hideSearchTableViewAnimated:(BOOL)animated completion:(void (^)(void))completion;

@end
