public class childparent {
    public List<contact> cont{get;set;}
    public pageReference show()
    {
        cont =[select id,name,Account.Name,Account.Industry from contact LIMIT 5];
        return null;
    }

}