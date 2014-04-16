// The structure of this interview was relatively informal, but we started with some
// basic questions on javascript, and progressed to some more language agnostic and
// algorithmic questions (see whiteboard.rb)

// (1) Can you compare the class/object systems used by Javascript and Ruby?

// (2) Say we wanted to create 'People' objects. How could we do this?
function Person(first, last) {
  this.first_name = first;
  this.last_name = last;
}

var person = new Person('Sam', 'Nebel')

// (3) How could we adjust this so that we could call person.fullName() => 'Sam Nebel'
function Person(first, last) {
  this.first_name = first;
  this.last_name = last;
  this.fullName = function(){
    return this.first_name + ' ' + this.last_name;
  }
}

// (4) Say we wanted to chain methods on a person and have the person's full get
//     name get, but be able to call person.fullName().hello() => 'Hello, Sam Nebel'
function Person(first, last) {
  this.first_name = first;
  this.last_name = last;
  this.fullName = function(){
    this.full_name = this.first_name + ' ' + this.last_name;
    return this;
  };
  this.hello = function(){
    return 'Hello, ' + this.full_name;
  };
}
var p = new Person('Sam', 'Nebel')
p.fullName().hello(); // => 'Hello, Sam Nebel'