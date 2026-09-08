public class MyHelloWorld {
   private String myMessage; 
   private Integer mynumber1;
   private Integer mynumber2;
   private Integer mynumber3;
   private Integer mynumber4;
   private Integer mynumber5;
   public static void applyDiscount(Book__c[] books) {
      for (Book__c b :books){
         b.Price__c *= 0.9;
      }
   }
}