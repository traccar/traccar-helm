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
These commands deploy Traccar server configured with a MySQL database. You can customize the deployment using a custom values file, or command-line arguments.

### Uninstalling the Chart
To uninstall/delete the `my-traccar` deployment, run the following command:
```
helm del my-traccar
```
The command removes all the Kubernetes components associated with the deplyoment except the PersistentVolume objects, for safety reasons.

### Parameters
The chart incorporates every configuration file setting, which can be found [ here](https://www.traccar.org/configuration-file/)
