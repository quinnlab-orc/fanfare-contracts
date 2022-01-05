import NonFungibleToken from 0x1d7e57aa55817448
import FanfareNFTContract from 0xe3d6aefbdc74f65f

transaction(mediaURI: String, creatorAddress: Address, recipient: Address, data: String) {
    prepare(signer: AuthAccount) {
        let admin = signer.borrow<&FanfareNFTContract.ContentCreator>(from: FanfareNFTContract.ContentCreatorStoragePath)
            ?? panic("cannot get a valid creatorproxy resource for the signer")

        admin.mintNFT(mediaURI: mediaURI, creatorAddress: creatorAddress, recipient: recipient, data: data)

        log("Minted to recipients collection")
    }
}