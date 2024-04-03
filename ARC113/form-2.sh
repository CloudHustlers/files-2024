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
gcloud functions deploy gcf-pubsub \
--trigger-topic=gcf-topic \
--runtime=nodejs18 \
--entry-point=helloPubSub \
--region=$REGION \
--max-instances=1 \
--source=.
