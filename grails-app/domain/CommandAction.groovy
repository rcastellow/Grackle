class CommandAction {
    static belongsTo = [project:Project]
    static hasMany = [commandActions:CommandAction,tasks:Task]

    String name
    String description
    String distributionList
    String variableList

    int priority=0

    static constraints = {
        name(blank:false)
    }
}