@isTest
private class TestLogExceptionTrigger {
    @isTest static void TestPostLogException() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
        ExceptionEvent__e Log_e = new ExceptionEvent__e();
        Log_e.Cause__c = 'Cause 1';
        Log_e.Line_Number__c = 1;
        Log_e.Message__C ='Message1';
        Log_e.Stack_Trace_String__c='Stack Trace 1';
        Log_e.Type_Name__c = 'MathException';
        test.startTest();
        Database.SaveResult sr = Eventbus.publish(Log_e);
        test.stopTest();
        System.assertEquals(true, sr.isSuccess());
        List <Exception__c> logs = [Select Cause__C from Exception__c];
        System.assertEquals(1, logs.size());
    }
    
}