import NonFungibleToken from 0x1d7e57aa55817448
import FanfareNFTContract from 0xe3d6aefbdc74f65f

transaction(creatorAddress: Address, recipient: Address, quantity: UInt64, templateID: UInt64, metadata: String) {
    prepare(signer: AuthAccount) {
        let admin = signer.borrow<&FanfareNFTContract.ContentCreator>(from: FanfareNFTContract.ContentCreatorStoragePath)
            ?? panic("cannot get a valid creatorproxy resource for the signer")

        var i: UInt64 = 0;
            
        while i < quantity {
            admin.mintNFT(creatorAddress: creatorAddress, recipient: recipient, templateID: templateID, metadata: metadata)
            i = i + 1
        }

        log("Minted to recipients collection")
    }
}