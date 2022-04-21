const filePath = "";

const json = require(filePath);

const keys = Object.keys(json);

const sortedKeys = keys.sort();

let sortedJson = {};

sortedKeys.forEach(key => sortedJson[key] = json[key]);

fs.writeFileSync(filePath, JSON.stringify(sortedJson), {encoding: "utf-8"});
