gcloud config set compute/region $REGION
gsutil mb -c COLDLINE gs://qwiklabs-gcp-02-69347bf5e399-bucket
echo "This is an example of editing the file content for cloud storage object" > sample.txt
gsutil cp sample.txt gs://qwiklabs-gcp-02-69347bf5e399-gcs-bucket/
gcloud storage buckets update gs://qwiklabs-gcp-02-69347bf5e399-bucket-ops --default-storage-class=ARCHIVE
