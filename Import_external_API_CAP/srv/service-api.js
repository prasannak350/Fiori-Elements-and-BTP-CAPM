import cds from '@sap/cds'

export class BPEmailAdresses extends cds.ApplicationService { init() {

  const { BPEmailAdresses } = cds.entities('BPEmailAdresses')

  this.on ('READ', BPEmailAdresses, async (req) => {
    // to connect to Business partner API
    const BP_API = await cds.connect.to('API_BUSINESS_PARTNER')

    //to retrieve the data from API
    return BP_API.run(req.query)
  })


  return super.init()
}}
