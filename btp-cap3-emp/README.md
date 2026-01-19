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
Switch from sqlite - SAP HANA Cloud DB
CAP Service deployment to BTP

refer the word doc

implemented Basic authentication with user credentiations - it asks for credentials when we run the page 
added @requires: 'authenticated-user' in service file
and in package.json, added auth

when we deploy the app and try to access it from there, even there it asks for credentials

Consuming Central DB to our CAP projects
refer word doc
mta.yaml file added properties