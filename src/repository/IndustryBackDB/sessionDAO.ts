import { DataBaseService } from '../../db/dev/dataBaseService';
import * as uuid from "uuid";
import { Session } from 'models/ETLBackEnd/session';
import { SessionExercise } from 'models/ETLBackEnd/session_exercise';
import { LogEnum } from '../../models/ETLBackEnd/log.enum';
import { LogDAO } from './logDAO';
import * as bcrypt from 'bcrypt'
import { MediaExercise } from 'models/ETLBackEnd/media_exercise';

export class SessionDAO {

    private log: LogDAO;
    private connection;
    constructor() {
        this.connection = DataBaseService.getInstance();
        this.log = new LogDAO()
    }

    public async insertSession(session: Session) {
        try {
            this.connection.pool.query('INSERT INTO test.session (id_user, id_adult, date, observations) VALUES ($1, $2, $3, $4)', [session.id_user, session.id_adult, session.date, session.observations], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              })
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${SessionDAO.name} -> ${this.insertSession.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async getSessionId(session: Session) {
        try {
            var res = await this.connection.pool.query('SELECT id FROM test.session where (id_user=$1 AND id_adult=$2) AND (date=$3 AND observations = $4);',[session.id_user, session.id_adult, session.date, session.observations], "").then(res => { return res.rows[0] })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${SessionDAO.name} -> ${this.getSessionId.name}: ${error}`)
            return new Error(error);
        }
    }

    public async insertExerciseSession(sessionExercise: SessionExercise){
        try {
            for(let i =0; i<sessionExercise.id_exercise.length; i++){
                this.connection.pool.query('INSERT INTO test.session_exercise (id_session, id_exercise, correct, observation) VALUES ($1, $2, $3, $4)', [sessionExercise.id_session, sessionExercise.id_exercise[i], sessionExercise.correct[i], sessionExercise.observation[i]], (error, results) => {
                    if (error) {
                      throw error
                    }
                    return results;
                  })
            } 
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${SessionDAO.name} -> ${this.insertExerciseSession.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async insertMediaExercise(mediaExercise: MediaExercise){
        try {
            for(let i =0; i<mediaExercise.id_media.length; i++){
                this.connection.pool.query('INSERT INTO test.exercise_media (id_session, id_exercise, id_media, observation) VALUES ($1, $2, $3, $4)', [mediaExercise.id_session, mediaExercise.id_exercise[i], mediaExercise.id_media[i], mediaExercise.observation[i]], (error, results) => {
                    if (error) {
                      throw error
                    }
                    return results;
                  })
            } 
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${SessionDAO.name} -> ${this.insertMediaExercise.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async getSession() {
        try {
            var res = await this.connection.pool.query('SELECT * FROM test.session', "").then(res => { return res.rows })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${SessionDAO.name} -> ${this.getSession.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async getSessionById(sessionId: string) {
        try {
            var res = await this.connection.pool.query('SELECT * FROM test.session where id = $1', [sessionId], "").then(res => { return res.rows[0] })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${SessionDAO.name} -> ${this.getSessionById.name}: ${error}`)
            return new Error(error);
        }
    }

    public async updateSession(session: Session, id: string) {
        try {
            this.connection.pool.query('UPDATE test.session SET id_user = $1 , id_adult = $2 , date = $5 , observations = $6   WHERE id = $8',  [session.id_user, session.id_adult, session.date, session.observations, id], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              });
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${SessionDAO.name} -> ${this.updateSession.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async deleteSession(sessionId: string) {
        try {
            this.connection.pool.query('DELETE FROM test.session WHERE id = $1', [sessionId], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              });
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${SessionDAO.name} -> ${this.deleteSession.name}: ${error}`)
            throw new Error(error)
        }
    }

}
