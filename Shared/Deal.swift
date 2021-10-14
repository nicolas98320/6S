//
//  Deal.swift
//  6S (iOS)
//
//  Created by Nicolas Desormiere on 14/10/21.
//

import SwiftUI

struct Deal: Identifiable, Hashable {
    var id: String { description }
    var name: String
    var description: String
    var image: String
    
    
    static var testData: [Deal]  {
        [
       Deal(name: "Lululemon x Cheddar",
            description: """
            We’re giving you early Beta access to Cheddar, a brand-new deal-discovery and shopping app, built by x15ventures.
            Shop through Cheddar and you’ll receive access to more than 200 deals, with brands such as Stylerunner, Under Armour, Wotif and many more!

            To sweeten the deal, Cheddar in partnership with Lululemon, is excited to offer 15% cashback (up to $40.00) on Lululemon sitewide, with $20.00 extra cashback exclusive to CommBank employees.

            Exclusions
            •    Cheddar is currently only available for iOS users
            """
            , image: "deal1"),
       Deal(name: "CBA Staff Social & Charity Club",
            description: """
            The CBA Staff Social & Charity Club sells discounted movie tickets via their online shop, with a small portion donated to charitable work in the community.

            •    Discounted Physical and E-Ticket Adults and Kid's Movie Tickets
            •    E-Tickets will be emailed to you only within business hours (AEST) after 2pm on the same day as ordering.
            •    Physical tickets have Free Delivery to Internal work address, usually within 3-5 working days of placing your order. If home address, delivery time frames not guaranteed. Express Post available for a fee.
            •    Tickets available for HOYTS, Village, Greater Union, Event Cinema, Birch Carroll & Coyle, Gold Class, LUX, Palace Cinema as well as Candy Bar Vouchers.
            •    By purchasing your Tickets from our Club a small % is apportioned to our Charitable work and we thank you for your support.
            """
            , image: "deal2"),
       Deal(name: "More nbn",
            description: """
            Being proudly part-owned by CBA, the team at More are excited to offer CBA employees 50% off any More nbn™ Broadband plan for the first 6 months and then 10% off for life, PLUS 50% off Google Nest Wifi hardware devices.

            Here are the different NBN plans you can choose from:

            NBN25
            Suitable for: 1-3 users who need fast upload & download speed.
            RRP before discount: $66/mth
            50% promotional discount applied (limited to 6 months): $33/mth
            Ongoing 10% discount applied: $59.40/mth

            NBN50
            Suitable for: 4+ users accessing internet at the same time. Good for transferring large files quickly.
            RRP before discount: $77/mth
            50% promotional discount applied (limited to 6 months): $38.5/mth
            Ongoing 10% discount applied: $69.30/mth

            NBN100
            Suitable for: Larger households with heavy internet use, multiple users / devices & a need for faster download speeds
            RRP before discount: $99/mth
            50% promotional discount applied (limited to 6 months): $49.5/mth
            Ongoing 10% discount applied: $89.10/mth

            *Prices are inclusive of GST
            """
            , image: "deal3"),
       Deal(name: "Flotespace",
            description: """
            Flotespace.com is pleased to offer all CommBank Group staff across Australia a very special deal on New Years Eve Boat Hire. Book before 31 October 2021 and get $500 off the boat cost OR $500 worth of any value-add package, such as a photographer, catering & beverage packages, DJs, water toys, florals and more!

            Flotespace is the leading luxury yacht hire marketplace in Australia, featuring tailored concierge-style service to help you find the perfect boat for your group or special event, in all major cities and boating destinations nationwide.

            Image courtesy of Destination New South Wales
            """
            , image: "deal4")
   ]
    }
}
