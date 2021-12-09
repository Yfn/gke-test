# Sample deploy to Kubernetes 

## Prerequisites:
- Linux box with installed Ansible, Ansible Galaxy and kubectl packages
- `gcloud` utility also required, look at GCP documentation for info about installation
- Account in Google Cloud Platform

## Actions:
1. Create new Project in GCP console
2. In new project create new service account
3. In this service account generate new key and download it as JSON-file
4. Enable GCP API and GKE API for this project
5. In cloned repository edit file runme.sh: set variables like cluster name, project_id and provide path to downloaded JSON-file - it's your key to operate cluster.
6. Run runme.sh and have some patience...
