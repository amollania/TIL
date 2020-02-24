import AccountBank;

public class BankTest{
public static void main(String[] args){
    Bank bank = new Bank();

    String name[][]= {{"Main", "Hanmi"}, {"Guard", "Dong"}, {"Hong", "Dang"}, {"Hoo", "Tech"}};

    for(int i=0; i<4; i++){
        bank.addCustomer(name[i][0], name[i][1]);
        
    }
}
}