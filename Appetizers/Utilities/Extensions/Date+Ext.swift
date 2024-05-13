//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Saar Bibla on 5/10/24.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    var oneHundreedTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!

    }
}
