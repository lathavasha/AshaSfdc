public class DMLUtilitylast 
    {
        public static void DeleteLeadsByLastName(string lastNameChars)
        {
            if(lastnamechars!=null && lastnamechars!= '')
            {
                lastnamechars += '%';
                Delete[select id,firstname,lastname from Lead where lastname like : lastnamechars];
                List<Lead> lstLeads = [select id,firstname,lastname from Lead where lastname like : lastnameChars];
                system.debug('Collection size is....'+lstLeads.size());
                if(! lstleads.isEmpty())
                {
                    Database.Delete(lstLeads, false);
                }
            }
        }
    }