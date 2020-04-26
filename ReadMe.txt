1. Tool Setup:
	1. Install jenkins
		https://www.jenkins.io/download/
		http://localhost:8080/
		it will start on port 8080
	2. Sublime: Text editor
		https://www.sublimetext.com/3
	3. Jmeter: latest build
		http://jmeter.apache.org/download_jmeter.cgi
	4. Jenkins addon
		a. Ant plugin
		b. Mask password plugin
		c. Performance Plugin
		d. Structs Plugin
	5. Apache httpd service
		So report can be viewed in UI
		http://localhost:8080/
	6. Install and define jdk
	7. JAVA_HOME and ANT_HOME must be defined in Jenkins.


# Update the configuration file and run setup.sh
Files Description:
1. build.xml: A ant xml task driving the jmeter run
2. Project.jmx: A jmeter script with test cases
3. config.xml: A jenkins parameterized config file
4. jmeterstyle.xml: A jmeter style sheet that will generate report in the script dir
5. deploy.sh: A shell script that copy the current project files once above step(1) is done. Update all file path in the script before running this. 

After tools are installed and jenkins is setup plz run deploy.sh and reload configuration from disk.