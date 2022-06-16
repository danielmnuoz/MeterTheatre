import { Component, Input, OnInit } from '@angular/core';
import { Meter } from '../meter'
import { Socket } from '../socket'
import { SocketService } from '../socket.service';

@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrls: ['./details.component.css']
})
export class DetailsComponent implements OnInit {

  constructor(private socketService: SocketService) { }

  ngOnInit(): void {
  }

  @Input() socket?: Socket;

  updateSocketOwner(owner: string) {
    if (this.socket && this.socket.owner) {
      this.socket.owner = owner;
      this.socketService.updateSocket(this.socket);
    }
  }

  newSocket(owner: string): void {
    var createdSocket: Socket = { id: 47, owner: owner, meter: { id: 0, owner: owner, lanID: "0" }, location: 2, floor: 2, voltage: 120, form: "2s" };
    this.socketService.addSocket(createdSocket)
      .subscribe(socket => {
        console.log(socket.owner)
      });
  }

  deleteSocket(): void {
    if (this.socket) {
      this.socketService.deleteSocket(this.socket.id).subscribe();
    }
  }

}
