# Traccar Helm Chart Repository

This repository contains a Helm chart which can be used to bootstrap a production-ready Traccar GPS Tracking Server on a Kubernetes cluster using the Helm package manager.

### Prerequisites
- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure

### Installing the Chart
To install the chart with the release name `my-traccar`, run the following commands:
```
helm repo add traccar https://traccar.github.io/traccar-helm/
helm install my-traccar traccar/traccar
```
These commands deploy Traccar server configured with a MySQL server. You can customize the deployment using a custom values file, or command-line arguments.

### Uninstalling the Chart
To uninstall/delete the `my-traccar` deployment, run the following command:
```
helm del my-traccar
```
The command removes all the Kubernetes components associated with the deplyoment except the PersistentVolume objects, for safety reasons. 

### Protocols
Due to some Cloud Vendor limitations the chart only enables the most common protocols by default:
- totem - 5007
- eelink - 5064
- meiligao - 5009
- gt06 - 5023
- pst - 5207
- calamp - 5082
- cartrack - 5061
- mxt - 5087
- watch - 5093
- tk103 - 5002
- xirgo - 5081
- huabao - 5015
- gps103 - 5001
- ruptela - 5046
- gator - 5052
- flespi - 5149
- egts - 5162
- dmthttp - 5139
- cellocator - 5033
- galileo - 5034
- osmand - 5055
- h02 - 5013
- megastek - 5024
- xexun - 5006
- teltonika - 5027
- suntech - 5011
- khd - 5058
- laipac - 5048
- easytrack - 5056
- skypatrol - 5021
- meitrack - 5020
- gl200 - 5004
