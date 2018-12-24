**Forked from [swirl courses](https://github.com/swirldev/swirl_courses)**
## NICF- Statistics Bootcamp Workshops & References


<img align="right" src='http://www.aisp.sg/images/APP/ISS.jpg' width=25%>



**This [Statistics Bootcamp (SB)](https://www.iss.nus.edu.sg/executive-education/course/detail/nicf-statistics-bootcamp/analytics-and-intelligent-systems "Statistics Bootcamp") course is part of the Analytics and Intelligent Systems and Graduate Certificate in [Business Analytics Practice](https://www.iss.nus.edu.sg/stackable-certificate-programmes/business-analytics/graduate-certificate-in-business-analytics-practice "Business Analytics Practice") series offered by [NUS-ISS](https://www.iss.nus.edu.sg "Institute of Systems Science, National University of Singapore").**

**Co-Lecturer: [GU Zhan (Sam)](https://www.iss.nus.edu.sg/about-us/staff/detail/201/GU%20Zhan "GU Zhan (Sam)")**

[![alt text](https://www.iss.nus.edu.sg/images/default-source/About-Us/7.6.1-teaching-staff/sam-website.tmb-.png "Let's check Sam' profile page")](https://www.iss.nus.edu.sg/about-us/staff/detail/201/GU%20Zhan)

**zhan.gu@nus.edu.sg**


## Interactive R Workshops/Courses
This is a collection of interactive courses for use with the [swirl R package](http://swirlstats.com). You'll find instructions for installing courses further down on this page. Some courses are still in development and we'd love to hear any [suggestions](https://github.com/swirldev/swirl_courses/issues/new) you have as you work through them.

For more information regarding swirl, visit [swirlstats.com](http://swirlstats.com) or the [swirl GitHub repository](https://github.com/swirldev/swirl). If you'd like to write your own interactive content, please visit the [Instructors page](http://swirlstats.com/instructors.html) of our website.

Here are our current offerings, organized by level of difficulty:

#### Beginner

- **R Programming**: The basics of programming in R
- **Exploratory Data Analysis**: Statistics and Data visualization in R

#### Intermediate

- **Open Intro**: A review to statistics, data analysis, and data visualization `Additional workshop`
- **Mathematical Biostatistics Boot Camp**: One- and two-sample t-tests, power, and sample size `Additional workshop` 
- **Regression Models**: The basics of regression modeling in R

#### Advanced

- **Statistical Inference**: This intermediate to advanced level course closely follows the
[Statistical Inference course](https://www.coursera.org/course/statinference) of the Johns Hopkins 
[Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1) on Coursera. It
introduces the student to basic concepts of statistical inference
including probability, hypothesis testing, confidence intervals and
p-values. It concludes with an initiation to topics of particular
relevance to big data, issues of multiple testing and resampling.
- **Getting and Cleaning Data**: dplyr, tidyr, lubridate, hardcore time consuming data pre-processing `Additional workshop`

Since our users come from a variety backgrounds, it's very hard to label material as **Beginner**, **Intermediate**, or **Advanced**. If you find something that is labelled **Beginner** to be challenging, please don't be discouraged. The first step of learning anything is to acknowledge that you are capable of understanding it. True understanding will come with time and practice.


## Install and run a workshop/course automatically

It automates the process by allowing you to do everything right from the R console.

1) Make sure you have a recent version version of swirl:

```
install.packages("swirl")
```

2) Enter the following from the R console to install:

```
library(swirl)
install_course("R Programming")
install_course("Exploratory Data Analysis")
install_course("Regression Models")
install_course("Statistical Inference")
swirl()
```

For example, `install_course("R Programming")` will install the R Programming course. **Please note that course names are case sensitive!**


## Install and run additional workshop/course manually

If the automatic course installation method outlined above does not work for you, then there's a simple alternative.

1) Click [**here**](https://github.com/telescopeuser/S-SB-Workshop/archive/master.zip "S-SB-Workshop-master.zip") to download the file `S-SB-Workshop-master.zip`.

2) Install all all available courses:

```
install_course_zip("~/Downloads/S-SB-Workshop-master.zip", multi=TRUE)
```

---

Or, to install one course at a time, enter the following from the R console, **substituting the correct file path** to your downloaded file and the **name of your desired course**:

```
library(swirl)
install_course_zip("path/to/file/here/S-SB-Workshop-master.zip", multi=TRUE, 
                   which_course="Course Name Here")
swirl()
```

For example, if you download the zip file to `~/Downloads/S-SB-Workshop-master.zip`, then the following command will install the R Programming course.

```
install_course_zip("~/Downloads/S-SB-Workshop-master.zip", multi=TRUE, which_course="R Programming")
```

**Please note that course names are case sensitive!**


## Uninstall a course

If you'd like to remove a course at any time, you can use `uninstall_course("Course Name Here")`.
If you'd like to remove all courses at any time, you can use `uninstall_all_courses(force = FALSE)`.

## Delete a user's progress

If you'd like to delete a user's workshop progress, you can use `delete_progress("User Name Here")`.

## Using swirl in the classroom

Instructors around the world are using swirl in their classrooms. We think this is awesome. If you're an instructor, please feel free to do the same -- free of charge. While your students may be paying to take your course or attend your institution, we simply ask that you don't charge people *directly* for the use of our software or instructional content.

If you are not sure about a particular use case, don't hesitate to send us an email at info@swirlstats.com.
