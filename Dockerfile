FROM jenkins/jenkins:latest

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV CASC_JENKINS_CONFIG /var/jenkins_home/my_marvin.yml
RUN /usr/local/bin/install-plugins.sh cloudbees-folder configuration-as-code credentials github job-dsl script-security structs role-strategy ws-cleanup
COPY my_marvin.yml /var/jenkins_home/my_marvin.yml
COPY  --chown=jenkins:jenkins ./job_dsl.groovy /usr/share/jenkins/ref/init.groovy.d/job_dsl.groovy