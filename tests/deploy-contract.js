'use strict';

function deploy(builder) {
    var codes = builder.compile('../DigiLife.sol', true);

    var digiLifeCode = codes.DigiLife;

    return digiLifeCode.deploy();
}

module.exports = deploy;

