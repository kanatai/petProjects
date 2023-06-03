import UIKit

enum BankAccountError: Error {
    case insufficientFunds
    case accountClosed
}

class BankAccount {
    var balance: Double
    var accountClosed: Bool
    init(balance: Double, accountClosed: Bool) {
        self.balance = balance
        self.accountClosed = accountClosed
    }
    
    func withdraw(amount: Double) throws {
        if accountClosed {
            throw BankAccountError.accountClosed
        }
        if balance < amount {
            throw BankAccountError.insufficientFunds
        }
        
        balance -= amount
    }
}

let account = BankAccount(balance: 100, accountClosed: false)

do {
    try account.withdraw(amount: 30)
    print(account.balance)
} catch {
    print(error)
}

