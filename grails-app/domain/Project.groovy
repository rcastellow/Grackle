class Project {
    static hasMany = [commandActions: CommandAction]

    String name
    String description
    String distributionList

    static constraints = {
        name(blank:false)
    }

}
