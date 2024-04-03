gcloud services enable \
  artifactregistry.googleapis.com \
  cloudfunctions.googleapis.com \
  cloudbuild.googleapis.com \
  eventarc.googleapis.com \
  run.googleapis.com \
  logging.googleapis.com \
  pubsub.googleapis.com
cat > city_temp_schema.avsc << EOF
{                                             
            "type" : "record",                               
            "name" : "Avro",                                 
            "fields" : [                                     
            {                                                
                "name" : "city",                             
                "type" : "string"                            
            },                                               
            {                                                
                "name" : "temperature",                      
                "type" : "double"                            
            },                                               
            {                                                
                "name" : "pressure",                         
                "type" : "int"                               
            },                                               
            {                                                
                "name" : "time_position",                    
                "type" : "string"                            
            }                                                
        ]                                                    
    }
EOF
gcloud pubsub schemas create city-temp-schema \
--type=AVRO \
--definition-file=city_temp_schema.avsc
gcloud pubsub topics create temp-topic \
--schema=temperature-schema \
--message-encoding=JSON 
git clone https://github.com/CodingWithHardik/ARC113.git
cd ~/ARC113/helloPubSub
while true; do
  deployment_result=$(gcloud functions deploy gcf-pubsub \
    --trigger-topic=gcf-topic \
    --runtime=nodejs18 \
    --entry-point=helloPubSub \
    --region=$REGION \
    --max-instances=1 \
    --source=. 2>&1)
  if echo "$deployment_result" | grep -q "Function deployed successfully"; then
    echo "Cloud function deployed successfully Cloud Hustlers"
    break
  else
    echo "Retrying in 5 seconds..."
    sleep 5
  fi
done
