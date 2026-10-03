# AssetManagmentSite

Kurumsal varlık (demirbaş) takibi için geliştirdiğim bir web uygulaması. **ASP.NET WebForms (.NET Framework 4.8)**, **Entity Framework (database-first)** ve **SQL Server** kullanıyor.

## Modüller

- Varlık yönetimi ve varlık atama (zimmet)
- Envanter yönetimi
- Personel yönetimi
- Talepler (requests)
- Bakım kayıtları
- İş akışı ve durum yönetimi (workflow)

## Teknolojiler

C#, ASP.NET WebForms, Entity Framework 6 (EDMX), SQL Server, Bootstrap

## Kurulum

1. Depoyu klonlayın ve `AssetManagmentSite.sln` dosyasını Visual Studio'da açın.
2. SQL Server'da `AssetManagment` adında bir veritabanı oluşturun. Tablolar `AssetManagementModel.edmx` modelindeki varlıklara karşılık gelir (Asset, Employee, Inventory, MaintenanceRecord, Request, Transactions, UsageRegistration, Workflow, WorkflowStatu). Depoda hazır bir SQL betiği yoktur.
3. `Web.config` içindeki `AssetManagmentEntities` bağlantı dizesinde `data source` değerini kendi SQL Server örneğinizle değiştirin.
4. Projeyi çalıştırın (IIS Express).

## Not

Öğrenme sürecinde geliştirdiğim bir projedir.
