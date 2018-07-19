public class DMLUtility {
    public static void insertbulkleads(integer numberofrecords)
    {
        if(numberofrecords > 0)
        {
            List<Lead> lstLeads = new List<Lead>();
            for(integer counter =1;counter<=numberofrecords;counter++)
            {
                Lead ld = new Lead();
                
                ld.firstname = 'DML';
                ld.Lastname = 'Insert -'+counter;
                ld.company = 'CTS';
                ld.status = 'Open - Not Contacted';
                ld.Email = 'apexrecord'+counter+'@gmail.com';
                ld.Phone = '789456123';
                ld.Fax = '8596321475';
                ld.Rating = 'Hot';
              
                ld.Industry = 'Banking';
                ld.Leadsource = 'Web';
                
               /* if(counter!=99)
                {
                    ld.pan_number__c='ALPPB9329T';
                }*/
                
                  lstLeads.Add(ld);
            }
            
            if(!lstLeads.isEmpty())
            {
                Database.SaveResult[] results = Database.insert(lstLeads, false);
                
                if(!results.isEmpty())
                {
                    for(Database.saveResult res : results)
                    {
                        if(res.isSuccess())
                        {
                            system.debug('Record inserted succesfully,Record is....:'+res.getId());
                        }
                        else
                        {
                            for(Database.Error err : res.getErrors())
                            {
                                system.debug('Error Message is....'+ err.getMessage());
                                system.debug('Error status code is....'+err.getstatuscode());
                                system.debug('Effected fields...:'+err.getFields());
                            }
                        }
                    }
                }
                
                    
            }
        }
    }
                   
    
}