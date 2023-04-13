//
//  ContactsView.swift
//  AddressBookWithPropertyWrappers
//
//  Created by Ben Stone on 3/3/21.
//

import SwiftUI

struct ContactsView: View {
    // MARK: 4 ENVIRONMENTOBJECT - Add view model
    @EnvironmentObject var viewModel: AddressBookViewModel
    
    var body: some View {
        ForEach(
            0..<viewModel.contactCount,
            id: \.self
        ) { index in //MARK: 5 ENVIRONMENTOBJECT - Use the number of contacts from the view model
            HStack {
                let contact = viewModel.contact(atIndex: index) // MARK: 6 - add contact
                VStack {
                    // MARK: 7 ENVIRONMENTOBJECT - Add the correct name and postal code
                    Text(contact.name)
                    Text(contact.displayPostalCode)
                        .font(.caption2)
                }
                Button(action: {
                    // MARK: 8 ENVIRONMENTOBJECT - Call the appropriate view model method
                    viewModel.toggleFavorite(atIndex: index)
                }) {
                    // MARK: 9 ENVIRONMENTOBJECT - Update the star to be filled when the contact is a favorite
                    contact.isFavorite ? Image(systemName: "star.fill") : Image(systemName: "star")
                }
            }
            .padding()
            .border(Color.black, width: 1)
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView().environmentObject(AddressBookViewModel()) // MARK: 11 ENVIRONMENTOBJECT - Add the view model to the preview
    }
}
