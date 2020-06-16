trigger LogBatchApexErrorEvent on BatchApexErrorEvent (after insert) {

   List<Exception__c> logs = new List<Exception__c>();
    
    // Iterate through each notification.
    for (BatchApexErrorEvent event : Trigger.New) {
            
        Exception__c Log_c =new Exception__C();
        // Mapping Exception to Log - no direct linkage like the custom exception
        Log_C.Cause__c = 'Async Job:' +event.AsyncApexJobId + ' Event Phase:' + event.Phase;
        Log_C.Line_Number__c =  0;
        Log_C.JobScope__c = event.JobScope;
        Log_C.Message__c  = event.Message;
        Log_C.Stack_Trace_String__c= event.StackTrace;
        Log_C.Type_Name__c=event.ExceptionType;
        
        logs.add (Log_C);
        }
        // Insert all cases corresponding to events received.
        Database.insert(logs);
    }
