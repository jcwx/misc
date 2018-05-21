Docker Container that includes the tools to allow integration into a Windows AD environment.

Since containers can't be registered with Active Directory, I've gone about generating a Kerberos ticket manually and add it to the container along with various configuration files needed for communicating with AD.I've since manually registered this Docker container in AD, and am also able to authenticate with Kerberos from within the container as well.  However, when authentication is called from the tacacs+ service with pam, the negotiation fails.  

Debugging from within a container is proving to be a bit of a challenge and I may have to set up a Debian VM in order to enable debugging for libpam-krb5.  It requires syslog, which is a bit much to tack on a container.

Most of what I've done up to this point is simply performing troubleshooting.  I haven't documented it here, but might open an issue and record what I'm encountering.  Overall, my impression at this point is the container itself will more than likely be fairly basic. Aside from changing some of the packages being installed in the container with apt it really hasn't changed.

*****************

The container, even with the additional configuration requirements, is still fairly simple and works well enough in the testing I have done.

Something I added to this container is a script to start/stop the service with systemctl.  It uses the docker commands that would be utilized if one were to start/stop the container manually.  When using systemctl, you only need to know the name of the service to start/stop an existing service, or start a new instance if one doesn't exist.


**Update 5/21/18: 

I'm going to have to set up one of two things: a separate LDAP container or add a LDAP service to the TACACS+ container.  Not sure which way to go with this at this point.  I'm not a docker purist where I strictly believe in the 'one process, one container' concept.  If it's possible to set up a container where a few services can coexist without complications, then I'll consider it.  

However, a separate LDAP container might not be such a bad thing either.  

I believe I'll build a LDAP container first.  
