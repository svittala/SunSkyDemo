public class contentController {

    public contentController() {
        file = new ContentVersion();
        file.PathOnClient='testing';
        file.Title='thislargefile';
    }
    
    public ContentVersion file { get; set; }
    
    public PageReference go() {
        insert file;
        return new PageReference('/' + file.id);
    }
}