//
//  NSFetchedResultsController.swift
//  
//
//  Created by Anna Münster on 19.01.23.
//

import CoreData

/**
 Überprüfung, ob der gegebene IndexPath im Controller existiert.
 
 - Parameter indexPath: IndexPath, der überprüft wird
 
 - Returns: Bool für Bestehen
 */
public extension NSFetchedResultsController {
    @objc func isValid(indexPath: IndexPath) -> Bool {
        if let sections = self.sections,
           indexPath.section < sections.count,
           indexPath.row < sections[indexPath.section].numberOfObjects {
            return true
        }
        return false
    }
}
