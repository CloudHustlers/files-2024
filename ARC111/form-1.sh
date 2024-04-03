gsutil mb gs://qwiklabs-gcp-03-bd78fd3b331d-bucket
gsutil retention set 30s "gs://qwiklabs-gcp-03-bd78fd3b331d-gcs-bucket"
echo "CloudHustlers" > developers.txt
gsutil cp developers.txt gs://qwiklabs-gcp-03-bd78fd3b331d-bucket-ops
