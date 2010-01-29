class Task {
    static belongsTo = [commandAction:CommandAction]
    static hasMany = [environments:Environment]

    int priority=0
    boolean execute = false

    String name
    String description
    
    Properties variableList
    String scriptPath
    String arguments



    static constraints = {
        name(blank:false)
    }
}
