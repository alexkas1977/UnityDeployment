node("docker") {
    docker.withRegistry('http://192.168.32.51:5000', '') {
    
        git url: "https://github.com/alexkas1977/UnityDeployment.git", credentialsId: ''
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "your-project-name"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}

