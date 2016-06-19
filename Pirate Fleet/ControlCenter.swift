//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let smallShip = Ship(length: 2, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 4, y: 0), isVertical: true)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 2, y: 0), isVertical: true)
        let largeShip = Ship(length: 4, location: GridLocation(x: 4, y: 4), isVertical: false)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 2, y: 7), isVertical: false)
        
        let mine1 = Mine(location: GridLocation(x: 3, y: 0), explosionText: "Chill out")
        let mine2 = Mine(location: GridLocation(x: 3, y: 4), explosionText: "Got you")
        
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let totalEnemyShips = 5
        let totalHumanShips = 5
        
        let totalEnemyShipsSunk = (totalEnemyShips - gameStats.enemyShipsRemaining)
        let totalHumanShipsRemaining = (totalHumanShips - gameStats.humanShipsSunk)
        let totalHumanGuesses = (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman)
        
        finalScore = (totalEnemyShipsSunk * gameStats.sinkBonus) + (totalHumanShipsRemaining * gameStats.shipBonus) - (totalHumanGuesses * gameStats.guessPenalty)
        
        return finalScore
    }
}