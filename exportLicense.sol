pragma solidity ^0.5.0;

contract exportLicense
{
    struct date
    {
        uint day;
        uint month;
        uint year;
    }
    
    struct License
    {
        uint id;
        address exporter;
        string exporterName;
        date issueDate;
        date expiryDate;
        string description;
    }

    License[] licenses;
    int index = 0;

    event licenseinfo(uint id,
        address exporter,
        string exporterName,
        string description);

    function setLicense(
        uint _id,
        address _exporter,
        string memory _exporterName,
        string memory _description) public 
        {
            License memory license = License({
                id:_id,
                exporter:_exporter,
                exporterName: _exporterName,
                issueDate : date({day:1,month:1,year:2019}),
                expiryDate: date({day:1,month:12,year:2019}),
                description : _description
            });
            emit licenseinfo(_id,_exporter,_exporterName,_description);
            licenses.push(license);
            index++;
        }

    function getLicense(uint _index) view public returns(uint,address,string memory,string memory)
    {
        License memory license = licenses[_index];
        return (license.id,license.exporter,license.exporterName,license.description);
    }

    function checkIfValid(uint _index) public returns(bool)
    {
        License memory license = licenses[_index];
        uint year1 = license.expiryDate.year;

        if(year1<2019)
            return false;
        return true;
    }

}