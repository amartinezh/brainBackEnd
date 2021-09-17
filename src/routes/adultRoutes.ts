import {Request, Response, NextFunction} from "express";
import { AdultController } from "../controllers/adultController";
import * as auth from '../authService'
var cors = require('cors');
export class AdultRoutes { 
    
    public adultController: AdultController = new AdultController();

    public routes(app): void {   
        
        app.use(cors());

        app.route('/adult/insert').post(auth,this.adultController.insertAdult)

        app.route('/adult/get')
        .post(auth,this.adultController.getAdult)

        app.route('/adult/getById')
        .post(auth,this.adultController.getAdultById)

        app.route('/adult/update')
        .post(auth,this.adultController.updateAdult)

        app.route('/adult/delete')
        .post(auth,this.adultController.deleteAdult)
    }
}