public class AnimalLocator{
    public static String getAnimalNameById(Integer x){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + x);
        req.setMethod('GET');
        System.debug('req'+req);
        Map<String, Object> animal= new Map<String, Object>();
        HttpResponse res = http.send(req);
        system.debug('responsebody'+res.getBody());
            if (res.getStatusCode() == 200) {
             Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
             animal = (Map<String, Object>) results.get('animal');
             system.debug('Animal received'+animal);    
        }
			return (String)animal.get('name');
    }
}