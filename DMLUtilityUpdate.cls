public class DMLUtilityUpdate 
{
   public static void UpdateContactTitleByEmail(string emailid)
   {
       if(emailid!=null && emailid!='')
       {
           List<Contact> ContactsToUpdate = [select id,firstname,title,email from contact where email =: emailid];
           system.debug('contacts collection size is...'+contactsToUpdate);
           if(! contactsToUpdate.isEmpty())
           {
               for(Contact con:contactsToUpdate)
               {
                   con.Title = 'Sales';
               }
               update contactsToUpdate;
           }
       }
   }
}