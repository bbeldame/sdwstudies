import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { AppComponent }  from './app.component';
import { AddStudentDirective } from './directives/add.student.dir';
import { ShowStudentDirective } from './directives/show.student.dir';

@NgModule({
  imports: [ BrowserModule, FormsModule ],
  declarations: [ AppComponent, AddStudentDirective, ShowStudentDirective ],
  bootstrap: [ AppComponent ]
})
export class AppModule { }
