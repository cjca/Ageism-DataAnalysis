# Data Dictionary for Ageism Doctorial Research Project
All Data and Information associated with this project and the included
files are Copyright 2025, 2026 Christopher J. Carlson. All Rights Reserved.

## Data Collection Information
Data Collected from Qualtrics Survey between the following date/times:

- November 13, 2025 @ 3:40pm to
- December 31, 2025 @ 5:50pm

Collection Timespan: 48 Days

## Research Questions

- Research Question 1: What is the correlation, if any, between an IT worker’s own age and the age at which they feel a person is deemed “old”.
- Research Question 2: What impact, if any, does continued education, skills development, and level of education have on the perceptions of value of an older IT individual or workforce?
- Research Question 3: How ageist is the IT industry as compared to other industries?

# Data Dictionary

## Qualtrics Survey Data
All these questions are Internally Reported Only. They do not appear on the survey that the subject participated in. Anything listed with [Factor] are items that I factored in the R Analysis.

```

StartDate = Date & Time Survey Started (America/Chicago Time zone)
    Format: Lubridate Date/Time Format (POSIX)

EndDate = Date & Time Survey Ended (America/Chicago Time zone)
    Format: Lubridate Date/Time Format (POSIX)

Status = Survey Type of Response from Qualtrics
    Format: character (String) [Factor]
    Options: 0  / IP Address: Normal Response
             1  / Survey Preview: A Preview Response
             2  / Survey Test: A Test Response
             3  / Imported: An Imported Response
             16 / Offline: A Qualtrics Offline App Response

Progress = Percent Completed
    Format: numeric (Integer)

Duration = How long the survey took to complete (in seconds)
    Format: numeric (Integer)

Finished = Whether the Survey was completed or not
    Format = logical (True/False)

RecordedDate = Date Survey was Taken
    Format: Lubridate Date/Time Format (POSIX)

ResponseID = Unique Identifier from Qualtrics [NOT NEEDED]
    Format: character (String)

DistributionChannel = How Survey was Received from Survey Taker
    Format: character (String) [Factor]

UserLanguage = Language of Survey Only English [NOT NEEDED]
    Format: character (String)

Q_RelevantIDDuplicate = No Longer Used [NOT NEEDED]
    Format: character (String)

Q_RelevantIDDuplicateScore = No Longer Used [NOT NEEDED]
    Format: character (String)

Q_RelevantIDFraudScore = No Longer Used [NOT NEEDED]
    Format: character (String)

Q_RelevantIDLastStartDate = No Longer Used [NOT NEEDED]
    Format: character (String)

Q_DuplicateRespondent: Likely Duplicate Survey
    Format: character (String) = TRUE or N/A
```

## Demographics Questions
These questions ask the user about themselves to better understand how their demographics may impact their answers. The answers to these questions will be used in inferential statistical analysis to determine if there are any correlations within the data. We will also use the Survey Takers Age to help answer **Research Question 1.**
```
Age = Survey Takers Age [7 Options]
    Format: character (String) [Factor]
    Values: "Under 18"
            "18-24 years old"
            "25-34 years old"
            "35-44 years old"
            "45-54 years old"
            "55-64 years old"
            "65+ years old"

Gender = Survey Takers Self-Identified Gender [4 Options]
    Format: character (String) [Factor]
    Values: "Male"
            "Female"
            "Non-binary / third gender"
            "Prefer not to say"

Country = List of Countries (Qualtrics Standard Question)
    Format: character (String) [Factor]

Education = Highest Level of Survey Taker's Formal Education [7 Options]
    Format: character (String) [Factor]
    Values: "Some high school or no formal schooling"
            "High school diploma, GED or equivalent"
            "Some college, but no degree"
            "Associates, vocational, technical degree or equivalent"
            "Bachelor's degree or equivalent"
            "Graduate Degree (MA, MS, MBA, etc.)"
            "Terminal degree (PhD, EdD, JD, MD, DDS, etc.)"

IT_Field = List of IT Fields [16 Options]
    Format: character (String) [Factor]
    Values: "Software Development"
            "Data & Analytics"
            "Cloud Infrastructure & DevOps"
            "Cybersecurity"
            "AI & Machine Learning"
            "IT Support & Help Desk"
            "Systems & Network Administration"
            "Product & Project Management"
            "QA & Testing"
            "UI/UX & Design"
            "Blockchain & Web3"
            "Robotics & Embedded Systems"
            "IT Consulting & Strategy"
            "Education & Training"
            "Other / Hybrid / Interdisciplinary"

IT_Industry = List of IT Industries [16 Options]
    Format: character (String) [Factor]
    Values: "Information Technology"
            "Finance & Banking"
            "Healthcare & Life Science"
            "Government & Public Sector"
            "Education"
            "Retail & E-Commerce"
            "Manufacturing & Industrial"
            "Telecommunications"
            "Media & Entertainment"
            "Energy & Utilities"
            "Transportation & Logistics"
            "Legal & Professional Services"
            "Real Estate & Construction"
            "Nonprofit & NGOs"
            "Agriculture & Food Services"
            "Other / Multisector / Freelance"
```


