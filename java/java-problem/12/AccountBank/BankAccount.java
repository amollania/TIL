import AccountBank;

class BankAccount{
    //잔액
    private int balance;

    //생성자
    public BankAccount(int balance){
        this.balance = balance;
    }

    // 현재 계좌의 잔액
    public int getBalance(){
        return balance;
    }

    // 입금 메소드
    public void deposit(int amount){
        balance += amount;
    }
    
    public boolean withdraw(int amount){
        if(amount > balance){
            return false;
        } else {
            balance -= amount;
        } return true;
    }

    public boolean transfer(int amount, BankAccount otherAccount){
       if (amount > balance){
           return false;
       } else {
           otherAccount.deposit(amount);
           balance -= amount;
           return true;
       }
    }
}