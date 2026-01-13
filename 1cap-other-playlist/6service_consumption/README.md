# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

<!-- My learnings -->
<!-- first video -->
consuming external service(remote service) - https://api.sap.com/api/API_BUSINESS_PARTNER/overview
go to API specifications in the above link and download OData EDMX

to import API in the srv -->
drag and drop the downloaded file under external folder
cds import srv/external/API_BUSINESS_PARTNER.edmx
maintain the "sandbox url" from the external service in package.json file under credentials
also give APIkey under headers by copying it from the service


do these installations to support the service -->
npm install @sap-cloud-sdk/http-client and @sap-cloud-sdk/util

<!-- another video -->
To integrate the local and remote service - mocking, extending service -->

create a schema.cds file
do cds add data
call the entites in service.cds file