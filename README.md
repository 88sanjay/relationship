## Auto Relationship Creation

#### Introduction

The aim of this module is to auto-identify if a particular item / group of items
are part of an existing VC group forms a VC group amongst themselves.

#### Algorithm Walk Through

* Read item input and final Table from Hive
* Filter out items
* Inner join logic
* Calculation of link scores
* Find connected components
* Identify theme
* Create update table
