class Environment {
    String name
    String hostName
    String username
    String password

    static constraints = {
        password(size:5..15,blank:false)
    }
}
