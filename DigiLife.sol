pragma solidity ^0.4.0;
contract DigiLife {
    struct Customer {
        uint8 gender;
        uint8 age;
        bool smoke;
        string country;
        States state;
        uint start;
        uint end;
    }
    mapping(address => Customer) customers;
    mapping(address => Customer) claims;
    
    uint contractPeriod = 10 years;
    uint claimPeriod = 30 days;
    enum States { Inactive, Active, Pending, Confirmed } 
    
    function Register(uint8 gender, uint8 age, bool smoke, string country) public {
        Customer storage customer = customers[msg.sender];
        require(customer.state == States.Inactive);
        customer.gender = gender;
        customer.age = age;
        customer.smoke = smoke;
        customer.country = country;
        customer.state = States.Active;
        customer.start = now;
        customer.end = now + contractPeriod;
    }
    
    function Claim() public {
        Customer storage customer = customers[msg.sender];
        
        require(customer.state == States.Active);
        require(claims[msg.sender].state == States.Inactive);
        
        customer.state = States.Pending;
        
        claims[msg.sender] = customer;
        Customer storage claim = claims[msg.sender];
        claim.start = now;
        claim.end = now + claimPeriod;
    }
    
    function Approved() public {
        
    }

    
}
