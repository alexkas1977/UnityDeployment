node("docker") {
    docker.withRegistry('http://13.56.14.147:5000', '') {
    
        git url: "https://github.com/alexkas1977/UnityDeployment.git", credentialsId: ''
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "db"
	sh "sudo build.sh"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}

