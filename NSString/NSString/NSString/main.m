//
//  main.m
//  NSString
//
//  Created by Rene Fürst on 13/11/14.
//  Copyright (c) 2014 Rene Fürst. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *beispielText = @"Ich bin ein Text";

        NSUInteger anzahlZeichen = [beispielText length];
        
        NSLog(@"Zeichenanzahl ist %d", anzahlZeichen);
        
        char zeichen = [beispielText characterAtIndex:6];
        NSLog(@"%c", zeichen);
        
        for (int i=0;i<[beispielText length]; i++)
        {
            char zeichen = [beispielText characterAtIndex:i];
            NSLog(@" %d Zeichen %c",i+1, zeichen);
        }
            
            
    }
    return 0;
}
