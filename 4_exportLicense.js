const exportLicense = artifacts.require('exportLicense');

contract('exportLicense',async(accounts)=>{

    it('1. creating License',async()=>{
        const instance = await exportLicense.deployed();

        const exporter = accounts[0];
        const id = 1;
        const exporterName = "Pruthvi";
        const description = "Shoes";

        await instance.setLicense(id,exporter,exporterName,description);

        const license = await instance.getLicense(0);


        assert.equal(license[0],1,'Id is not correct ');
        assert.equal(license[1],accounts[0],'Address is not correct ');
        assert.equal(license[2],exporterName,'Exporter Name doesnt match');
        assert.equal(license[3],description,'Description doesnt match');
        
    });

});
