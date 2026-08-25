# Getting Started

Welcome to your new CAP project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`readme.md` | this getting started guide

## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start with your domain model, in a CDS file in `db/`

## Learn More

Learn more at <https://cap.cloud.sap>.

<!-- My Learnings -->

Importing external API into CAP Project

To get the external API --> go to this url "https://hub.sap.com/"
search for Business Partner A2X --> open it --> Go to API specification --> Download OData EDMX file
drag and drop the downloaded file into project
cds import API_BUSINESS_PARTNER.edmx --as cds
Now it creates an external folder under srv

Go to the configuration details and copy sandbox url and add it in package.json under credentials
copy the APIKey as well and paste it in package.json file
    "credentials": {
          "url": "https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap/API_BUSINESS_PARTNER",
          "headers":{
            "APIKey": "9UIp0D02OjGeGqljz5AKQMw0AdT6Z58s"
          }
    }

create a new cds file under srv and define our service
add handler file - cds add handler

NOTE : 
We should never deploy the app with the APIKey visible . so we have to create Destinations in BTP
Go to your trial account --> Connectivity --> Destinations --> Create --> 
Name : BP_API , 
Url : give sandbox url
Additional Properties --> Key : URL.headers.APIKey , Value : give API Key here
and click on create
Now check connection

Now we have to create Instance -->
Go to instances and subscriptions --> click on Create --> select service as "Destination service" --> Instance name as "destinations" -- create

Now you can remove the credentials from package.json file and bind to the instance that we created now
    "[hybrid]": {
          "credentials": {
            "destination": "BP_API"
          }
    }

Now login to cloud foundry
Now do --> cds bind --to destinations
cds watch --profile hybrid

Now create a fiori list report application