# run this file with
# irb -r "./bank-accounts.rb"

module Bank

  class Account
    attr_reader :balance, :owner

    def initialize(ident, balance = 0)  # optional parameter
      @ident = ident
      @balance = balance
      raise ArgumentError.new("Your intial balance can't be negative") if balance < 0
    end

    def assign_owner(person) # pass in an instance of Owner
      @owner = person
      puts "The other of the account is #{@owner.first_name} #{@owner.last_name}"
    end

    def withdraw(withdraw_amount)
      if @balance - withdraw_amount < 0
        puts "Insufficient funds. Withdraw denied."
        @balance
      else
        @balance -= withdraw_amount
      end
    end

    def deposit(deposit_amount)
      @balance += deposit_amount
    end
  end

  class Owner
    attr_reader :first_name, :last_name, :address_one, :address_two, :city, :state, :zip

    def initialize(owner_hash)
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @address_one = owner_hash[:address_one]
      @address_two = owner_hash[:address_two]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
      @zip = owner_hash[:zip]
    end

  end

end


### example ###
### global variables are used for availability in irb ###

JENNA_ACCT = Bank::Account.new("Jenna ID", 1200)

jenna_info = {
  first_name: "Jenna",
  last_name: "Nichols",
  address_one: "4900 Linden Ave N",
  city: "Seattle",
  state: "WA",
  zip: "98103"
}

JENNA_OWNER = Bank::Owner.new(jenna_info)

# can assign JENNA_OWNER to JENNA_ACCT as follows
# JENNA_ACCT.assign_owner(JENNA_OWNER)
