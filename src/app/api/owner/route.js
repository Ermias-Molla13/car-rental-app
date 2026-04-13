import pool from "@/app/libs/mysql";
import { NextResponse } from "next/server";

export async function GET(request) {
  let db;
  try {
    const searchParams = request.nextUrl.searchParams;
    const owner_name = searchParams.get("owner_name");
    const owner_id = searchParams.get("owner_id");
    const address = searchParams.get("address");

    db = await pool.getConnection();

    let query = "SELECT * FROM owner";
    let params = [];

    if (owner_id && owner_name && address) {
      query = "SELECT * FROM owner WHERE owner_id = ? AND owner_name = ? AND address=?";
      params = [owner_id, owner_name, address];
    } else if (owner_id && address) {
      query = "SELECT * FROM owner WHERE owner_id = ? AND address=?";
      params = [owner_id, address];
    } else if (owner_name && address) {
      query = "SELECT * FROM owner WHERE owner_name = ? AND address=?";
      params = [owner_name, address];
    }else if (owner_name) {
      query = "SELECT * FROM owner WHERE owner_name = ? ";
      params = [owner_name];
    }
    else if (address) {
      query = "SELECT * FROM owner WHERE address = ? ";
      params = [address];
    }
    else if (owner_id) {
      query = "SELECT * FROM owner WHERE owner_id = ? ";
      params = [owner_id];
    }else{
     query = "SELECT * FROM owner";
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


//post

export async function POST(request) {
  
  let db;

  try {
    
    const incoming_data = await request.json();
    db = await pool.getConnection();
    

    const checkQuery = `SELECT * FROM owner WHERE email = ?`;
    const [existingUser] = await db.execute(checkQuery, [incoming_data.email]);

    if(existingUser.length > 0){
      return NextResponse.json({
        error: "Email already exist"
      },
    {status : 400})
    }
    const query = `INSERT INTO owner(owner_name, address, contact, admin_id, email) VALUES (?,?,?,?,?)`;

    const params = [
      incoming_data.owner_name,
      incoming_data.address,
      incoming_data.contact,
      incoming_data.admin_id,
      incoming_data.email
    ];

    const [rows] = await db.execute(query, params);
    return NextResponse.json(rows);
  } catch (error) {
    return NextResponse.json("DataBase Error")
  }finally{
    if (db) db.release();
  }
}