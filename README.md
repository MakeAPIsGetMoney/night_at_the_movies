## Overview

**A Night at the Movies** provides a fun mash up of your favorite movies and music genres. Using data from the IMDB database and Spotify, we'll tell you all the information you need to know about your favorite movie, as well as the most popular song that came out the same year as the movie. Get ready for Netflix & Chill (or #tbt).

## Usage

### Installation

To successfully run this program:
* Clone this reponsitory to your local machine.
* Run `bundle install`
* Sign up for a [MyAPIFilms](http://www.myapifilms.com/index.do) key and store it in your local environment with name `MYAPIFILMS_KEY`.
* Boot up your server!

### API Documentation

The API endpoint is available through `/api/v1/search`. All the API needs is two parameters: a **movie title** and a **music genre.** These should be passed in like so:

`api/v1/search/movietitle/musicgenre`

To retrieve a json response of the data, add `,json` to the end of the request. Otherwise, we'll return an HTML page with a brief overview of the data.

All requests use the **GET** method and can be made through your browser.

### Example Results

Sample request: `/api/v1/search/this%20is%20spinal%20tap/pop.json`

Sample results:

```
{
"success": true,
"results": {
"movie": {
"title": "This Is Spinal Tap",
"year": 1984,
"director": "Rob Reiner",
"actors": [
{
"name": "Rob Reiner",
"role": "Marty DiBergi"
},
{
"name": "Kimberly Stringer",
"role": "Heavy Metal Fan"
},
{
"name": "Chazz Dominguez",
"role": "Heavy Metal Fan"
},
{
"name": "Shari Hall",
"role": "Heavy Metal Fan"
},
{
"name": "R.J. Parnell",
"role": "Mick Shrimpton"
},
{
"name": "David Kaff",
"role": "Viv Savage"
},
{
"name": "Tony Hendra",
"role": "Ian Faith"
},
{
"name": "Michael McKean",
"role": "David St. Hubbins"
},
{
"name": "Christopher Guest",
"role": "Nigel Tufnel"
},
{
"name": "Harry Shearer",
"role": "Derek Smalls"
},
{
"name": "Bruno Kirby",
"role": "Tommy Pischedda"
},
{
"name": "Jean Cromie",
"role": "Ethereal Fan"
},
{
"name": "Patrick Maher",
"role": "New York M.C."
},
{
"name": "Ed Begley Jr.",
"role": "John 'Stumpy' Pepys"
},
{
"name": "Danny Kortchmar",
"role": "Ronnie Pudding"
}
]
},
"song": {
"artists": [
{
"name": "Bruce Springsteen"
}
],
"song": "Dancing In the Dark",
"album": "Born In The U.S.A."
}
}
}
```
