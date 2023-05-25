contract UserRegistration {
  struct Weekly {
    uint256 count;
  }

  mapping(uint256 => Weekly) private _registrationsPerWeek;

  function register() public {
    uint256 timestamp = block.timestamp;
    uint256 week = timestamp / 1 weeks;
    _registrationsPerWeek[week].count += 1;
  }

  function withdraw() public view returns(uint){
    uint _register = getCurrentWeekRegistration();
    return _register;
  }

  function getCurrentWeekRegistration() public view returns (uint256) {
    uint256 week = block.timestamp / 1 weeks;
    return _registrationsPerWeek[week].count;
  }
}
