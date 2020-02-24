import AccountBank;

class Bank{
    private Customer customers[];
    private int numberOfCustomers;

    public Bank(){
       customers =  new Customer[5];
    }

    public void addCustomer(String firstName, String lastName){
        customers[number] = new Customer(firstName, lastName);
        int number = numberOfCustomers++;
    }

    public int getNumberOfCustomers(){
        return numberOfCustomers;
    }
    
    public Customer getCustomers(int index){
        return customers[index];
    }

}