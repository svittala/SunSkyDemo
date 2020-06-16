
@isTest
private  class LogBatchApexErrorEventTest  {
    @isTest static void TestBatchApexLogErrorEvent() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
        BatchApexErrorEvent Log_e = new BatchApexErrorEvent();
        Log_e.AsyncApexJobId  = 'Cause 1';
        Log_e.Phase = 'START';
        Log_e.Message ='Message1';
        Log_e.StackTrace='Stack Trace 1';
      
        test.startTest();
        Database.SaveResult sr = Eventbus.publish(Log_e);
        test.stopTest();
        System.assertEquals(true, sr.isSuccess());
        List <Exception__c> logs = [Select Cause__C from Exception__c];
        System.assertEquals(1, logs.size());
    }
    
}