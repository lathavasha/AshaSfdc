public class DMLUtilityRestore
    {
        public static void RestoreLeadRecordsByName(string lastNameChars)
        {
            if(lastnamechars!=null && lastnamechars!= '')
            {
                lastnamechars += '%';
                //Delete[select id,firstname,lastname from Lead where lastname like : lastnamechars];//
                List<Lead> lstleads = [select id,firstname,lastname from Lead where lastname like : lastnameChars and isDeleted=true ALL Rows];
                system.debug('Collection size is....'+lstleads.size());
                if(! lstleads.isEmpty())
                {
                  Undelete lstleads;
                }
            }
        }
    }