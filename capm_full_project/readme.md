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
This whole project is done by using "Page Map" editor without adding any annotations manually
Developed a full length cap project here

cds add data --records 5 --> adds 5 records to each table

associations
compositions
using page map --> added fiori elements list report object page

we imported currency field from "@sap/cds/common" and added it in object page. While editing, to get values of currency codes in value help. we need to add "sap.common-Currencies.csv" file and it's data

custom value help implementation for Genre field
Event Handlers - on, before, after
cds typer

custom actions - BOUND and UNBOUND actions

BOUND actions--> bounded to particular entity
we added the actions using page map -> list report -> Table -> ToolBar -> Actions -> Add Actions
also added to object page header section
action buttons will be displayed on the app and now we have to add logic for it in handler file
For "changeStatus" action --> we are adding annotations manually instead of using page editor because it has custom parameters. so they can't be added using page map
Common.SideEffects --> fetches the data without needing to refresh the page

UNBOUND Actions--> bounded to whole service

File upload and download -->
update AUthors entity with "@Core.MediaType"
created new fiori application for Authors entity
If we press on edit button in object page, we will be able to upload the file

one more way for upload --> use the plugin "npm i @cap-js/attachments"
and import it in schema.cds file
Now, the whole separate section for attachamnets will be displayed in object page

Using SQlite database - data will be there even after the page refreshes
package.json-->
"cds": {
    "requires": {
      "db": {
        "kind": "sqlite",
        "credentials": {
          "url": "db.sqlite"
        }
      }
    }
  }

Now do cds deploy --> it wil be deployed to db.sqlite


Virtual Fields -- will not be saved in the database

Debugging -->
click on Run and Debug Icon
start debugging
open terminal and open Debug console
put debuggers in any code in handler file
stop cds watch in terminal and start debugging if you see any errors

Authorization and Authentication-->
annotate with @requires : 'admin'
and add this in package.json file as well

Testing API with HTTP files -->
used this website for generating the code here - "https://mixedanalytics.com/tools/basic-authentication-generator/"

GET http://localhost:4013/odata/v4/book-store/Books
Authorization: Basic base64-user-password