import cds from '@sap/cds'
import { Books, Authors } from '#cds-models/BookStore';
import { UPDATE } from '@sap/cds/lib/ql/cds-ql.js';

export class BookStore extends cds.ApplicationService { init() {

  // If we install, cds typer package (cds add typer) --> then we don't have to use the below line becuase it auto imports from cds models
  // const { Books} = cds.entities('BookStore')

  this.before ('READ', Books, async (req) => {
    console.log('Before READ Books')
  })

  this.on('READ', Books, async(req, next) =>{
    console.log('ON Event');
    return next();                           // we must return the function otherwise it gives error and the page doesn't load
  })

  this.after ('READ', Books, async (books, req) => {
    for(const book of books){
      if(book.genre_code === 'Mystery'){
        book.price = book.price * 0.8
        book.title = "Discounts Today !!! Mystery Book"
      }
    }

    console.log('After READ Books')
  })

  // action logic
  // seelct the table record and click on add stock then refresh the page --> stock will be increased by +1
  this.on('addStock', Books, async(req) => {
    const bookId = req.params[0].ID;
    await UPDATE(Books)
      .set({stock:{'+=': 1}})
      .where({ID:bookId})
  })

  // change publish date in object page
  this.on('changePublishDate', Books, async(req)=>{
    const bookId = req.params[0].ID;
    const newDate = req.data.newDate;
    await UPDATE(Books)
      .set({publishedAt : newDate})
      .where({ID : bookId})
  })

  // change status in object page
  this.on('changeStatus', Books, async(req)=>{
    const bookId = req.params[0].ID;
    const newStatus = req.data.newStatus;
    await UPDATE(Books)
      .set({status_code : newStatus})
      .where({ID : bookId})
  })


  // unbound action for discount -- no need to pass entity as parameter here
  this.on('addDiscount', async() =>{
    await UPDATE(Books)
      .set({price : {'*=' :0.9}})
  })


  // virtual field - bookCount
  this.after("READ", Authors, async(authors) =>{
    const ids = authors.map(author => author.ID)
    const bookCounts = await SELECT.from(Books)
      .columns('author_ID',{func : 'count'})
      .where({author_ID : {in: ids}})
      .groupBy('author_ID');

    for(const author of authors){
      const bookCount = bookCounts.find(bookCount => bookCount.author_ID = author.ID);
      author.bookCount = bookCount.count
    }
  })

  return super.init()
}}
