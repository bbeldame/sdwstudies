"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var config_1 = require('../config');
var student_data_model_1 = require('../dataModel/student.data.model');
var ShowStudentDirective = (function () {
    function ShowStudentDirective() {
        this.editpls = config_1.Config.edit_pls;
        this.editbtn = config_1.Config.edit_btn;
        this.state = config_1.Config.state;
        this.sendOnselect = new core_1.EventEmitter();
    }
    ShowStudentDirective.prototype.onSelect = function (event) {
        this.sendOnselect.emit(this.student);
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', student_data_model_1.Student)
    ], ShowStudentDirective.prototype, "student", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', Object)
    ], ShowStudentDirective.prototype, "sendOnselect", void 0);
    ShowStudentDirective = __decorate([
        core_1.Component({
            selector: 'show-student',
            templateUrl: 'app/partials/directives/show.student.dir.html'
        }), 
        __metadata('design:paramtypes', [])
    ], ShowStudentDirective);
    return ShowStudentDirective;
}());
exports.ShowStudentDirective = ShowStudentDirective;
//# sourceMappingURL=show.student.dir.js.map