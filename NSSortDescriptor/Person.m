//
//  Person.m
//  NSSortDescriptor
//
//  Created by Rene Fürst on 17/11/14.
//  Copyright (c) 2014 Rene Fürst. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)name alter:(int)alter{
    self = [super init];
    
    if(!self) {
    return nil;
    }
    
    self.name = name;
    self.alter = alter;
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ ist %d Jahre alt", self.name, self.alter];
}

@end
