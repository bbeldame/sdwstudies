import { Component, Input, Output, EventEmitter } from '@angular/core';
import { Config } from '../config';
import { Student } from '../dataModel/student.data.model';

@Component({
    selector: 'show-student',
    templateUrl: 'app/partials/directives/show.student.dir.html'
})

export class ShowStudentDirective {
    editpls = Config.edit_pls;
    editbtn = Config.edit_btn;
    state = Config.state;
    @Input() student: Student;
    @Output() sendOnselect = new EventEmitter();
    onSelect(event: any){
        this.sendOnselect.emit(this.student);
    }
}