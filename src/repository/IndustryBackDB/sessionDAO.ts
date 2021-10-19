import { DataBaseService } from '../../db/dev/dataBaseService';
import * as uuid from "uuid";
import { Session } from 'models/ETLBackEnd/session';
import { LogEnum } from '../../models/ETLBackEnd/log.enum';
import { LogDAO } from './logDAO';
import * as bcrypt from 'bcrypt'

export class SessionDAO {

    private log: LogDAO;
    private connection;
    constructor() {
        this.connection = DataBaseService.getInstance();
        this.log = new LogDAO()
    }

    public async insertSession(session: Session) {
        try {
            this.connection.pool.query('INSERT INTO test.session (id_user, id_adult, correct, wrong, date, observations, exercises) VALUES ($1, $2, $3, $4, $5, $6, $7)', [session.id_user, session.id_adult, session.correct, session.wrong, session.date, session.observations, session.exercises], (error, results) => {
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
            this.connection.pool.query('UPDATE test.session SET id_user = $1 , id_adult = $2 , correct = $3 , wrong = $4 , date = $5 , observations = $6 , exercises = $7   WHERE id = $8',  [session.id_user, session.id_adult, session.correct, session.wrong, session.date, session.observations, session.exercises, id], (error, results) => {
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
