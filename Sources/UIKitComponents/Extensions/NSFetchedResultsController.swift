//
//  NSFetchedResultsController.swift
//  
//
//  Created by Anna Münster on 19.01.23.
//

import CoreData

public extension NSFetchedResultsController {
    /**
     Checks if given IndexPath exists in the current controller.
     */
    @objc func isValid(indexPath: IndexPath) -> Bool {
        if let sections = self.sections,
           indexPath.section < sections.count,
           indexPath.row < sections[indexPath.section].numberOfObjects {
            return true
        }
        return false
    }
}
