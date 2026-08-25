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

Deploying cap service to BTP -->

first create a sample cap project

For deployment setup-->
Go to Global account in BTP trail --> Boosters --> search "HANA Cloud Administration tools" --> Start
Now under the subscription we can see "SAP HANA Cloud"
Security --> Users --> Assign Role collection --> SAP HANA Cloud --> Assign
Now open SAP HANA Cloud from Instances
Select Create Instance --> configure manually --> Next --> sign in to cloud foundry and Select Cloud Foundry as runtime option --> Instance as "hana-db" --> Give the password (Admin123) --> Next --> Next --> Review and create --> Create Instance

After creating Instance --> come to BTP Trial --> Instances --> Create --> service - SAP HANA SChemas and HDI Containers --> Plan: hdi-shared --> Instance Name: "hana-hdi" --> Create


For deployment -->
cds add hana
cds add mta
cds add xsuaa
(In the package.json change "auth" to "mocked")
npm install
Login to Cloud Foundry
cds up (It Builds and deploys the project at once)

After Deployment --> go to BTP Trial --> Cloud Foundry --> Spaces --> our app appears here
we can see 2 apps --> open the one with srv --> select "Mapped Routes" link --> it gives error --> now add path and entity name to the link to see the data
(https://5675b1dctrial-dev-deploy-cap-service-to-btp-srv.cfapps.us10-001.hana.ondemand.com/kitchen/CookingSupplies)
(In this application we didn't add any data)