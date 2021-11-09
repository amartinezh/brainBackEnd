import {Request, Response, NextFunction} from "express";
import { SessionController } from "../controllers/sessionController";
import * as auth from '../authService'
var cors = require('cors');
export class SessionRoutes { 
    
    public sessionController: SessionController = new SessionController();

    public routes(app): void {   
        
        app.use(cors());

        app.route('/session/insert').post(auth,this.sessionController.insertSession)

        app.route('/session/get')
        .post(auth,this.sessionController.getSession)

        app.route('/session/getById')
        .post(auth,this.sessionController.getSessionById)

        app.route('/session/getId')
        .post(auth,this.sessionController.getSessionId)

        app.route('/session/insertExerciseSession')
        .post(auth,this.sessionController.insertExerciseSession)

        app.route('/session/insertMediaExercise')
        .post(auth,this.sessionController.insertMediaExercise)

        app.route('/session/update')
        .post(auth,this.sessionController.updateSession)

        app.route('/session/delete')
        .post(auth,this.sessionController.deleteSession)
    }
}