//
//  main.m
//  SnakesandLadders
//
//  Created by Daniel Grosman on 2017-11-03.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL game = YES;
        PlayerManager *playerManager = [[PlayerManager alloc] init];
        
        while (game){
        NSLog(@"Welcome to Snakes & Ladders!");
        NSLog(@"How many players are in this game?");
        char numOfPlayers[10];
        fgets (numOfPlayers, 10, stdin);
        NSString *numberOfPlayers = [[NSString alloc] initWithUTF8String:numOfPlayers];
        numberOfPlayers = [numberOfPlayers stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
        while (YES){
        if ([numberOfPlayers intValue]) {
        NSInteger intNumberOfPlayers = [numberOfPlayers intValue];
        [playerManager createPlayers:intNumberOfPlayers];
            break;
        }
            else {
                NSLog(@"Invalid Input");
                NSLog(@"How many players are in this game");
                char numOfPlayers [10];
                fgets(numOfPlayers, 10, stdin);
                numberOfPlayers = [NSString stringWithUTF8String:numOfPlayers];
            }
        }
               while (YES) {
            NSLog(@"Please type 'roll' or 'r'");
            char newTurn[20];
            fgets (newTurn, 120, stdin);
            NSString *userAction = [[NSString alloc] initWithUTF8String:newTurn];
            userAction = [userAction stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
            if ([[userAction lowercaseString] hasPrefix:@"r"]) {
                [playerManager rollDice];
            }
            
        }
        
    }
        }
    return 0;
}

