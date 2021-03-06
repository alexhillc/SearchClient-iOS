//
//  ASCWebSearchResultModel.m
//  SearchClient
//
//  Created by Alex Hill on 11/16/15.
//  Copyright © 2015 Alex Hill. All rights reserved.
//

#import "ASCWebSearchResultModel.h"

@implementation ASCWebSearchResultModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        self.bingSearchResultClass = [[dic valueForKey:@"__metadata"] valueForKey:@"type"];
        self.searchId = [dic valueForKey:@"ID"];
        self.displayUrl = [dic valueForKey:@"DisplayUrl"];
        self.url = [NSURL URLWithString:[dic valueForKey:@"Url"]];
        
        NSArray *keys = [[NSArray alloc] initWithObjects:NSFontAttributeName, nil];
        NSArray *objects = [[NSArray alloc] initWithObjects:[UIFont boldSystemFontOfSize:14.], nil];
        NSArray *objectsTitle = [[NSArray alloc] initWithObjects:[UIFont boldSystemFontOfSize:16.], nil];
        
        NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:[dic valueForKey:@"Title"]];
        [attributedTitle replaceOccurancesOfBeginningTag:@"\uE000" endingTag:@"\uE001" withAttributes:[NSDictionary dictionaryWithObjects:objectsTitle forKeys:keys]];
        self.title = [attributedTitle copy];
        
        NSMutableAttributedString *attributedDesc = [[NSMutableAttributedString alloc] initWithString:[dic valueForKey:@"Description"]];
        [attributedDesc replaceOccurancesOfBeginningTag:@"\uE000" endingTag:@"\uE001" withAttributes:[NSDictionary dictionaryWithObjects:objects forKeys:keys]];
        self.searchDesc = [attributedDesc copy];
    }
    
    return self;
}

@end
