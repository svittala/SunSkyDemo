ExceptionHandler Process Code

This code shows how to use Platform Events can be used to capture Exceptions. These exceptiosn are then written to a salesforce object for logging purpose.

Look at the file Manifest.pacakge.xml to see all the objects,,, and use that to export these to an org using sfdx.

Custom Objects:
    Exception__c            : Custom Object to store Exceptions
    ExceptionEvent__e       : Custom Event Structure to Capture Exceptions
Custom Classes:
    ExceptionUtils          : Core Exception Util Class
Triggers:
    LogExceptionEvent       : Trigger for Custom Exception    - create an entry in exception__c object
    LogBatchApexErrorEvent  : Trigger for BatchApexErrorEvent - create an entry in exception__c object
Test Classes:
    ExceptionUtilsTest              : Test Class for the ExceptionUtils
    LogExceptionEventTriggerTest    : Test class for LogExceptionEvent
    LogBatchApexErrorEventTest      : Test class for LogBatchApexErrorEvent
Example Classes                     : exmaple classes to show the useage of the framework
            :BatchApexExample
            :BatchApexExampleTest
            :BatchLeadConvert
            :BatchLeadConvertTest

