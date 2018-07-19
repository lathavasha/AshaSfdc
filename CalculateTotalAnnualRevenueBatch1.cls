Global class CalculateTotalAnnualRevenueBatch1 implements Database.Batchable<SObject>, Database.Stateful
{
      Global decimal totalAnnualRevenue = 0.0;
      Global Database.QueryLocator Start(Database.BatchableContext bContext)
      {
          string accountsQuery = 'select id,name,annualrevenue from Account where annualrevenue!=null';
          return Database.getQueryLocator(accountsQuery);
      }
    Global void Execute(Database.BatchableContext bContext, List<SObject> recordsToProcess)
    {
        if(! recordsToProcess.isEmpty())
        {
        for(Sobject accRecord:recordsToProcess)
            {
               Account acc = (Account) accRecord;
                totalAnnualrevenue += acc.annualrevenue;
            }
        }
    }
 Global void Finish(Database.BatchableContext bContext)
 {
     system.debug('Batch Job Id is......:'+bContext.GetJobId());
     AsyncApexJob jobDetails = [select id,status,TotalJobItems,jobItemsProcessed,NumberOfErrors,Createdby.Email from AsyncApexJob where id=:bContext.GetJobId()];
     
 }
    
}