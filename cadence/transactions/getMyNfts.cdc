import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

transaction(to: Address) {
    let receiver: Capability<&{FanfareNFTContract.FanfareNFTCollectionPublic}>
    prepare(acct: AuthAccount) {
        let collection = acct.borrow<&FanfareNFTContract.Collection>(from: FanfareNFTContract.CollectionStoragePath)
            ?? panic("Missing NFT collection on signer account")

        self.receiver = getAccount(to).getCapability<&{FanfareNFTContract.FanfareNFTCollectionPublic}>(FanfareNFTContract.CollectionPublicPath)
    }

    execute {
        let receiver = self.receiver.borrow()!
        log(receiver.getIDs())
    }
}