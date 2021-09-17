import {Request, Response, NextFunction} from "express";
import { UserController } from "../controllers/userController";
import * as auth from '../authService'
var cors = require('cors');
export class UserRoutes { 
    
    public userController: UserController = new UserController();

    public routes(app): void {   
        
        app.use(cors());

        app.route('/user2/insert').post(auth,this.userController.insertPeople)

        app.route('/user2/get')
        .post(auth,this.userController.getPeople)

        app.route('/user2/getById')
        .post(auth,this.userController.getPeopleById)

        app.route('/user2/update')
        .post(auth,this.userController.updatePeople)

        app.route('/user2/delete')
        .post(auth,this.userController.deletePeople)
    }
}