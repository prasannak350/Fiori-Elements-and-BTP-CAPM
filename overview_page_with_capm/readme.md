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

<!-- my learnings -->
<!-- Refer word doc - "Fiori Elements, capm, deploy apps" -->
In this project, we have developed a fiori elements Overview page using CAPM

To add cards to the overview page --> right click on the project and select open guided development
as we add cards, manifest.json file will be updated

We created one more UI app(overview_v2) using odatav2 version in the same pproject --> to learn about analytical cards and more

NAVIGATION
Here we added list report page as well in the same project, to learn navigation from OVP to List report -->

in list report manifest.json -- 
"crossNavigation": {
      "inbounds": {
        "display": {
          "semanticObject": "Product",
          "action": "display",
          "title": "Products",
          "signature": {
            "parameters": {},
            "additionalParameters": "allowed"
          }
        }
      }
}


in ovp manifest.json --
"crossNavigation": {
      "outbounds": {
        "ProductDisplay": {
          "semanticObject": "Product",
          "action": "display"
        }
      }
}


in overiewui annotation.cds --
annotate service.Products with @(
    UI.Identification #Navigate : [
        {
            $Type : 'UI.DataFieldForIntentBasedNavigation',
            Label : 'Open Product',
            SemanticObject : 'Product',
            Action : 'display'
        }
    ]
);


(NAVGATION IS NOT WORKING - BECUASE LAUNCHPAD CONFIGURATION NEEDS TO BE DONE FOR THAT)