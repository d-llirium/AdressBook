//
//  AddressBookViewModel.swift
//  AddressBookViewModel
//
//  Created by Ben Stone on 2/12/21.
//

import Foundation

class AddressBookViewModel { // TODO: Conform to a protocol so that the view can observe changes
    var addressBook = AddressBook() // TODO: Add a property wrapper so that changes will be published
    
    var contactCount: Int { addressBook.numberOfContacts }
    
    var favoritedContactCount: Int { addressBook.numberOfFavorites }
    
    func toggleFavorite(atIndex index: Int) {
        addressBook.toggleFavorite(atIndex: index)
    }
    
    func contact(atIndex index: Int) -> Contact {
        addressBook.contact(atIndex: index)
    }
        
    func contactIsFavorite(atIndex index: Int) -> Bool {
        addressBook.contactIsFavorite(atIndex: index)
    }
}
