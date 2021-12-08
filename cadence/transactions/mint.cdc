import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

transaction(to: Address, mediaURI: String, creatorAddress: Address) {
    let minterRef: &FanfareNFTContract.MinterProxy

    prepare(minterAccount: AuthAccount) {
        self.minterRef = minterAccount
            .borrow<&FanfareNFTContract.MinterProxy>(from: FanfareNFTContract.MinterProxyStoragePath)
            ?? panic("No minter available")

    }

    execute {
        let receiver = getAccount(to)
            .getCapability<&{NonFungibleToken.Receiver}>(/public/FanfareNFTReceiver)

        self.minterRef.mintNFT(creator: receiver, mediaURI: mediaURI, creatorAddress: creatorAddress )
    }
}