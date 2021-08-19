global class Vacinacao  implements Schedulable {

      global void execute(SchedulableContext SC) {
      this.vacinar(); 
   }
	
    public void vacinar(){
        
	List<Criatura__c> listaZumbi = [SELECT id,DataZumbificacao__c, DataPrimeiraDose__c, DataSegundaDose__c FROM criatura__c WHERE recordtypeId ='0125e000000mg9LAAQ'];
        
        for(Criatura__c zb : listaZumbi) {
            
            if( zb.DataZumbificacao__c.addDays(10)  <= Date.today() && zb.DataPrimeiraDose__c == null){
                
                zb.DataPrimeiraDose__c = Date.today();
                
            }
            else if (zb.DataZumbificacao__c.addDays(20)  <= Date.today() && zb.DataSegundaDose__c == null){
                zb.DataSegundaDose__c = Date.today();
                zb.recordtypeId = '0125e000000mg9GAAQ' ;
            }
            
            
        }
        update listaZumbi;
                
    }


}