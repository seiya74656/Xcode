//
//  main.m
//  NSDictionary
//
//  Created by Rene Fürst on 19/11/14.
//  Copyright (c) 2014 Rene Fürst. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary *buch =  [[NSDictionary alloc] initWithObjectsAndKeys:@"Anna", @"name", [NSNumber numberWithInt:40], @"alter", nil];
        
        NSDictionary *buch2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Anna COmfort Init", @"name", nil];
        
        NSDictionary *buch3 = @{@"name" : @"Anna Modern Obj-C", @"alter": @40};
    
        NSLog(@"%@", buch);
        NSLog(@"%@", buch2);
        NSLog(@"%@", buch3);
        
        NSLog(@"Nur den Namen auslesen (alte Version) %@", [buch3 objectForKey:@"name"]);
        NSLog(@"In Modern Obj-C %@ %d", buch3[@"name"], [buch3[@"alter"] intValue]);
        
        //Zeigt alle Keys an
        NSLog(@"Schlüssel: %@ mit dem Wert %@", [buch3 allKeys], [buch3 allValues]);
        
        NSEnumerator *enumerator = [buch3 keyEnumerator];
        id key;
        
        while ((key = [enumerator nextObject])) {
            /* code that uses the returned key */
            NSLog(@"%@", key);
        }
        
        
        //NSMutableDIctionary
        
        NSString *haustier = @"Katze";
        
        NSMutableDictionary *haustierDic =  [@{@"name" : @"Anna", @"alter" : @22, @"name" : @"Rene"} mutableCopy];
        
        [haustierDic setObject:haustier forKey:@"haustier"];
        
        [haustierDic setObject:@"Tiger" forKey:@"haustier"];
        
        [haustierDic removeObjectForKey:@"haustier"];
        
        NSLog(@"%@", haustierDic);
        
        
        
    }
    return 0;
}
