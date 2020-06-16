trigger LogException on ExceptionEvent__e (after insert) {
    List<Exception__c> logs = new List<Exception__c >();
    for( ExceptionEvent__e Log_E : trigger.new)
    {
       Exception__c Log_c =new Exception__C();
     Log_C.Cause__c = Log_E.Cause__c;
     Log_C.Line_Number__c =  Log_E.Line_Number__c;
   Log_C.Message__c  = Log_E.Message__C;
  Log_C.Stack_Trace_String__c= Log_E.Stack_Trace_String__c;
  Log_C.Type_Name__c=Log_E.Type_Name__c;
        logs.add (Log_C);
    }
    Database.insert(logs);
}