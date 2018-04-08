'use strict';

var assert = require('assert');

var tools = require('ethers-cli');

var deployToken = require('./deploy-contract.js');

var builder = null;
beforeEach(function() {

    // Construct a new test builder
    builder = new tools.TestBuilder(deployToken);

    // Deploy the contract into this builder
    return builder.deploy();

});

describe('Minting', function() {
    it('mints tokens to a call to mint', function() {

        // Create a connection to the contract as a different user (A)
        var accountA = builder.accounts[1];
        var tokenUserA = builder.deployed.connect(accountA);

        // Create a connection to the contract as a different user (B)
        var accountB = builder.accounts[2];
        var tokenUserB = builder.deployed.connect(accountB);

        var seq = Promise.resolve();

        seq = seq.then(function() {
            return tokenUserA.Register(1, 20, false, "CA", 1234, 86).then(function(txhash) {
                console.log('txhash', txhash);
            });
        });

        seq = seq.then(function() {
            return tokenUserA.Claim(1234).then(function(txhash) {
                console.log('claim', txhash);
            }, function(reject){
                console.log('claim', reject);
            });
        });
        seq = seq.then(function() {
            return tokenUserA.Approved(1234).then(function(txhash) {
                console.log('approve', txhash);
            }, function(reject){
                console.log('approve', reject);
            });
        });


        return seq;
    });
});

