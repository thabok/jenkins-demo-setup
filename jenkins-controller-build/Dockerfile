FROM jenkins/jenkins:latest

WORKDIR /home/jenkins

# disable CSP for pretty HTML reports and skip the first time setup wizard
ENV JAVA_OPTS "-Dhudson.model.DirectoryBrowserSupport.CSP= -Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"
# -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=0.0.0.0:8000 

# copy job dsl templates for example pipelines
COPY jobdsl jobdsl

# add required plugins
COPY plugins.txt .
RUN jenkins-plugin-cli --jenkins-update-center "https://updates.jenkins.io/experimental/update-center.json" --plugin-file plugins.txt