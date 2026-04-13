
import pool from "@/app/libs/mysql";
import { NextResponse } from "next/server";

export async function GET(request) {
  let db;
  try {
    const searchParams = request.nextUrl.searchParams;
    const rent_date = searchParams.get("rent_date");
    const rent_id = searchParams.get("rent_id");
    const pickup_date = searchParams.get("pickup_date");

    db = await pool.getConnection();

    let query = "SELECT * FROM rent";
    let params = [];

    if (rent_id && rent_date && pickup_date) {
      query = "SELECT * FROM rent WHERE rent_id = ? AND rent_date = ? AND pickup_date=?";
      params = [rent_id, rent_date, pickup_date];
    } else if (rent_id && pickup_date) {
      query = "SELECT * FROM rent WHERE rent_id = ? AND pickup_date=?";
      params = [rent_id, pickup_date];
    } else if (rent_date && pickup_date) {
      query = "SELECT * FROM rent WHERE rent_date = ? AND pickup_date=?";
      params = [rent_date, pickup_date];
    }else if (rent_date) {
      query = "SELECT * FROM rent WHERE rent_date = ? ";
      params = [rent_date];
    }
    else if (pickup_date) {
      query = "SELECT * FROM rent WHERE pickup_date = ? ";
      params = [pickup_date];
    }
    else if (rent_id) {
      query = "SELECT * FROM rent WHERE rent_id = ? ";
      params = [rent_id];
    }else{
     query = "SELECT * FROM rent";
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
    db= await pool.getConnection();

    const query = `INSERT INTO rent (rent_date, pickup_date,return_date custm_id, owner_id, car_id) VALUES (?,?,?,?,?,?)`;

    const params = [
      incoming_data.rent_date,
      incoming_data.pickup_date,
      incoming_data.return_date,
      incoming_data.custm_id,
      incoming_data.owner_id,
      incoming_data.car_id
    ]

    const [rows] = await db.execute(query, params);
    return NextResponse.json(rows);
  } catch (error) {
    return NextResponse.json("DataBase Error");
    {status:500};
  }finally{
    if (db) db.release();
  }

}