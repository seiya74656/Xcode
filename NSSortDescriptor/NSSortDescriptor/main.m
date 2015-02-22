//
//  main.m
//  NSSortDescriptor
//
//  Created by Rene Fürst on 17/11/14.
//  Copyright (c) 2014 Rene Fürst. All rights reserved.
// https://www.youtube.com/watch?v=OPBChKgHTMw&index=29&list=PLNbdvp4zCu1coG8b-5eXly4X9P9AsG8et&spfreload=10

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Person *person1 = [[Person alloc] initWithName:@"Anna" alter:26];
        Person *person2 = [[Person alloc] initWithName:@"Bettina" alter:22];
        Person *person3 = [[Person alloc] initWithName:@"Jenny" alter:18];
        Person *person4 = [[Person alloc] initWithName:@"Rene" alter:31];
        Person *person5 = [[Person alloc] initWithName:@"Markus" alter:22];
        Person *person6 = [[Person alloc] initWithName:@"Reinhard" alter:46];
        Person *person7 = [[Person alloc] initWithName:@"markus" alter:17];

        NSArray *personen = @[person1, person2, person3, person4, person5, person6, person7];
        NSSortDescriptor *sortname = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
        
        NSSortDescriptor *sortalter = [NSSortDescriptor sortDescriptorWithKey:@"alter" ascending:YES];
 //       NSSortDescriptor *sortNameLength = [NSSortDescriptor sortDescriptorWithKey:@"name.length" ascending:YES];
   
        NSSortDescriptor *sortNameLength = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES comparator:^NSComparisonResult(id obj1, id obj2) {
            if ([obj1 length] < [obj2 length]){
                return NSOrderedAscending;
            } else if ([obj1 length] > [obj2 length]){
                return NSOrderedDescending;
            } else {
                return NSOrderedSame;
            }
        }];
                                            
        NSArray *sortDescriptoren = @[sortNameLength, sortname, sortalter];
        
        NSArray *sortierenPersonen = [personen sortedArrayUsingDescriptors:sortDescriptoren];
        
        NSLog(@" Personen: %@", personen);
        NSLog(@" Personen Sortieren: %@", sortierenPersonen);
        
        
        //NSPREDICATE (Filtermöglichkeiten) , Alles mit Alter über/unter 40 anzeigen

        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"alter < 40"];
        
        NSArray *suchergebnis = [personen filteredArrayUsingPredicate:predicate];
        
        NSLog(@"%@", suchergebnis);
        
        //FILTER NACH NAME [c] ist für eine CaseInSensitive suche
        NSPredicate *suchenachName = [NSPredicate predicateWithFormat:@"name == [c] 'markus'"];
        
        NSArray *suchergebnisName = [personen filteredArrayUsingPredicate:suchenachName];
        
        NSLog(@"Name: %@", suchergebnisName);
        
        //FILTER NACH NAME Länge
        NSPredicate *suchenachNameLaenge = [NSPredicate predicateWithFormat:@"name.length > 5"];
        
        NSArray *suchergebnisNameLaenge = [personen filteredArrayUsingPredicate:suchenachNameLaenge];
        
        NSLog(@"Name: %@", suchergebnisNameLaenge);
        
        
        //FILTER NACH NAME BEGINNT MIT BUCHSTABEN (BEGINSWITH / ENDSWITH / LIKE oder CONTAINS)
        //[c] ist wieder Caseinsensitive.
        NSPredicate *suchenachNameBeginswith = [NSPredicate predicateWithFormat:@"name BEGINSWITH [c] 'R' && name ENDSWITH [c] 'd'"];
        
        NSArray *suchergebnisNameBeginswith = [personen filteredArrayUsingPredicate:suchenachNameBeginswith];
        
        NSLog(@"Name: %@", suchergebnisNameBeginswith);
        
        //FILTER NACH NAME LIKE )
        //[c] ist wieder Caseinsensitive.
        NSPredicate *suchenachNameLike = [NSPredicate predicateWithFormat:@"name Like [c] '???n*'"];
        
        NSArray *suchergebnisNameLike = [personen filteredArrayUsingPredicate:suchenachNameLike];
        
        NSLog(@"Name: %@", suchergebnisNameLike);
 
        //FILTER mit INT z.b arbeiten mit Format Spezifier / Constanten
        int alter = 26;
        NSPredicate *suchenachAlter = [NSPredicate predicateWithFormat:@"alter== %d", alter];
        
        NSArray *suchergebnisAlter = [personen filteredArrayUsingPredicate:suchenachAlter];
        
        NSLog(@"Name: %@", suchergebnisAlter);
        
        
        //Filter Kriterien miteinander Verbinden Alle personen älter als 30 und Namen R , zu verwenden mit AND / OR wie im SQL.
        
        NSPredicate *suchenachAlterName = [NSPredicate predicateWithFormat:@"(alter>30) AND (name CONTAINS [c] 'r')"];
        
        NSArray *suchergebnisAlterName = [personen filteredArrayUsingPredicate:suchenachAlterName];
        
        NSLog(@"Name: %@", suchergebnisAlterName);
        
        //Filter Kriterien miteinander Verbinden mit NOT / !
        
        NSPredicate *suchenachAlterNameNOT = [NSPredicate predicateWithFormat:@"NOT (alter>30) AND (name CONTAINS [c] 'r')"];
        
        NSArray *suchergebnisAlterNameNOT = [personen filteredArrayUsingPredicate:suchenachAlterNameNOT];
        
        NSLog(@"Name: %@", suchergebnisAlterNameNOT);
        
        //Mittels CompundPredicate mehrere Filter miteinander verbinden.
        //andPredicateWithSubpredicates = "and" jeder filter wir mit and verbunden, gibt es auch für "or" (orPredicateWithSubpredicates) und andere. Bei notPredicateWithSubpredicates können keine Array übergeben werden sondern einzelne predicates.
        
        NSPredicate *suchenachAlterNameC = [NSPredicate predicateWithFormat:@"(alter>30)"];
        
        NSPredicate *suchenachAlterNamenC2 = [NSPredicate predicateWithFormat:@"name BEGINSWITH [c] 'r'"];
        NSPredicate *suchenachAlterNamenC3 = [NSPredicate predicateWithFormat:@"name.length < 5"];
        
        NSArray *predicatesVerbinden = @[suchenachAlterNameC, suchenachAlterNamenC2, suchenachAlterNamenC3];
        
        NSPredicate *compPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:predicatesVerbinden];
        
        NSArray *suchergebnisAlterNameC = [personen filteredArrayUsingPredicate:compPredicate];
        
        NSLog(@"CompoundPredicate: %@", suchergebnisAlterNameC);
        
        
        
        //NSMUTABLEARRAY (veränderbares Array)
        
        NSArray *personenMutable = @[person1, person2, person3, person4,person5];
        
        //arrayWirhArray, macht quasi eine Kopie vom NSArray das veränderbar ist
        NSMutableArray *mutArray = [NSMutableArray arrayWithArray:personenMutable];
        
        //2te Version anzulegen
        NSMutableArray *mutArray2 = [@[person1, person2, person3, person4,person5] mutableCopy];
        
        //Objecte hinzufügen
        [mutArray addObject:person6];
        
        [mutArray insertObject:person7 atIndex:2];

        //gezieltes Object Löschen
//        [mutArray removeObject:person1];
        //gezieltes Löschen von einer Index ID
//        [mutArray removeObjectAtIndex:1];
        //löschen vom letzten Object
//        [mutArray removeLastObject];
        //Ersetzen von einem Array eintrag
//        [mutArray replaceObjectAtIndex:1 withObject:person7];
        //Austauschen von 2 Array einträgen
//        [mutArray exchangeObjectAtIndex:0 withObjectAtIndex:3];
        //Array Leeren
//        [mutArray removeAllObjects];
        

        // Array auslesen gewisse Person
        Person *einePerson = personenMutable[2];
        
        NSLog(@"%@", mutArray);

        
        
        
    }
    return 0;
}
