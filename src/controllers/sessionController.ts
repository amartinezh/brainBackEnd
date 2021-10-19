import { Request, Response } from "express";
import { SessionDAO } from "../repository/IndustryBackDB/sessionDAO";
import { Token } from "../models/interfaces/token.interface";
import { ErrorEnum } from "../models/ETLBackEnd/error";
import * as jwt from 'jsonwebtoken'
//import { } from "express-jwt";

let session = new SessionDAO();

export class SessionController {
	/*-------------------------------- app --------------------------------------------------------*/
	public async insertSession(req: Request, res: Response, next) {
		try {
			res.send(await session.insertSession(req.body));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 400
			next(err);
			console.log(
				"An error occurred while inserting session :" +
				error +
				`: ${SessionController.name} -> insertSession`
			);
		}
	}

	public async getSession(req: Request, res: Response, next) {
		try {
			res.send(await session.getSession());
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 404
			next(err);
			console.log(
				"An error occurred while getting session :" +
				error +
				`: ${SessionController.name} -> getSession`
			);
		}
	}

	public async getSessionById(req: Request, res: Response, next) {
		try {
			res.send(await session.getSessionById(req.body.id));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 404
			next(err);
			console.log(
				"An error occurred while getting session :" +
				error +
				`: ${SessionController.name} -> getSessionById`
			);
		}
	}

	public async updateSession(req: Request, res: Response, next) {
		try {
			res.send(await session.updateSession(req.body.session, req.body.id));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 400
			next(err);
			console.log(
				"An error occurred while updating session :" +
				error +
				`: ${SessionController.name} -> updateSession`
			);
		}
	}

	public async deleteSession(req: Request, res: Response, next) {
		try {
			res.send(await session.deleteSession(req.body.id));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 500
			next(err);
			console.log(
				"An error occurred while deleting session :" +
				error +
				`: ${SessionController.name} -> deleteSession`
			);
		}
	}

}