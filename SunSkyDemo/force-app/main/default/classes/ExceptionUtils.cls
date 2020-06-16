global class ExceptionUtils {
    
    global static void handleException(Exception exceptionCaught, Boolean logToObject) {
        
        Exception__c exceptionStaged = new Exception__c();
        
        exceptionStaged.Cause__c = String.valueOf(exceptionCaught.getCause());
        exceptionStaged.Line_Number__c = exceptionCaught.getLineNumber();
        exceptionStaged.Message__c = exceptionCaught.getMessage();
        exceptionStaged.Stack_Trace_String__c = exceptionCaught.getStackTraceString();
        exceptionStaged.Type_Name__c = exceptionCaught.getTypeName();
        
        String exceptionCause = exceptionStaged.Cause__c;
        Decimal exceptionLineNumber = exceptionStaged.Line_Number__c;
        String exceptionMessage = exceptionStaged.Message__c;
        String exceptionStackTraceString = exceptionStaged.Stack_Trace_String__c;
        String exceptionTypeName = exceptionStaged.Type_Name__c;
        
        if(logToObject) {
            ExceptionUtils.logToObject(exceptionStaged);
        }
        
    }    

    
    global static void handleExceptionEvent(Exception exceptionCaught) {
        
        ExceptionEvent__e exceptionStaged = new ExceptionEvent__e();
        
        exceptionStaged.Cause__c = String.valueOf(exceptionCaught.getCause());
        exceptionStaged.Line_Number__c = exceptionCaught.getLineNumber();
        exceptionStaged.Message__c = exceptionCaught.getMessage();
        exceptionStaged.Stack_Trace_String__c = exceptionCaught.getStackTraceString();
        exceptionStaged.Type_Name__c = exceptionCaught.getTypeName();
        
        String exceptionCause = exceptionStaged.Cause__c;
        Decimal exceptionLineNumber = exceptionStaged.Line_Number__c;
        String exceptionMessage = exceptionStaged.Message__c;
        String exceptionStackTraceString = exceptionStaged.Stack_Trace_String__c;
        String exceptionTypeName = exceptionStaged.Type_Name__c;
        Eventbus.publish(exceptionStaged);
        }
           

    private static void logToObject(Exception__c exceptionPassed) {

		List<Exception__c> exceptionsToInsert = new List<Exception__c >();

        exceptionsToInsert.add(exceptionPassed);
        insert exceptionsToInsert;
    }
    
    
}