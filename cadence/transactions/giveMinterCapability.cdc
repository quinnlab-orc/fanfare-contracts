import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

transaction (minterAddress: Address) {

    let resourceStoragePath: StoragePath
    let capabilityPrivatePath: CapabilityPath
    let minterCapability: Capability<&FanfareNFTContract.NFTMinter>

prepare(adminAccount: AuthAccount) {
    self.resourceStoragePath = /storage/NFTMinter
    self.capabilityPrivatePath = /private/NFTMinter

    let tokenAdmin = adminAccount.borrow<&FanfareNFTContract.Administrator>(from: FanfareNFTContract.AdminStoragePath)
        ?? panic("Could not borrow Adminstrartor")
    
    let minter <-tokenAdmin.createNewMinter()
    adminAccount.save(<-minter, to: self.resourceStoragePath)
    self.minterCapability = adminAccount.link<&FanfareNFTContract.NFTMinter>(
         self.capabilityPrivatePath,
         target: self.resourceStoragePath
         )?? panic("Could not link NFTMinter")
}
    execute {
        let minterAccount = getAccount(minterAddress)

        let capabilityReceiver = minterAccount.getCapability
            <&FanfareNFTContract.MinterProxy{FanfareNFTContract.MinterProxyPublic}>
            (FanfareNFTContract.MinterProxyPublicPath)!
            .borrow() ?? panic("Could not borrow capability receiver reference")

        capabilityReceiver.setMinterCapability(cap: self.minterCapability)
    }
}