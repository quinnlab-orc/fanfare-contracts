import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

transaction(id: UInt64, to: Address) {
    let token: @NonFungibleToken.NFT
    let receiver: Capability<&{FanfareNFTContract.FanfareNFTCollectionPublic}>
    prepare(acct: AuthAccount) {
        let collection = acct.borrow<&FanfareNFTContract.Collection>(from: FanfareNFTContract.CollectionStoragePath)
            ?? panic("Missing NFT collection on signer account")
        self.token <- collection.withdraw(withdrawID: id)

        self.receiver = getAccount(to).getCapability<&{FanfareNFTContract.FanfareNFTCollectionPublic}>(FanfareNFTContract.CollectionPublicPath)
    }

    execute {
        let receiver = self.receiver.borrow()!
        receiver.deposit(token: <- self.token)
        log("Success")
    }
}