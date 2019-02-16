Todos:
- Add CreateAccount Command
- Add RemoveMoney Command
- Add UI to Manage Account
    Create and Add/Remove Money from the Account

Add Login to the App
- Scope the Accounts to the Logged In User
- How handle notion of Logged in w/ this system?
    ie. has_many / belongs_to and scoping

Scope Orders to Logged In User
Use Account to fund the Order
- Question: How use 2 Bounded Contexts Together?
  Orders & Accounts
  Money from Account is required to be used w/ the Order


Notes:
run single test w/ mini-test
`rake test TEST=accounts/test/add_money_to_account_test.rb`

creating event
`Rails.configuration.event_store.publish(InvoicePrinted.new(data: {invoice_number: 'FV-1/12/18'}))`

reading events
`Rails.configuration.event_store.read.to_a`

view events in "event browser"
`visit localhost:3003/res`


# cqrs-es-sample-with-res

CQRS with Event Sourcing sample app using [Rails Event Store](https://railseventstore.org). See it [live](https://cqrs-es-sample-with-res.herokuapp.com/).

[![Build Status](https://travis-ci.com/RailsEventStore/cqrs-es-sample-with-res.svg?branch=master)](https://travis-ci.com/RailsEventStore/cqrs-es-sample-with-res)
[![Maintainability](https://api.codeclimate.com/v1/badges/c444add86606b981e1fb/maintainability)](https://codeclimate.com/github/RailsEventStore/cqrs-es-sample-with-res/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/c444add86606b981e1fb/test_coverage)](https://codeclimate.com/github/RailsEventStore/cqrs-es-sample-with-res/test_coverage)


[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
