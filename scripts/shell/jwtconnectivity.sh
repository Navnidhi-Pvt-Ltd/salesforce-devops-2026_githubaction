openssl genpkey -aes-256-cbc -algorithm RSA -pass pass:PROD_ORG -out assets/production/server.pass.key -pkeyopt rsa_keygen_bits:2048
openssl rsa -passin pass:PROD_ORG -in assets/production/server.pass.key -out assets/production/server.key
openssl req -new -key assets/production/server.key -out assets/production/server.csr
openssl x509 -req -sha256 -days 365 -in assets/production/server.csr -signkey assets/production/server.key -out assets/production/server.crt

Create Connected App

3MVG9HtWXcDGV.nGuLMCXddyQLqes_RSm9vfFDnja06ZpPayZAh.oYCKaqzBHEhjlzRfoyRJtbaHke_TLllp7

sf org login jwt --client-id 3MVG9HtWXcDGV.nGuLMCXddyQLqes_RSm9vfFDnja06ZpPayZAh.oYCKaqzBHEhjlzRfoyRJtbaHke_TLllp7 --jwt-key-file assets/dev/server.key     --username nbiyani1234.71495623f69a@agentforce.com     --set-default --alias DEV_INT_ORG     --instance-url https://login.salesforce.com

openssl enc --aes-256-cbc -k GITHUBACTIONS_DEV_SANDBOX -P -md sha1 -nosalt

key=4679453C950840E3D95A4A1926B75DF560F9979ADCB5D928881FCB8A75F71D22
iv =A41A41F1BB4713A85215DCCB3B1FF17D

openssl enc -nosalt --aes-256-cbc -in assets/dev/server.key -out assets/dev/server.key.enc -base64 -K 4679453C950840E3D95A4A1926B75DF560F9979ADCB5D928881FCB8A75F71D22 -iv A41A41F1BB4713A85215DCCB3B1FF17D
openssl enc -nosalt --aes-256-cbc -d -in assets/dev/server.key.enc -out assets/dev/server.key -base64 -K 4679453C950840E3D95A4A1926B75DF560F9979ADCB5D928881FCB8A75F71D22 -iv A41A41F1BB4713A85215DCCB3B1FF17D


DEPLOYMENT_USER_USERNAME - the salesforce username
DECRYPTION_KEY
DECRYPTION_IV
CONSUMER_KEY
ENCRYPTION_KEY_FILE 
JWT_KEY_FILE
HUB_LOGIN_URL
ORG_DEFAULT_ALIAS

UAT environment
sf org login jwt --client-id 3MVG9rZjd7MXFdLitdPWKK_g0h1kmrS5.XMwWi6MFZObyHimW.LA2QLkl2r6caP0MxiYM_fp7OdPIluYtanLT --jwt-key-file assets/uat/server.key     --username nbiyani1234749@agentforce.com     --set-default --alias UAT_INT_ORG     --instance-url https://login.salesforce.com

openssl enc --aes-256-cbc -k GITHUBACTIONS_DEV_SANDBOX -P -md sha1 -nosalt

key=DC6B703271AF84CBFF7A24B3F642AD58E07B91D83135310FD2120D7F7D332BD8
iv =86A10B3569A447121F24977829AAA1C9

openssl enc -nosalt --aes-256-cbc -in assets/uat/server.key -out assets/uat/server.key.enc -base64 -K DC6B703271AF84CBFF7A24B3F642AD58E07B91D83135310FD2120D7F7D332BD8 -iv 86A10B3569A447121F24977829AAA1C9
openssl enc -nosalt --aes-256-cbc -d -in assets/uat/server.key.enc -out assets/uat/server.key -base64 -K DC6B703271AF84CBFF7A24B3F642AD58E07B91D83135310FD2120D7F7D332BD8 -iv 86A10B3569A447121F24977829AAA1C9

sf sgd source delta --from "HEAD~1" --to "HEAD" --generate-delta --ignore-file .sgdignore --output-dir ./delta --ignore-whitespace --api-version 66.0 --source-dir force-app/main/default 
