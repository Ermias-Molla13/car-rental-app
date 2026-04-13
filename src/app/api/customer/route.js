import pool from "@/app/libs/mysql";
import { NextResponse } from "next/server";

export async function GET(request) {
  let db;
  try {
    const searchParams = request.nextUrl.searchParams;
    const customer_name = searchParams.get("customer_name");
    const custm_id = searchParams.get("custm_id");
    const address = searchParams.get("address");

    db = await pool.getConnection();

    let query = "SELECT * FROM customer";
    let params = [];

    if (custm_id && customer_name && address) {
      query = "SELECT * FROM customer WHERE custm_id = ? AND customer_name = ? AND address=?";
      params = [custm_id, customer_name, address];
    } else if (custm_id && address) {
      query = "SELECT * FROM customer WHERE custm_id = ? AND address=?";
      params = [custm_id, address];
    } else if (customer_name && address) {
      query = "SELECT * FROM customer WHERE customer_name = ? AND address=?";
      params = [customer_name, address];
    }else if (customer_name) {
      query = "SELECT * FROM customer WHERE customer_name = ? ";
      params = [customer_name];
    }
    else if (address) {
      query = "SELECT * FROM customer WHERE address = ? ";
      params = [address];
    }
    else if (custm_id) {
      query = "SELECT * FROM customer WHERE custm_id = ? ";
      params = [custm_id];
    }else{
     query = "SELECT * FROM customer";
    }

    const [rows] = await db.execute(query, params);
    
    return NextResponse.json({ 
      rows: rows, 

    });

  } catch (error) {
    console.error("Database error:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 }
    );
  } finally {
    if (db) db.release();
  }
}

//Post

export async function POST(request){

  let db;

 

  try {

    const incoming_data = await request.json();
    db = await pool.getConnection();
    
    const checkQuery = `SELECT * FROM customer WHERE email=?`;
    const [existingUser] = await db.execute(checkQuery, [incoming_data.email]);
  
    if(existingUser.length > 0){
      return NextResponse.json({
        error:"Email already exist"
      },
    {
      status: 400 
    });
    
    }

    const query = `INSERT INTO customer(customer_name, contact, address, admin_id, email, password) VALUES (?,?,?,?,?,?)`;

    const params= [
      incoming_data.customer_name,
      incoming_data.contact,
      incoming_data.address,
      incoming_data.admin_id,
      incoming_data.email,
      incoming_data.password

    ];

    const [rows] = await db.execute(query, params);
    return NextResponse.json(rows);

  } catch (error) {
    return NextResponse.json({
      error:" Error"},
    {status: 500})
  }finally{
    if (db) db.release();
  }
}