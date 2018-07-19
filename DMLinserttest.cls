public class DMLinserttest {
     public static void insertleadstest(integer numberofRecords)
     {
         if(numberofRecords > 0)
         {
             List<Lead> lstLeads = new List<Lead>();
             for(integer counter =1; counter<=numberofRecords;counter++)
             {
                Lead ld = new Lead();
                 ld.FirstName = 'Asha';
                 ld.LastName = 'Latha';
                 ld.company = 'TCS';
                 lstLeads.add(ld);
             }
             if(!lstLeads.isEmpty())
             {
                  Database.SaveResult[] results = Database.insert(lstLeads,false);
                 if(! results.isEmpty())
                 {
                     for(Database.saveResult res: results)
                     {
                         if(res.isSuccess())
                         {
                             system.debug('Record Inserted Successfully. Record Id is...:'+res.getid());
                         }
                         else
                         {
                             for(Database.Error err : res.getErrors())
                             {
                                 system.debug('Error Message is.....:'+ err.getMessage());
                                 system.debug('Error Status code is.....:'+err.getstatuscode());
                                 system.debug('Effected Fields...:'+err.getFields());
                             }
                         }
                      
                         }
                     }
                 }
             }
         }
     }