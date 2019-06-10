const exportLicense = artifacts.require('exportLicense');

module.exports = function(deployer)
{
    deployer.deploy(exportLicense);
}