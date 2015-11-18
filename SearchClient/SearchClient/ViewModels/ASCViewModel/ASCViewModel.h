//
//  ASCViewModel.h
//  SearchClient
//
//  Created by Alex Hill on 11/17/15.
//  Copyright © 2015 Alex Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASCViewModel;

@protocol ASCViewModelDelegate <NSObject>

- (void)viewModelDidReceiveNewDataSet:(ASCViewModel *)viewModel;
- (void)viewModelDidFailToLoadDataSet:(ASCViewModel *)viewModel error:(NSError *)error;

@end

@interface ASCViewModel : NSObject

@property (nonatomic, weak) id<ASCViewModelDelegate> delegate;

@end
