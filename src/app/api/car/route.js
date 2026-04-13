import pool from "@/app/libs/mysql"
import { NextResponse } from "next/server";


export async function GET(request){

   // return NextResponse.json({status:"connected"})
    try {

        const searchparam = request.nextUrl.searchParams;

        const car_id = searchparam.get("car_id")
        const rate = searchparam.get("rate")

        const db = await pool.getConnection();

     // const query = "SELECT * FROM car"
                // ? `select * from car where CAR_ID = ${car_id} and RATE >= ${rate}`
                // :car_id
                // ? `select * from car where CAR_ID = ${car_id} `
                // :rate
                // ?`select * from car where RATE >= ${rate} `:
                // `select * from car`
      

     if(car_id)
     {
         query = `select * from car where car_id = ${car_id}`
         
     db.release()
     }
     else{
        query = `select * from car `
        
    }

    
    const [rows] = await db.execute(query)
    return NextResponse.json({rows:rows,sql:query})

    } catch (error) {
        return NextResponse.json({
            error:error
        },
    {
        status:500
    })
    }
    
}


//  post
export async function POST(request){
    let db;


try {
    const incoming_data = await request.json();
    db = await pool.getConnection();

    const query = `INSERT INTO car(make, model, description, price, image, model_year, owner_id, car_type_id) VALUES (?,?,?,?,?,?,?,?)`; 
    
   const params =[ 
      incoming_data.make,
      incoming_data.model,
      incoming_data.description,
      incoming_data.price,
      incoming_data.image,
      incoming_data.model_year,
      incoming_data.owner_id,
      incoming_data.car_type_id
   ];
   const [rows] = await db.execute(query, params);
   return NextResponse.json(rows);

} catch (error) {
    return NextResponse.json("data base error")
  
}
finally {
    if (db) db.release();
}
}

