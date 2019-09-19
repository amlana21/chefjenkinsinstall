# A CHEF Repo to install Jenkins on a remote server  

This CHEF repo consist of a cookbook that installs Docker and runs a Jenkins Docker container on the remote server.  The Docker container runs and provides a basic install of the Jenkins on the server. Once the server is bootstrapped using the Role, the server endpoint can be accessed to finish the rest of the Jenkins installation and first admin user creation.


## Steps to use the Cookbook  

<strong>Pre-Requisites: </strong>  
* CHEFDK installed in local machine where the cookbook will used to bootstrap the remote machine  
* A CHEF server to host the cookbook. A free CHEF server account can be created and used. Please visit  
https://manage.chef.io/login to get a free account  

<strong>The bootstrap process: </strong>  
* Download or checkout the repo to a local directory  
* Create a folder named .chef in the root location of the directory. It should look like below  

![tree](/images/tree.JPG) 

* Download the knife file and the user pem file from the CHEF server and place them in the .chef folder  
* Check the connetion to server with this command  
` knife ssl check`
* Once you are ready to run the cookbook, execute the below two commands from the cookbooks/jenkinsserver directory  
`berks install`  
` berks upload`  
* Run the bootstrap process  
`knife bootstrap <server-ip> --ssh-user <user> --sudo --identity-file <path to server key file> --node-name JenkinsNode --run-list 'role[jenkinsmaster]' `  
* Once it finishes Jenkins will be installed as a Docker container in the remote server. To access Jenkins and complete the installation, navigate to  
http://<server-address>:8080  
* That will land on the initial installation page of Jenkins where it will ask for the auto generated admin password. To get the password:  
    * SSH to the remote server  
    * Execute the below command to get the logs for the Jenkins container which was started during the bootstrap process  
    `docker logs jenkinsinstall`  
    * The password should be shown in the logs  
* Enter the password and complete the installation with Suggested plugins
* It will also ask to create the first admin user  
* Jenkins can be accessed from below URL:  
http://<server-address>:8080  

## Technical Details 
<strong>Services/Technologies used:</strong> CHEF, Docker,Jenkins  
<strong>Docker cookbook details:</strong> https://supermarket.chef.io/cookbooks/docker  
<strong>Jenkins Docker Image Details:</strong>  https://github.com/jenkinsci/docker/blob/master/README.md