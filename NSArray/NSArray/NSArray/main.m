//
//  main.m
//  NSArray
//
//  Created by Rene Fürst on 17/11/14.
//  Copyright (c) 2014 Rene Fürst. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Std Erstellen
        NSArray *obst3 = [[NSArray alloc] initWithObjects:@"Apfel",@"Birne",@"Kirsche",@"Banane",@"Pfirsich",@"Erdbeere", nil];
        
        //Komfort Inizialisieren
        
        NSArray *obst2 = [NSArray arrayWithObjects:@"Apfel", @"Birne", @"Kirsche", @"Banane", @"Pfirsich", @"Erdbeere", nil];
        
        // Modern Obj-C
        
        NSArray *obst = @[@"Apfel", @"Birne", @"Kirsche", @"Banane", @"Pfirsich", @"Erdbeere"];

        NSArray *zahlen = @[@5, @13, @169, @99, @1089, @7689, @765, @433];
        
        ////////////////
        ////////////////
        ////////////////
        
        NSLog(@"Test %lu", [obst count]);
        
        NSLog(@"Das zweite element %@", [obst objectAtIndex:1]);
        
        NSLog(@"Das letzte element ist %@", [obst objectAtIndex:[obst count]-1]);
        
        NSLog(@"Das letzte element easier %@", [obst lastObject]);

        
        //Array ausgabe
        NSLog(@"%@", obst);
        // macht das selbe wie oberhalb.
        // NSLog(@"%@", [obst description]);
        
        //Test mit for schleife
        for (int i = 0; i < [obst count]; i++) {
            NSLog(@"Das %d Element ist %@ und index %d", i+1, [obst objectAtIndex:i], i);
        }

        
        //Fast Enumeration , vereinfachte for schleife, gibt alles in obst aus.
        
        for (id element in obst){
            NSLog(@"Nur Element: %@", element);
        }
        
        
        //Wenn wir wissen das nur Strings enthalten sind geht auch mit NSString
        for (NSString *element in obst) {
            NSLog(@"mit NSString %@", element);
        }
        
        
        //Beispiel mit verschiedernen Datentypen und Fast Enumeration
        NSString *hugo = @"Eine Zeichenkette deshalb das @";
        NSDate *datum = [NSDate date];
        NSNumber *zahl = @55;
        NSNumber *boolwert = @YES;
        
        
        NSArray *objekte = @[hugo, datum, zahl, boolwert];
        
        for (id elemente in objekte) {
            NSLog(@"Das Objekt %@ gehört zur Klasse %@", elemente, NSStringFromClass([elemente class]) );
        }
        
        
        //Alphabetisch Sortieren
        //NSArray ist INMUTABLE (nicht veränderbar), also muss ein neues angelegt werden für sortierung. (@selector ist eine Methode)
        NSArray *sortAlphabetisch = [obst sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        
        NSLog(@"Sortiertes Array: %@", sortAlphabetisch);
        
        //zahlensortierung für zahlen reicht Compare.
        
        NSArray *sortzahlen = [zahlen sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"%@", sortzahlen);
        
        //umgekehrte zahlen in Block (^    <- Zeichen für einen Block)
        
        NSArray *sortabsteigend = [zahlen sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            if ([obj1 intValue] > [obj2 intValue]) {
                return NSOrderedAscending;
            } else if ([obj1 intValue] < [obj2 intValue])
            {
                return NSOrderedDescending;
            } else {
                return NSOrderedSame;
            }
        }];
        
        NSLog(@"Absteigend %@", sortabsteigend);
        
        
        
        
        
    }
    
    return 0;
}
