//
//  dateFormater.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 05/06/2022.
//

import Foundation
import SwiftUI

struct DateFormatter {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, \nHH:mm"
        return formatter
    }
}
