/**
 *  Resistance
 *  Copyright (c) Matt Malenko 2021
 *  MIT license, see LICENSE file for details
 */

import Foundation

extension Array where Element: Comparable {
    func binarySearchForward(element: Element) -> Int? {
        var low = 0
        var high = count - 1
        var mid = Int(high / 2)
        
        while low <= high {
            let midElement = self[mid]
            if element == midElement {
                return mid
            }
            else if element < midElement {
                high = mid - 1
            }
            else {
                low = mid + 1
            }
            mid = (low + high) / 2
        }
        return nil
    }
    
    func binarySearchReverse(element: Element) -> Int? {
        var low = 0
        var high = count - 1
        var mid = Int(high / 2)
        
        while low <= high {
            let midElement = self[mid]
            if element == midElement {
                return mid
            }
            else if element > midElement {
                high = mid - 1
            }
            else {
                low = mid + 1
            }
            mid = (low + high) / 2
        }
        return nil
    }
}
