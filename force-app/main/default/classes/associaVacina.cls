public class associaVacina {
	@InvocableMethod (label='pegaVacina')
    public static void pegaVacina (List<id>ids){
        
        List<Criatura__c> listaZumbi = [SELECT ID,tipoVacina__c FROM Criatura__c WHERE recordtypeId='0125e000000mg9LAAQ'];
        
        for (Criatura__c zb : listaZumbi ){
            
            if(zb.tipoVacina__c == null){
            Integer randomNumber = Integer.valueof((Math.random() * 6));
                 Integer randomNumberMorte = Integer.valueof((Math.random() * 100));
                if(randomNumber == 1){
                    zb.tipoVacina__c = 'AstraZeneca BI';
                    
                    }
                else if(randomNumber == 2){
                   	zb.tipoVacina__c = 'CoronaVac BI';
                    }
                else if(randomNumber == 3){
                    zb.tipoVacina__c = 'Janssen BI';
                    }
                else if(randomNumber == 4){
                   	zb.tipoVacina__c = 'Oxford Bi';
                    }
                else if(randomNumber == 5){
                   	zb.tipoVacina__c = 'Pfizer BI';
                    }
                else {
                    zb.tipoVacina__c = 'Sputnik V BI';
                    }
                
                    } 
            
            }
        update listaZumbi;
        }
        
    }