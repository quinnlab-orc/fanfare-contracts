import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

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