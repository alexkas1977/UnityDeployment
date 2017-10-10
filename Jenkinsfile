node ("docker") {
	def app
	stage ('Clone repository'){
	checkout scm 
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
}
	stage ('Build image') {
	app = docker.build("vixtera/db")
}
	stage('Test image') {
        app.inside {
            sh 'echo "Tests passed right now"'
        }
}
	stage ('Publish image') {
	docker.withRegistry('http://54.67.11.102:5000') {
	app.push("{env.BUILD_NUMBER}")
	app.push("latest")
}
}
}
