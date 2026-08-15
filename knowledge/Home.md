# Riverpod Marketplace Mini Knowledge Base

## Start Here

- [[_shared/common/agent-rules/Core Rules|Shared Core Rules]] - Cross-repository agent behavior and safety.
- [[Architecture/Overview]] - Arsitektur Clean Architecture, Riverpod, dan folder structure.
- [[Architecture/Clean Architecture Riverpod]] - Aturan spesifik layer, Entity vs Model, dan best practice.
- [[Onboarding/Getting Started]] - Setup, cara kerja aplikasi, dan panduan menambah fitur.

## Features

Hub utama setiap domain dalam aplikasi Marketplace.

- [[Features/Product List]] - List produk dummy (Ticket 1).
- [[Features/Pagination]] - Infinite scrolling (Ticket 2).
- [[Features/Cart]] - Keranjang belanja.
- [[Features/Search Filter]] - Pencarian dan filter kategori.
- [[Features/Checkout]] - Proses pembayaran dan formulir pengiriman.

## Technical Areas

- [[Architecture/State Management]] - Panduan spesifik penggunaan Riverpod (Providers, Notifiers).
- [[Architecture/Api and Data Access]] - API layer, Repository, dan Service.
- [[Architecture/Data Models]] - Freezed, json_serializable, dan Entity mapping.
- [[Decisions/Index]] - Architectural decision records (ADR).

## Source Map

| Domain | Source |
|---|---|
| Home / Products | `lib/features/home/` |
| Cart | *(Akan datang)* |
| Search | *(Akan datang)* |
| Checkout | *(Akan datang)* |

## Quick Answers

| Question | Answer |
|---|---|
| Ubah State Provider? | Cek controller di `lib/features/.../presentation/controllers/` |
| Tambah Entity/Model? | Cek layer `domain/entities` dan `data/models` |
| Mengapa pakai ref.watch di build? | Baca [[Architecture/Clean Architecture Riverpod]] |
| Tambah fitur baru? | Ikuti pola Repository -> UseCase -> Controller -> Page |

## Troubleshooting

- [[Troubleshooting/Index]] - Common issues dan debug checklists.
