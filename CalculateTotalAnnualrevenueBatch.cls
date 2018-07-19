Global class CalculateTotalAnnualrevenueBatch implements Database.Batchable<Sobject>,database.Stateful 
{
    Global decimal totalAnnualrevenue = 0.0;
    Global Database.QueryLocator Start(Database.batchableContext bContext)
    {
        string accountsQuery = 'select id,name,annualrevenue from Account where annualRevenue!=null';
        return Database.getQueryLocator(accountsquery);
    }
    Global void Execute(Database.BatchableContext bContext, List<Sobject> recordsToProcess)
    {
        if(! recordsToProcess.isEmpty())
        {
         for(SObject accRecord : recordsToProcess)
         {
             Account acc = (Account) accRecord;
             totalAnnualrevenue += acc.annualrevenue;
         }
            
        }
    }

Global void Finish(Database.BatchableContext bContext)
{
   system.debug('Batch Job id is '+bContext.GetJobId());
   AsyncApexJob jobdetails = [select id,status,TotalJobItems,jobItemsProcessed,NumberOfErrors,Createdby.Email from AsyncApexJob where id =: bContext.getJobid()];
}
    
}