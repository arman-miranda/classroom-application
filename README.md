## Things to be done and things that are done in this implementation.

* ### Notes:
  * ~~Split Users to two resources that has different functions (Teachers and Students)~~
  * ~~No anonymous users~~
  * Subjects has their own virtual classrooms
  * A Block also has their own virtual classroom
  * All virtual classrooms adds the teachers and students automatically

---
* ### Pages
  
  * Can be accessed by all:
    * Profile Page
      * Can only edit email and password
      * Can view all info of user
    * ~~Login Page(with Devise)~~
  
  * Student pages
    * List of Subjects
    * List of Grades per Subject(Final grade only, blank if not yet computed)

  * Teacher pages
    * List of student per class he handles.
    * List of assignments/lectures/lessons per class.
    * List of exam schedule per class.
  
  * ~~Admin pages~~
    * ~~Admin page~~
    * ~~List of users~~
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

  * ### ~~Subject:~~

    * ~~It should be able to recognize the block it is assigned to.~~
    * ~~It should be able to recognize and assign teachers that can teach the subject.~~
    * ~~It should be able to recognize students that takes this subject.~~

---

* ### ~~Active Admin CRUD~~

  * #### ~~All Users~~
    * ~~Shows all users and admins could give roles to any user.~~
    * ~~Fix error where when adding a new role, the resource associated isn't destroyed.~~
    * ~~Can add, edit, and delete users along with its associated resource~~
  
  * #### ~~Teachers~~ 
    * ~~Should be able to be assigned to a teachable block. (Blocks where at least one of the subject he teaches is included)~~

  * #### ~~Student~~
    * ~~Should be able to be assigned to a block.~~
    * ~~Subjects should be able to be automatically accessed by the Students by block assignment.~~
  
  * #### ~~Subjects~~
    * ~~Can be assigned to a block.~~
    * ~~Can be assigned teachers that teaches can teach this subject.~~

  * #### ~~Blocks~~
    * ~~Can be assigned a class advisor.~~

---

* ### ~~Tests~~
  * ~~Users~~
  * ~~Subjects~~ -> Has more tests but for extra features only
  * ~~Blocks~~

---
