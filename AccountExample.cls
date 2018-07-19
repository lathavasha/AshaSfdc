public class AccountExample {
  public static void Accountex(){
        list<Account> accs=[select id,name from Account limit 10];
        System.debug('accs'+accs);
    }
}