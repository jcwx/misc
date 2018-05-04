Docker Container that includes the tools to allow integration into a Windows AD environment.

Since containers can't be registered with Active Directory, I've gone about generating a Kerberos ticket manually and add it to the container along with various configuration files needed for communicating with AD.

The container, even with the additional configuration requirements, is still fairly simple and works well enough in the testing I have done.

Something I added to this container is a script to start/stop the service with systemctl.  It uses the docker commands that would be utilized if one were to start/stop the container manually.  When using systemctl, you only need to know the name of the service to start/stop an existing service, or start a new instance if one doesn't exist.
