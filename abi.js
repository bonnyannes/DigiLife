[
	{
		"constant": false,
		"inputs": [
			{
				"name": "policyNumber",
				"type": "uint256"
			}
		],
		"name": "Approved",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "policyNumber",
				"type": "uint256"
			}
		],
		"name": "Claim",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "id",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "policyNumber",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "riskRating",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "start",
				"type": "uint32"
			},
			{
				"indexed": false,
				"name": "end",
				"type": "uint32"
			}
		],
		"name": "NewClient",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "policyNumber",
				"type": "uint256"
			}
		],
		"name": "NewClaim",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "policyNumber",
				"type": "uint256"
			}
		],
		"name": "ClaimApproval",
		"type": "event"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "gender",
				"type": "uint8"
			},
			{
				"name": "age",
				"type": "uint8"
			},
			{
				"name": "smoker",
				"type": "bool"
			},
			{
				"name": "country",
				"type": "string"
			},
			{
				"name": "policyNumber",
				"type": "uint256"
			},
			{
				"name": "riskRating",
				"type": "uint256"
			}
		],
		"name": "Register",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "customers",
		"outputs": [
			{
				"name": "gender",
				"type": "uint8"
			},
			{
				"name": "age",
				"type": "uint8"
			},
			{
				"name": "smoker",
				"type": "bool"
			},
			{
				"name": "country",
				"type": "string"
			},
			{
				"name": "state",
				"type": "uint8"
			},
			{
				"name": "start",
				"type": "uint32"
			},
			{
				"name": "end",
				"type": "uint32"
			},
			{
				"name": "policyNumber",
				"type": "uint256"
			},
			{
				"name": "riskRating",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]
