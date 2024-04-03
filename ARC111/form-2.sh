gsutil mb -c NEARLINE gs://$DEVSHELL_PROJECT_ID-bucket
gcloud alpha storage buckets update gs://$DEVSHELL_PROJECT_ID-gcs-bucket --no-uniform-bucket-level-access
gsutil acl ch -u $USER_EMAIL:OWNER gs://$DEVSHELL_PROJECT_ID-gcs-bucket
gsutil rm gs://$DEVSHELL_PROJECT_ID-gcs-bucket/sample.txt
echo "Cloud Hustlers" > sample.txt
gsutil cp sample.txt gs://$DEVSHELL_PROJECT_ID-gcs-bucket
gsutil acl ch -u allUsers:R gs://$DEVSHELL_PROJECT_ID-gcs-bucket/*
gcloud storage buckets update gs://$DEVSHELL_PROJECT_ID-bucket-ops --update-labels=cloud=hustlers