##  Age Perception Questions
The following are Likert scale questions with appropriate data. These questions will be used to help answer **Research Question 1**.

```
Age_Perception Values [14 Questions]:

This is a 5-Point Likert scale with the following point values:
1 = Very Young
2 = Young
3 = Middle Aged
4 = Old
5 = Very Old

--------------------------
Age_Perception_1 = 18-21
Age_Perception_2 = 22-25
Age_Perception_3 = 26-30
Age_Perception_4 = 31-35
Age_Perception_5 = 36-40
Age_Perception_6 = 41-45
Age_Perception_7 = 46-50
Age_Perception_8 = 51-55
Age_Perception_9 = 56-60
Age_Perception_10 = 61-65
Age_Perception_11 = 66-70
Age_Perception_12 = 71-75
Age_Perception_13 = 76-80
Age_Perception_14 = 81+
```

## Ageism Employment Questions
These questions take the Fraboni Scale and adapt it to a more workforce related scale. I will use the answers
here to help answer **Research Question 2**
```
Ageism_Employment Values [19 Questions]:

This is a 5-Point Likert scale with the following point values:
1 = Strongly Disagree
2 = Somewhat Disagree
3 = Neither Agree nor Disagree
4 = Somewhat Agree
5 = Strongly Agree

The following Questions are REVERSE SCORED:
Ageism_Employment_2
Ageism_Employment_5
Ageism_Employment_19

! = Reverse Scale Scored
----------------------------------------
Ageism_Employment_1   = After a certain age, older IT workers should be forced
                        to retire.
!Ageism_Employment_2  = I prefer working with coworkers my own age than
                        working with older coworkers.
Ageism_Employment_3   = The skills older IT workers have are often no longer
                        applicable today.
Ageism_Employment_4   = Older IT workers just don't understand today's
                        technology.
!Ageism_Employment_5  = I enjoy diverse age groups at social work events.
Ageism_Employment_6   = Older IT workers don't have as much to offer in the
                        workforce as younger IT workers.
Ageism_Employment_7   = It's generally harder to work with older coworkers.
Ageism_Employment_8   = I prefer hanging out with coworkers my own age at
                        social work events.
Ageism_Employment_9   = Older people are still working because they didn't
                        save enough in their younger years.
Ageism_Employment_10  = Older people are just not as technologically savvy as
                        younger people.
Ageism_Employment_11  = Older IT workers don't stay up-to-date with industry
                        trends.
Ageism_Employment_12  = It’s important to my career to earn certifications.
Ageism_Employment_13  = Older coworkers who participate in continuing
                        education are easier to work with.
Ageism_Employment_14  = Staying current with technological trends is critical
                        to a person's success in the workforce.
Ageism_Employment_15  = Not staying current with technology is one of the
                        biggest issues with older IT workers.
Ageism_Employment_16  = Older IT workers who pursue continuing education are
                        more competent in their job.
Ageism_Employment_17  = I have a higher level of respect for IT workers who
                        pursue continuing education.
Ageism_Employment_18  = Continuing education is important for anyone to be
                        successful in an IT career.
!Ageism_Employment_19 = I don't need continuing education to remain competent
                        at my current IT role.
```
## Fraboni Scale Questions
These questions are from the Fraboni Scale of Ageism from Fraboni, Saltstone & Hughes (1990). Further information can be found at https://doi.org/10.1037/t59400-000
I will use answers to this question to help answer **Research Question #3**
```
Fraboni_Scale Values [29 Questions]:

This is a 4-Point Likert Scale with the following point values:
1 = Strongly Disagree
2 = Disagree
3 = Agree
4 = Strongly Agree

The following Questions are REVERSE SCORED:
Fraboni_Scale_8
Fraboni_Scale_12
Fraboni_Scale_14
Fraboni_Scale_21
Fraboni_Scale_22
Fraboni_Scale_23
Fraboni_Scale_24

! = Reverse Scale Scored
------------------------------------
Fraboni_Scale_1   = Teenage suicide is more tragic than suicide among the old.
Fraboni_Scale_2   = There should be special clubs set aside within sports
                    facilities so that old people can compete at their own
                    level.
Fraboni_Scale_3   = Many old people are stingy and hoard their money and
                    possessions.
Fraboni_Scale_4   = Many old people are not interested in making new friends,
                    preferring instead the circle of friends they have had for
                    years.
Fraboni_Scale_5   = Many old people just live in the past.
Fraboni_Scale_6   = I sometimes avoid eye contact with old people when I see
                    them.
Fraboni_Scale_7   = I don’t like it when old people try to make conversation
                    with me.
!Fraboni_Scale_8  = Old people deserve the same rights and freedoms as do
                    other members of our society.
Fraboni_Scale_9   = Complex and interesting conversation cannot be expected
                    from most old people.
Fraboni_Scale_10  = Feeling depressed when around old people is probably a
                    common feeling.
Fraboni_Scale_11  = Old people should find friends their own age.
!Fraboni_Scale_12 = Old people should feel welcome at the social gatherings
                    of young people.
Fraboni_Scale_13  = I would prefer not to go to an open house at a senior’s
                    club, if invited.
!Fraboni_Scale_14 = Old people can be very creative.
Fraboni_Scale_15  = I personally would not want to spend much time with an old
                    person.
Fraboni_Scale_16  = Most old people should not be allowed to renew their
                    driver’s licenses.
Fraboni_Scale_17  = Old people don’t really need to use our community sports
                    facilities.
Fraboni_Scale_18  = Most old people should not be trusted to take care of
                    infants.
Fraboni_Scale_19  = Many old people are happiest when they are with people
                    their own age.
Fraboni_Scale_20  = It is best that old people live where they won’t bother
                    anyone.
!Fraboni_Scale_21 = The company of most old people is quite enjoyable.
!Fraboni_Scale_22 = It is sad to hear about the plight of the old in our
                    society these days.
!Fraboni_Scale_23 = Old people should be encouraged to speak out politically.
!Fraboni_Scale_24 = Most old people are interesting, individualistic people.
Fraboni_Scale_25  = Most old people would be considered to have poor personal
                    hygiene.
Fraboni_Scale_26  = I would prefer not to live with an old person.
Fraboni_Scale_27  = Most old people can be irritating because they tell the
                    same stories over and over again.
Fraboni_Scale_28  = Old people complain more than other people do.
Fraboni_Scale_29  = Old people do not need much money to meet their needs.

The Fraboni Questions are assigned in 3 different 'Factors'.

Factor 1: Antilocution (10 Questions)
Q 1,3,4,5,9,16,25,27,28,29

Factor 2: Discrimination (9 Questions)
Q 2,8,17,18,20,21,22,23,24

Factor 3: Avoidance (10 Questions)
Q 6,7,10,11,12,13,14,15,19,26
```
## Personal Experience Questions
These questions help understand a person's own experience with Ageism. I will use it to help understand how a person's age in the field of IT might experience Ageism based on their age.
```
Personal Experience Questions [10 Questions]

-1 = False
0  = Neither true nor false
1  = True

Personal_Experience_1  = I believe my age has prevented me from receiving a
                         promotion at my place of employment.
Personal_Experience_2  = I believe my age has prevented me from receiving
                         training at my place of employment.
Personal_Experience_3  = I believe my age has prevented me from receiving a
                         job.
Personal_Experience_4  = I feel I have been excluded from groups or events at
                         my place of employment due to my age.
Personal_Experience_5  = I feel my age has been used against me (directly or
                         indirectly) at my place of employment.
Personal_Experience_6  = I believe my company would like me to retire soon.
Personal_Experience_7  = I have been harassed at my place of employment due to
                         my age.
Personal_Experience_8  = I have felt uncomfortable at my place of employment
                         as a direct result of my age.
Personal_Experience_9  = I feel I have been let go or fired from a position
                         because of my age.
Personal_Experience_10 = I believe more challenging assignments are given to
                         younger people at my place of employment.

```
## Comments Section
A section for people to leave anonymous comments related to the survey.
```
Comments = Area to put comments from the Survey Taker.
    Format: character (String)
```
