import AccountBank;

class Customer{
    private String firstName;
    private String lastName;
    private BankAccount account;

    public Customer(String firstName, String lastName){
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getFirstName(){
        return firstName;
    }

    public String getLastName(){
        return lastName;
    }
    
    public void setAccount(BankAccount account){
        this.account = account;
    }

    public BankAccount getAccount(){
        return account;
    }

    public String toString(){
        return "고객의 이름 " + firstName + lastName + "고객의 계좌 " + account + "의 잔액 " + balance;
    }
}