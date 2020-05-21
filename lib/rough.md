Oystercard class - journey-related methods
Class Journey

functions

Start a journey.
 - Arugment which accepts station

Finish a journey
 - Argument which accepts station

Calculate the journey fare.

tell us whether or not in_journey?
 - Boolean

 store the journeys
 - {:"entry_station" => entry_station
 :"exit_station" => exit_station






# journeys
returns hash of entry and exit stations



(inside oyster.rb)
#initialize
@journey = Journey.new

#in_journey?
@journey.in_journey?



# appending to journey
some way to add the entry and exit stations to the hash

===

Points to consider

- fare class probably needed to tell you how much to deduct
- keep an eye on edge cases


Let's create a new Journey class, it should be responsible for starting a journey, finishing a journey, calculating the fare of a journey, and returning whether or not the journey is complete.

Extract - Class checklist
Step 1
Determine what to extract
Find logical units of data which are grouped together or operations which are performed on a subset of the data.

Step 2
Create a New Class
Create a new class with the extracted operations and establish a link from the old to new class. This link might be bidirectional.

Step 3
Rename the Old Class
If the name of the old class is not fitting anymore, consider renaming it.

Step 4
Review the interfaces and links of each class
The goal should be minimally coupled classes. Examine both classes to see if you can replace a bidirectional relationship with a unidirectional relationship.

Step 5
Value object vs. reference object
Decide whether you would like to expose the new object as a value object (immutable), or a reference object (may be modified).
