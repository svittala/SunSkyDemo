@isTest
private class BatchApexExampleTest {
    static testmethod void test() {
        // Create test accounts to be updated by batch
    List <Account> accList = new List <Account> () ;
    for (Integer i=0;i<400;i++) {
        Account ac = new Account(Name = 'Account ' + i);
        accList.add(ac);
    }
    insert accList;
 
        Test.startTest();
            BatchApexExample b = new BatchApexExample();
            Database.executeBatch(b);
        Test.stopTest();    
        // Verify accounts updated
    Account[] accUpdatedList = [SELECT Id, Name FROM Account];
    System.assert(accUpdatedList[0].Name.Contains('sfdcpoint'));
    }
}