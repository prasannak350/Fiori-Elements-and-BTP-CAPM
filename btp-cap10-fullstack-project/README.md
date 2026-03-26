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

<!-- My Learnings -->
Compositions
Associations

create end to end fiori application and deploy to SAP Build workzone 
Note: SAP build workzone is not working in trial account


for only the authenticated user to view the app, give @requires: 'authenticated-user' in the service file
added authentiaction routes in xs-app.json file --> (whitelisting)
    {
      "source": "^/full-stack/(.*)",    --> allow for full-stack stack service and there can be anything after that
      "destination": "fs-app-api",      --> destination to connect to
      "csrfProtection": true,           --> all create, update, delete call to be secured
      "authenticationType": "xsuaa"     --> secure authentication
    },

and add the destination - fs-app-api in mta.yaml file under resources -->
    - Authentication: NoAuthentication
            Name: fs-app-api
            ProxyType: Internet
            Type: HTTP
            URL: ~{srv-api/srv-url}
            HTML5.DynamicDestination: true
            HTML5.ForwardAuthToken: true

and give this -->
    requires:
        - name: srv-api


add "- name: uaa_btp-cap10-fullstack-project" under db requires (anyone who is trying to reach out to srv, should be authenticated before)