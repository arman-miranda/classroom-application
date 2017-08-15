# Things to be done and things that are done in this implementation.

* ### Notable Changes from the Master Branch:
  * ~~Split Users to two resources that has different functions (Teachers and Students)~~

---

* ## Listings

  * ### Student:

    * ~~Student should be able to be added to a block~~

      * ~~Students should be automatically be able to access every subject the block has.~~
      * Students should be able to check their final grades for each subjects

  * ### ~~Teacher:~~
  
    * ~~Teacher should be able to be assigned to an advisory block.~~
    * ~~Teacher should be able to assigned to various teaching assignments.~~

      * ~~Teacher should be able to know what block the teaching assignment is on.~~
      * ~~Teacher should be able to know what subject he is going to be teaching in a particular teaching assignment~~
  
  * ### ~~Class:~~
    
    * ~~Should be able to be assigned many different subjects.~~
    * ~~Should be able to be assigned with many students.~~
    * ~~Should be able to recognized and be assigned with an advisory block.~~

  * ### Subject: 

    * It should be able to recognize the block it is assigned to.
    * It should be able to recognize and assign teachers that can teach the subject.
    * It should be able to recognize students that takes this subject.

---

* ### Active Admin CRUD

  * #### All Users
    * ~~Shows all users and admins could give roles to any user.~~
    * Fix error where when adding a new role, the resource associated isn't destroyed.
    * Fix error where student and teacher duplicates are possible.
    * ~~Can add, edit, and delete users along with its associated resource~~
  
  * #### Teachers (Still not sure how to implement)
    * Should be able to be assigned to a teachable block. (Blocks where at least one of the subject he teaches is included)

  * #### ~~Student~~
    * ~~Should be able to be assigned to a block.~~
    * ~~Subjects should be able to be automatically accessed by the Students by block assignment.~~
  
  * #### ~~Subjects~~
    * ~~Can be assigned to a block.~~
    * ~~Can be assigned teachers that teaches can teach this subject.~~

  * #### ~~Blocks~~
    * ~~Can be assigned a class advisor.~~

---
