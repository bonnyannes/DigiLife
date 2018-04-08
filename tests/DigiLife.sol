
contract DigiLife {

    event NewClient(uint id, uint policyNumber, uint riskRating, uint32 start, uint32 end);
    event NewClaim(uint policyNumber);
    event ClaimApproval(uint policyNumber);

    struct Customer {
        uint8 gender;
        uint8 age;
        bool smoker;
        string country;
        States state;
        uint32 start;
        uint32 end;
        uint policyNumber;
        uint riskRating;

    }

    Customer[] public customers;

    mapping (uint => address) policyToCustomer;
    mapping (uint => uint) policyToCustomerIndex;

    uint contractPeriod = 10 years;
    uint claimPeriod = 30 days;
    enum States { Inactive, Active, Pending, Approved, Locked }

    function Register(uint8 gender, uint8 age, bool smoker, string country, uint policyNumber, uint riskRating) public {
        
        require( policyToCustomer[policyNumber] == address(0));
        uint32 start = uint32(now);
        uint32 end = uint32(now + contractPeriod);
        uint id = customers.push(Customer(gender, age, smoker, country, States.Active, start, end, policyNumber, riskRating))-1;
        policyToCustomer[id] = msg.sender;
        policyToCustomerIndex[policyNumber] = id;

        NewClient(id, policyNumber, riskRating, start, end);

    }

    function Claim(uint policyNumber) public {
        uint customerIndex = policyToCustomerIndex[policyNumber];
        Customer storage customer = customers[customerIndex];
        require(customer.state == States.Active);
        customer.state = States.Pending;

        NewClaim(policyNumber);

    }

    function Approved(uint policyNumber) public {
        uint customerIndex = policyToCustomerIndex[policyNumber];
        Customer storage customer = customers[customerIndex];
        require(customer.state == States.Pending);
        customer.state = States.Approved;

        ClaimApproval(policyNumber);

    }


}
