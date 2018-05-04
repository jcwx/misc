Docker Container that includes the tools to allow integration into a Windows AD environment.

Since containers can't be registered with Active Directory, I've gone about generating a Kerberos ticket manually and add it to the container along with various configuration files needed for communicating with AD.

The container, even with the additional configuration requirements, is still fairly simple and works well enough in the testing I have done.
