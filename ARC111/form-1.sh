gsutil mb gs://$DEVSHELL_PROJECT_ID-bucket
gsutil retention set 30s "gs://$DEVSHELL_PROJECT_ID-gcs-bucket"
echo "CloudHustlers" > developers.txt
gsutil cp developers.txt gs://$DEVSHELL_PROJECT_ID-bucket-ops
