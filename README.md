# Things to be done and things that are done in this implementation.

* ~~Split Users to two resources that has different functions (Teachers and Students)~~

* ### Student:

  * ~~Student should be able to be added to a block~~

    * ~~Students should be automatically be able to access every subject the block has.~~
    * Students should be able to check their final grades for each subjects

* ### Teacher: 
  
  * ~~Teacher should be able to be assigned to an advisory block.~~
  * ~~Teacher should be able to assigned to various teaching assignments.~~
    * ~~Teacher should be able to know what block the teaching assignment is on.~~
    * ~~Teacher should be able to know what subject he is going to be teaching in a particular teaching assignment~~

---

* ### Active Admin CRUD

  * All Users
    * ~~Shows all users and admins could give roles to any user.~~
    * Fix error where when adding a new role, the resource associated isn't destroyed.
    * Fix error where student and teacher duplicates are possible.
    * ~~Can add, edit, and delete users along with its associated resource~~
  
  * Teachers (Still not sure how to implement)
    * Should be able to be assigned to a teachable block. (Blocks where at least one of the subject he teaches is included)

  * Student
    * ~~Should be able to be assigned to a block.~~
    * ~~Subjects should be able to be automatically accessed by the Students by block assignment.~~
  
  * Subjects
    * Can be assigned to a block.
  * Blocks
    * Can be assigned a class advisor.
    * Can be assigned subjects that it contains.

---
