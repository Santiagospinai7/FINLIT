// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AccountCardController from "./account_card_controller"
application.register("account-card", AccountCardController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SelectAccountsController from "./select_accounts_controller"
application.register("select-accounts", SelectAccountsController)

import SelectTransactionsController from "./select_transactions_controller"
application.register("select-transactions", SelectTransactionsController)
