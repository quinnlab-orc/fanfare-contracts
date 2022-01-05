import NonFungibleToken from 0x1d7e57aa55817448
import FanfareNFTContract from 0xe3d6aefbdc74f65f

transaction {
    prepare(acct: AuthAccount) {
    log(acct)
        if acct.borrow<&FanfareNFTContract.Collection>(from: FanfareNFTContract.CollectionStoragePath) == nil {
            let collection <- FanfareNFTContract.createEmptyCollection() as! @FanfareNFTContract.Collection
            acct.save(<-collection, to: FanfareNFTContract.CollectionStoragePath)
            acct.link<&{FanfareNFTContract.FanfareNFTCollectionPublic}>(FanfareNFTContract.CollectionPublicPath, target: FanfareNFTContract.CollectionStoragePath)
            log("Success")
        }
    }
}