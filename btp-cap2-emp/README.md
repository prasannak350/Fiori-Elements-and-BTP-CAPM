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
Aspects - cuid, managed
Annotations - @title, UI SelectionField, UI LineItem
Facets
Learnt how to create an employee data - go to the run page - click on create - employee record will be created without writing any single line of code in Node.js



application to be exposed as both odata V4 and V2 service (by default it will be only v4) -->
convert v4 cap odata service into v2 using node js package -
npm install @sap/cds-odata-v2-adapter-proxy - new package will be installed in package.json file
create server.js file


Draft handling (if user is creating an employee data and stops in the middle because of some issue, his work should be saved)  - @odata.draft.enabled 
