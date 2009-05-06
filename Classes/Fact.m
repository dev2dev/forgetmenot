// 
//  Fact.m
//  ForgetMeNot
//
//  Created by Anthony Mittaz on 6/05/09.
//  Copyright 2009 Anthony Mittaz. All rights reserved.
//

#import "Fact.h"

#import "Person.h"
#import "FactType.h"

@implementation Fact 

@dynamic fact;
@dynamic id;
@dynamic person;
@dynamic fact_type;
@dynamic keyword;

#pragma mark -
#pragma mark Retrieve a person from it's id

+ (Fact *)factWithID:(NSString *)fact_id forContext:(NSManagedObjectContext *)context
{
	NSString *key = @"id";
	
	NSString *template = [NSString stringWithFormat: @"%@_with_%@",[self description],key];
    
	return (Fact *)[context
					fetchUniqueObjectWithTemplate: template
					parameters: mkdict({key,fact_id})];
}

@end
