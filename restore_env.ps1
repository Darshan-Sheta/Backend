$content = @"
GEMINI_API_KEY=AIzaSyD3fCRBWJeIffJjEdqjug-QkF2E0ruTbLM
MONGODB_USERNAME=rajeshthummar1978_db_user
MONGODB_PASSWORD=Qpu0kc0TqJst3zXz
MONGODB_DB=TeamBond2
CLOUDINARY_URL=cloudinary://541615467295126:U9Orpmlo03X09-HtlE3Br2t9rNc@dw7mugr80

CLOUD_NAME=dw7mugr80
API_KEY=541615467295126
API_SECRET=U9Orpmlo03X09-HtlE3Br2t9rNc
APP_PASSWORD=rhfj rnce vqen wbbp
MAIL_ID=shetadarshan61@gmail.com
REACT_APP_RAZORPAY_KEY=rzp_test_Rsg1l0yAzhuowS

YOUR_CLIENT_ID=Ov23liRLmGozCPFRwScG
YOUR_CLIENT_SECRET = 984f2680a553e888076fd28d376ca703757d0ab5
JWT_SECRET_KEY = qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOP

redirect-uri=http://localhost:8080/login/oauth2/code/github
open.cage.api = 40327afcd6e04c7a958c71bcd439a800
frontend.url=http://localhost:5173

rabbitmq.port = 5671
rabbitmq.host= b-16012807-86aa-4809-9aa5-500695b7a431.mq.eu-north-1.on.aws
rabbitmq.username= ShetaDarshan1710
rabbitmq.password= ShetaDarshan1710

rabbitmq.queue = TeamBond
rabbitmq.exchange =  TeamBond
rabbitmq.routingKey = TeamBond

rabbitmq.dlx.exchange = dlqTeamBond
rabbitmq.dlq.queue = dlqTeamBond
rabbitmq.dlq.routingKey = dlqTeamBond

SSL_CONNECTION = true

Supervisor_Emails = rajeshthummar1978@gmail.com,shetadarshan61@gmail.com

REDIS_URI=redis-16929.c330.asia-south1-1.gce.cloud.redislabs.com
REDIS_PASSWORD=4Z1zv1iNjQzqabWVadFBhw6c2w7GfPmH
REDIS_PORT=16929

razorpay.webhook.secret=OWGi2QD133o9Ch2mXcxdcIGx
razorpay.key_id=rzp_test_Rsg1l0yAzhuowS
razorpay.key_secret=OWGi2QD133o9Ch2mXcxdcIGx

flask_url =  http://localhost:5000/
"@

Set-Content -Path ".env" -Value $content -Encoding Ascii
Write-Host ".env file restored successfully."
