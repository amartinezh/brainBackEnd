import { Request, Response } from "express";
import { UserDAO } from "../repository/IndustryBackDB/userDAO";
import { Token } from "../models/interfaces/token.interface";
import { ErrorEnum } from "../models/ETLBackEnd/error";
import * as jwt from 'jsonwebtoken'
//import { } from "express-jwt";

let people = new UserDAO();

export class UserController {
	/*-------------------------------- app --------------------------------------------------------*/
	public async insertPeople(req: Request, res: Response, next) {
		try {
			res.send(await people.insertPeople(req.body));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 400
			next(err);
			console.log(
				"An error occurred while inserting user :" +
				error +
				`: ${UserController.name} -> insertPeople`
			);
		}
	}

	public async getPeople(req: Request, res: Response, next) {
		try {
			res.send(await people.getPeople());
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 404
			next(err);
			console.log(
				"An error occurred while getting users :" +
				error +
				`: ${UserController.name} -> getPeople`
			);
		}
	}

	public async getPeopleById(req: Request, res: Response, next) {
		try {
			res.send(await people.getPeopleById(req.body));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 404
			next(err);
			console.log(
				"An error occurred while getting user :" +
				error +
				`: ${UserController.name} -> getPeopleById`
			);
		}
	}

	public async updatePeople(req: Request, res: Response, next) {
		try {
			res.send(await people.updatePeople(req.body));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 400
			next(err);
			console.log(
				"An error occurred while updating user :" +
				error +
				`: ${UserController.name} -> updatePeople`
			);
		}
	}

	public async deletePeople(req: Request, res: Response, next) {
		try {
			res.send(await people.deletePeople(req.body.id));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 500
			next(err);
			console.log(
				"An error occurred while deleting user :" +
				error +
				`: ${UserController.name} -> deletePeople`
			);
		}
	}

}