// const axios = require('axios');

// const options = {
//   method: 'GET',
//   url: 'https://exercisedb.p.rapidapi.com/exercises/bodyPartList',
//   headers: {
//     'X-RapidAPI-Key': 'f925a3a868msh31590fab0d6261cp10a4dcjsn69a1919dfed5',
//     'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
//   }
// };

// async function getData() {
// try {
// 	const response = await axios.request(options);
// 	console.log(response.data);
// } catch (error) {
// 	console.error(error);
// }
// }

// getData();

const axios = require('axios');

const options = {
  method: 'GET',
  url: 'https://exercisedb.p.rapidapi.com/exercises/bodyPartList',
  headers: {
    'X-RapidAPI-Key': 'f925a3a868msh31590fab0d6261cp10a4dcjsn69a1919dfed5',
    'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
  }
};

async function getData(){
try {
	const response = await axios.request(options);
	console.log(response.data);
} catch (error) {
	console.error(error);
}
}

getData()