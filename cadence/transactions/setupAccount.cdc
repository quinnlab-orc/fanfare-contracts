import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

transaction {
    prepare(acct: AuthAccount) {
        if acct.borrow<&FanfareNFTContract.Collection>(from: FanfareNFTContract.CollectionStoragePath) == nil {
            let collection <- FanfareNFTContract.createEmptyCollection() as! @FanfareNFTContract.Collection
            acct.save(<-collection, to: FanfareNFTContract.CollectionStoragePath)
            acct.link<&{NonFungibleToken.CollectionPublic,NonFungibleToken.Receiver}>(FanfareNFTContract.CollectionPublicPath, target: FanfareNFTContract.CollectionStoragePath)
            log("Success")
        }
    }
}