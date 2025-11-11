/// Module: nft
module nft::nft;

// --- Gerekli Modülleri İçeri Aktarıyoruz ---

// Obje yaratmak (UID, object::new) için
use sui::object::{Self, UID};
// Objeyi transfer etmek (transfer::transfer) için
use sui::transfer;
// İşlem bilgilerini (sender, ctx) almak için
use sui::tx_context::{Self, TxContext};
// NFT'mizde metin (Ad, Açıklama) tutabilmek için
use std::string::{Self, String};
// NFT'mizde resim linki (Url) tutabilmek için
use sui::url::{Self, Url};

// --- NFT'mizin Tasarımı (Struct) ---

/// Bu, bizim NFT'mizin "tasarımıdır".
/// 'key' onun bir Sui Objesi (varlık) olmasını sağlar.
/// 'store' onun başka objelerde saklanabilmesini sağlar.
public struct BasitNFT has key, store {
    id: UID,
    /// NFT'nin adı
    name: String,
    /// NFT'nin açıklaması
    description: String,
    /// NFT'nin resim linki (URL)
    image_url: Url,
}

// --- Fonksiyonlar ---

/// Bu 'entry' fonksiyon, yeni bir NFT "basmamızı" (mint) sağlar.
/// Dışarıdan (bir cüzdandan) çağrılabilir.
public fun mint(
    name: String,
    description: String,
    image_url: Url,
    ctx: &mut TxContext
) {
    // 1. Yeni, benzersiz bir ID ile NFT objemizi oluşturuyoruz.
    // 'primitive_types.move'daki 'Person' objesini yaratmaya benzer.
    let nft = BasitNFT {
        id: object::new(ctx),
        name: name,
        description: description,
        image_url: image_url,
    };

    // 2. Oluşturduğumuz bu NFT'yi, işlemi başlatan kişiye (sender) transfer ediyoruz.
    // Bu, 'ownership.move' dosyasındaki 'create_owned_box' ile birebir aynı mantıktır.
    transfer::transfer(nft, tx_context::sender(ctx));
}

/// Bu modül ilk yayınlandığında çalışacak boş bir init fonksiyonu.
/// Şu anda bir şey yapmasına gerek yok, ancak eklemek iyi bir alışkanlıktır.
fun init(_ctx: &mut TxContext) {
    // Boş
}