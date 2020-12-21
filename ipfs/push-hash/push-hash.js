/*
  Reads a text file, extracts the IPFS hash, and publishes it to the BCH blockchain.
*/

const lineReader = require("line-reader");

const BCHJS = require("@psf/bch-js");
const bchjs = new BCHJS();

const BchMessageLib = require("bch-message-lib/index.js");
const bchMsg = new BchMessageLib({ bchjs });

const textfile = "hashes.txt";

async function start() {
  try {
    const wif = process.env.WIF
    if(!wif) throw new Error('You must pass a WIF private key as an environment variable.')


    const lines = await readLines(textfile);
    console.log(`input text: ${JSON.stringify(lines, null, 2)}\n`);

    const lastLine = getLastLine(lines);

    console.log(`lastLine: ${lastLine}\n`);

    const splitLine = lastLine.split(" ");
    console.log(`splitLine: ${JSON.stringify(splitLine, null, 2)}\n`);

    const targetHash = splitLine[1]
    console.log(`target hash: ${targetHash}\n`);

    const hex = await bchMsg.memo.memoPush(targetHash, wif, 'IPFS UPDATE ')
    // console.log(`hex: ${hex}`)

    const txid = await bchjs.RawTransactions.sendRawTransaction(hex)
    console.log(`txid: ${txid}`)

    // Run a loop to keep the Docker container running.
    setInterval(function () {
      const now = new Date()
      console.log(`Timestamp: ${now.toLocaleString()}`)
      console.log(`IPFS hash: ${targetHash}, BCH TXID: ${txid}`)
    }, 60000)
  } catch (err) {
    console.error(err);
  }
}
start();

// Expect the output of readLines as the input to this function.
// Finds and returns the last non-empty line.
function getLastLine(lineData) {
  let lastLine = "";
  for (let i = 0; i < lineData.length; i++) {
    const thisLine = lineData[i];

    if (thisLine !== "") lastLine = thisLine;
  }

  return lastLine;
}

// Returns an array with each element containing a line of the file.
function readLines(filename) {
  return new Promise((resolve, reject) => {
    try {
      const data = [];
      const i = 0;

      lineReader.eachLine(filename, function(line, last) {
        try {
          // data.push(JSON.parse(line))
          data.push(line);

          // Uncomment to display the raw data in each line of the winston log file.
          //console.log(`line ${i}: ${line}`)
          //i++

          if (last) return resolve(data);
        } catch (err) {}
      });
    } catch (err) {
      console.log(`Error in readLines()`);
      return reject(err);
    }
  });
}
