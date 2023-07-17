# Chef Client Installation

> Ensure SSH connectivity between your WorkStation and the Clients is established

## Bootstrap your Node Client from the Workstation
```bash
pwd
/home/opc/chef-repo

knife bootstrap webserver --connection-user opc --node-name webserver --sudo
``` 
> After a successful bootstrapping of the node client, the node should be visible in the Chef console

```bash
knife node list
```

## Verify the OHAI process on the client nodes
> The following command gives a long list of system attributes in JSON format
```bash
ohai
```

