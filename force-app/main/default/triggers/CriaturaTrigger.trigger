trigger CriaturaTrigger on Criatura__c (after insert, after update, after delete) {

    
		//Identificar os bunkers
		Map<id,Bunker__c> bunkersUpdateMap = new Map<id,Bunker__c>();
    	
    
		for (Criatura__c cr : trigger.new)
            {
                //INSERT E UPDATE
                
                
                Criatura__c nova = cr;
                Criatura__c antiga = trigger.oldMap.get(nova.Id);
                
                if(nova.Bunker__c != antiga.Bunker__c)
               		 bunkersUpdateMap.put(cr.Bunker__c,new Bunker__c(id = cr.bunker__c));
                
            }
    
   		 for (Criatura__c cr : trigger.old) {
             
             if (trigger.isDelete && cr.bunker__c != null)
                 bunkersUpdateMap.put(cr.Bunker__c,new Bunker__c(id = cr.bunker__c));
                 
         } 
    
    
    	List<Bunker__c> bkList = [SELECT id, (SELECT id FROM Criaturas__r ) FROM bunker__c where id in: bunkersUpdateMap.keySet() ];
    	for (Bunker__c bk : bkList)
            {
                bunkersUpdateMap.get(bk.id).Populacao__c = bk.Criaturas__r.size();
                
            }
    
    	update bunkersUpdateMap.values();
    
		//Totalizar todas as criaturas dos bunker identificados
		//Atualizar os Bunkers    
    
    	
        //List<Criatura__c> criList =[ SELECT id FROM Criatura__c WHERE id in :  trigger.newMap.keyset()];
}