import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

transaction {

    prepare(minter: AuthAccount) {

        let minterProxy <- FanfareNFTContract.createMinterProxy()

        minter.save(
            <- minterProxy, 
            to: FanfareNFTContract.MinterProxyStoragePath,
        )
            
        minter.link<&FanfareNFTContract.MinterProxy{FanfareNFTContract.MinterProxyPublic}>(
            FanfareNFTContract.MinterProxyPublicPath,
            target: FanfareNFTContract.MinterProxyStoragePath
        )
    }
}