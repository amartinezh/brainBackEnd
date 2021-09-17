import { Request, Response } from "express";
import { AdultDAO } from "../repository/IndustryBackDB/adultDAO";
import { Token } from "../models/interfaces/token.interface";
import { ErrorEnum } from "../models/ETLBackEnd/error";
import * as jwt from 'jsonwebtoken'
//import { } from "express-jwt";

let adult = new AdultDAO();

export class AdultController {
	/*-------------------------------- app --------------------------------------------------------*/
	public async insertAdult(req: Request, res: Response, next) {
		try {
			res.send(await adult.insertAdult(req.body));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 400
			next(err);
			console.log(
				"An error occurred while inserting adult :" +
				error +
				`: ${AdultController.name} -> insertAdult`
			);
		}
	}

	public async getAdult(req: Request, res: Response, next) {
		try {
			res.send(await adult.getAdult());
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 404
			next(err);
			console.log(
				"An error occurred while getting adults :" +
				error +
				`: ${AdultController.name} -> getAdult`
			);
		}
	}

	public async getAdultById(req: Request, res: Response, next) {
		try {
			res.send(await adult.getAdultById(req.body));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 404
			next(err);
			console.log(
				"An error occurred while getting adult :" +
				error +
				`: ${AdultController.name} -> getAdultById`
			);
		}
	}

	public async updateAdult(req: Request, res: Response, next) {
		try {
			res.send(await adult.updateAdult(req.body));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 400
			next(err);
			console.log(
				"An error occurred while updating adult :" +
				error +
				`: ${AdultController.name} -> updateAdult`
			);
		}
	}

	public async deleteAdult(req: Request, res: Response, next) {
		try {
			res.send(await adult.deleteAdult(req.body.id));
		} catch (error) {
			let err: ErrorEnum = new Error(error);
			err.status = 500
			next(err);
			console.log(
				"An error occurred while deleting adult :" +
				error +
				`: ${AdultController.name} -> deleteAdult`
			);
		}
	}

}