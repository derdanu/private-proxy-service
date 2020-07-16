# Azure Private Proxy Service 

This Deployment is based on the [Private Link Service](https://docs.microsoft.com/en-us/azure/private-link/private-link-service-overview) and a Virtual machine scale set with multiple Squid Proxy linux server (default 2). You can easy scale the solution in/out. 

## Deployment

Just plan and apply this terraform files. The output is the private link service alias. This can be used with any existing subnet or even shared cross subscriptions. Just deploy a [Private Link](https://docs.microsoft.com/en-us/azure/private-link/}) and connect with the alias. Once you have approved the connection the proxy is reachable via port 3128.
