node("docker") {
withDockerRegistry([url: 'http://54.67.11.102:5000']) {
    
        git url: "https://github.com/alexkas1977/UnityDeployment.git", credentialsId: ''
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
	def app = docker.build("db")
    
        stage "publish"
        app.push ()
        app.push ('latest')
    }
}

