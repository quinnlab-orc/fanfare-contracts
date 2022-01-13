import NonFungibleToken from 0x1d7e57aa55817448
import FanfareNFTContract from 0xe3d6aefbdc74f65f

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