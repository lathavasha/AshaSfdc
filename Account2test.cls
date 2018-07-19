@isTest
public class Account2test {
    @isTest
    public static void insertdata(){
        
        
       list<contact> c=new list<contact>();
        contact c1=new contact(lastname='sam');
        contact c2=new contact(lastname='sam');
        c.add(c1);
        c.add(c2);
        System.debug('contacts'+c);
        
       insert c;
        
       Account a=new Account(name='sam');
        insert a;
        
    }

}