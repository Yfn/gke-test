#!/bin/env sh

PROJECT_ID=ex-test-334405
CLUSTER_NAME=ex-test-gke
REGION=europe-central
ZONE=europe-central2
AUTH_FILE=/home/roman/Dropbox/ex-test-334405-a7c597ca8d13.json

export ANSIBLE_CFG=ansible.cfg

pip install ansible requests google-auth
ansible-galaxy collection install google.cloud

mkdir -p inventory
mkdir -p group_vars/all
mkdir -p k8s
ansible -m template -a "src=all.gcp.j2 dest=inventory/all.gcp.yml" -e "project_id=$PROJECT_ID" localhost
ansible -m template -a "src=vars.j2 dest=group_vars/all/vars.yml" -e "project_id=$PROJECT_ID cluster_name=$CLUSTER_NAME region=$REGION zone=$ZONE auth_file=$AUTH_FILE" localhost
ansible -m template -a "src=k8s.j2 dest=k8s/k8s.yml" -e "cluster_name=$CLUSTER_NAME" localhost
ansible-playbook deploy_cluster.yml
sleep 25
gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE --project $PROJECT_ID
kubectl apply -f k8s/k8s.yml
sleep 45
ClusterIP=`kubectl get svc $CLUSTER_NAME -o jsonpath="{.status.loadBalancer.ingress[0].ip}"`
code=`curl -s -o /dev/null -w "%{http_code}" http://$ClusterIP/health/check`
[ $code -lt 400 ] && echo "Kubernetes cluster $CLUSTER_NAME works just fine!"
