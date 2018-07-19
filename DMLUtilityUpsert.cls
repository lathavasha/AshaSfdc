public class DMLUtilityUpsert {
    public static void upsertLeadRecords()
    {
        list<Lead> ldsToUpsert = new List<Lead>();
        for(Lead ld : [select id,FirstName,LastName, Company,title,email from Lead])
        {
            ld.email = 'asha@gmail.com';
            ldsToUpsert.Add(ld);
        }
        
        Lead ld = new Lead();
        ld.FirstName = 'Divija';
         ld.LastName = 'Prasunna';
         ld.Company = 'TCS';
        ldsToUpsert.Add(ld);
        if(! ldsToUpsert.isEmpty())
        {
            Upsert ldsToupsert;
        }
    }

}