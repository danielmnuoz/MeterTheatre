import { Injectable } from '@angular/core';
import { InMemoryDbService, RequestInfo } from 'angular-in-memory-web-api';
import { Observable } from 'rxjs';
import { Meter } from './meter';
import { Socket } from './socket';
import { User } from './user';

@Injectable({
  providedIn: 'root'
})
export class InMemoryDataService implements InMemoryDbService {
  // TODO: invalids - ie bad user id
  createDb(reqInfo?: RequestInfo | undefined): {} | Observable<{}> | Promise<{}> {
    const meters: Meter[] = [
      {id: 1, lanID: '12345678', floor: 2, form: '2S', location: 1, lowVoltage: 120, highVoltage: 240, serialNumber: 111111111, userID: 1},
      {id: 2, lanID: '22345678', floor: 2, form: '2S', location: 1, lowVoltage: 120, highVoltage: 240, serialNumber: 222222222, userID: 1},
      {id: 3, lanID: '32345678', floor: 2, form: '2S', location: 1, lowVoltage: 120, highVoltage: 240, serialNumber: 333333333, userID: 1},
      {id: 4, lanID: '42345678', floor: 6, form: '2S', location: 1, lowVoltage: 120, highVoltage: 240, serialNumber: 444444444, userID: 2},
      {id: 5, lanID: '52345678', floor: 6, form: '2S', location: 1, lowVoltage: 120, highVoltage: 240, serialNumber: 555555555, userID: 3}
    ];
    const sockets: Socket[] = [
      {id: 1, meterID: 1, voltage: 120, form: '2S', location: 1, floor: 2, userID: 1},
      {id: 2, meterID: 2, voltage: 120, form: '2S', location: 2, floor: 2, userID: 1},
      {id: 3, meterID: 3, voltage: 120, form: '2S', location: 1, floor: 6, userID: 1},
      {id: 4, meterID: 4, voltage: 120, form: '2S', location: 2, floor: 6, userID: 2},
      {id: 5, meterID: 5, voltage: 120, form: '2S', location: 3, floor: 2, userID: 3}
    ];
    const users: User[] = [
      {id: 1, name: 'name1', meterIDs: [meters[0].id, meters[2].id], socketIDs: [sockets[1].id, sockets[2].id]},
      {id: 2, name: 'name2', meterIDs: [meters[1].id, meters[3].id], socketIDs: [sockets[0].id, sockets[3].id]},
      {id: 3, name: 'name3', meterIDs: [meters[4].id], socketIDs: [sockets[4].id]}
    ];
    return {meters, sockets, users};
  }

  genSocketId(sockets: Socket[]): number {
    return sockets.length > 0 ? Math.max(...sockets.map(socket => socket.id)) + 1 : 1;
  }
  genMeterId(meters: Meter[]): number {
    return meters.length > 0 ? Math.max(...meters.map(meter => meter.id)) + 1 : 1;
  }
  genUserId(users: User[]): number {
    return users.length > 0 ? Math.max(...users.map(user => user.id)) + 1 : 1;
  }

}
