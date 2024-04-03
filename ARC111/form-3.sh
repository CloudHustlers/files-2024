gsutil mb -c COLDLINE gs://$DEVSHELL_PROJECT_ID-bucket
echo "This is an example of editing the file content for cloud storage object" > sample.txt
gsutil cp sample.txt gs://$DEVSHELL_PROJECT_ID-gcs-bucket/
gcloud storage buckets update gs://$DEVSHELL_PROJECT_ID-bucket-ops --default-storage-class=ARCHIVE
