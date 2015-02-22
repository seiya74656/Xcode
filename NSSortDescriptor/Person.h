//
//  Person.h
//  NSSortDescriptor
//
//  Created by Rene Fürst on 17/11/14.
//  Copyright (c) 2014 Rene Fürst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property int alter;

-(id) initWithName:(NSString*)name alter:(int)alter;

@end
