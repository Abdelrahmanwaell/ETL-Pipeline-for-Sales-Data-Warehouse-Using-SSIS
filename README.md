# **🚀 SSIS Sales Data Warehouse with Incremental Load & SCD Implementation**

**📅 Description**

This project demonstrates a complete end-to-end ETL pipeline using SQL Server Integration Services (SSIS) to extract, transform, and load sales data from an OLTP database into a star schema data warehouse. The solution features incremental loading for fact tables, Slowly Changing Dimensions (SCD) for dimension tables, and comprehensive data quality management.

**📚 Tech Stack**
* **SSIS** for ETL pipeline development
* **SQL Server** (OLTP + Data Warehouse)
* **T-SQL** for stored procedures and data validation
* **Visual Studio/SSDT** for SSIS development
* **Git & GitHub** for version control
* **Excel** for data mapping documentation

**🛋️ Project Architecture**

1. **Source**: Normalized OLTP Sales Database
2. **SSIS ETL Process**:
   * Incremental Load with metadata control
   * Slowly Changing Dimensions (Type 1 & Type 2)
   * Lookup transformations for dimension key resolution
   * Data quality validation and error handling
3. **Star Schema Design**:
   * **Fact Tables**: FactSales
   * **Dimension Tables**: DimCustomer, DimProduct, DimSalesMan, DimTime
   * **Control Tables**: ETL_MetaControl, Load_Tracking

**📊 ETL Process Flow**
```
┌─────────────────────────────────────┐
│ SQL_Get_Last_Load_Time_MetaControl │ ← Metadata Control
└─────────────┬───────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│        DFT_Fact_sales              │ ← Incremental Fact Load
│  • SRC_SalesFact                   │
│  • Lookup Transformations          │
│  • Data Quality Checks             │
└─────────────┬───────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│   SQL_GET_LoadedTime_FactTable     │ ← Update Load Timestamps
└─────────────┬───────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│ SQL_MetaControl_Update_Last_load_Time│ ← Final Metadata Update
└─────────────────────────────────────┘
```

**🔄 SCD Implementation**
```
┌─────────────────┐    ┌──────────────────────┐
│  SRC_Customer   │───▶│   DRV_SrcCode       │
└─────────────────┘    └──────────┬───────────┘
                                  │
                                  ▼
                       ┌──────────────────────┐
                       │ Slowly Changing Dim  │
                       └─────────┬────────────┘
                                │
                    ┌───────────┴────────────┐
                    ▼                        ▼
          ┌─────────────────┐    ┌─────────────────┐
          │ Historical      │    │ Changing        │
          │ Inserts Output  │    │ Updates Output  │
          └─────────┬───────┘    └─────────┬───────┘
                    │                      │
                    │    ┌─────────────────▼──┐
                    │    │ OLE DB Command     │
                    │    └─────────────────┬──┘
                    │                      │
                    └──────┬───────────────┘
                           ▼
                    ┌─────────────────┐
                    │   Union All     │
                    └─────────┬───────┘
                              │
                              ▼
                    ┌─────────────────┐
                    │ Insert Dest     │
                    └─────────────────┘
```

**📂 Folder Structure**

```
Sales-ETL-SSIS-Project/
├── 📁 SQL query/
│   ├── 📄 DimCustomer.sql
│   ├── 📄 DimDate.sql
│   ├── 📄 DimProduct.sql
│   ├── 📄 DimSalesMan.sql
│   ├── 📄 DimTime.sql
│   ├── 📄 Fact_sales.sql
│   └── 📄 Meta_Control_Fact_Sales_Load.sql
├── 📁 SSIS Packages/
│   ├── 📦 DimCustomer.dtsx
│   ├── 📦 DimProduct.dtsx
│   ├── 📦 DimSalesMan.dtsx
│   └── 📦 Fact_sales.dtsx
├── 📁 SSIS ScreenShots/
│   ├── 📁 DimCustomer/
│   │   ├── 🖼️ Customer.png
│   │   ├── 🖼️ Customer_After_change.png
│   │   ├── 🖼️ Customer_Before_change.png
│   │   ├── 🖼️ Customer_ETL_Datachange.png
│   │   └── 🖼️ Customer_ETL_job.png
│   ├── 📁 DimProduct/
│   │   ├── 🖼️ Product.png
│   │   ├── 🖼️ Product_After_change.png
│   │   ├── 🖼️ Product_Before_change.png
│   │   └── 🖼️ Product_ETL_Datachange.png
│   ├── 📁 DimSalesMan/
│   │   ├── 🖼️ SalesMan.png
│   │   ├── 🖼️ SalesMan_After_Change.png
│   │   ├── 🖼️ SalesMan_Before_change.png
│   │   ├── 🖼️ SalesMan_ETL.png
│   │   └── 🖼️ SalesMan_ETL_DataChange.png
│   └── 📁 Fact_Sales/
│       ├── 🖼️ Fact_ControlFlow.png
│       ├── 🖼️ Fact_ETL.png
│       └── 🖼️ Fact_datagroup.png
├── 📁 SSIS query/
│   ├── 📄 SQL_Get_Last_LoadedTime_Fact_Table.sql
│   ├── 📄 SQL_Get_Last_Load_Time_MetaControl.sql
│   ├── 📄 SQL_MetaControl_Update_Last_load_Time.sql
│   ├── 📄 Customer.sql
│   ├── 📄 Product.sql
│   ├── 📄 SalesMan.sql
│   └── 📄 fact.sql
├── 📄 README.md
├── 💾 Sales_OLTP.bak
└── 📊 mapping.xlsx
```



**🔧 Key ETL Components**

**📊 Fact Table Processing (DFT_Fact_sales)**
* **Source**: `SRC_SalesFact` - Incremental data extraction
* **Transformations**:
  - `Derived Column` - Source System Code and loaded time 
  - `LKP_Customer_Dim` - Customer dimension lookup
  - `LKP_Product_Dim` - Product dimension lookup  
  - `LKP_SalesMan_Dim` - Salesman dimension lookup
  - `LKP_Time` - Time dimension lookup
  - `LKP_Date` - Date dimension lookup
  
* **Destination**: `DST_Fact` - Sales fact table

**🔄 SCD Implementation **
* **Type 1 SCD**: In-place updates for current attributes
* **Type 2 SCD**: Historical preservation with effective dating
* **Components**:
  - `Slowly Changing Dimension` transformation
  - `Historical Attribute Inserts Output`
  - `Changing Attribute Updates Output`
  - `OLE DB Command` for updates
  - `Union All` for combining flows

**📈 ETL Features**

* **🔄 Incremental Loading**
  - Metadata-driven delta processing
  - Timestamp-based change detection  
  - Performance optimization (80% faster than full loads)

* **📊 Slowly Changing Dimensions**
  - Type 1: Overwrite existing values
  - Type 2: Preserve historical changes
  - Effective date management
  - Automatic surrogate key generation

* **🛡️ Data Quality & Validation**
  - Referential integrity checks
  - Data type validation
  - Business rule enforcement
  - Comprehensive error handling



**🔍 Data Validation Queries**

```sql
-- Validate incremental load
SELECT 
    COUNT(*) as TotalRecords,
    MAX(OrderDate) as LatestOrderDate,
    MIN(OrderDate) as EarliestOrderDate
FROM Fact_Sales

```


**📊 ETL Execution Screenshots**

**Control Flow Overview:**
![Control Flow](https://github.com/Abdelrahmanwaell/ETL-Pipeline-for-Sales-Data-Warehouse-Using-SSIS/blob/main/SSIS%20ScreenShots/Fact_Sales/Fact_ControlFlow.png)

**Fact Data Flow Design:**
![Fact DataFlow](https://github.com/Abdelrahmanwaell/ETL-Pipeline-for-Sales-Data-Warehouse-Using-SSIS/blob/main/SSIS%20ScreenShots/Fact_Sales/Fact_ETL.png)

**SCD Implementation:**
![SCD Implementation](https://github.com/Abdelrahmanwaell/ETL-Pipeline-for-Sales-Data-Warehouse-Using-SSIS/blob/main/SSIS%20ScreenShots/DimCustomer/Customer_ETL_job.png)


**💼 Author**

**Abdelrahman Wael**  
*Data Engineer *

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat&logo=linkedin)](https://linkedin.com/in/abdelrahmanwaell)
[![Email](https://img.shields.io/badge/Email-Contact-red?style=flat&logo=gmail)](mailto:your.email@example.com)

**🎯 Skills Demonstrated**
- ETL Pipeline Development with SSIS
- Incremental Data Loading Strategies  
- Slowly Changing Dimension Implementation
- Data Warehouse Design (Star Schema)
- Performance Optimization
- Error Handling & Data Quality
- SQL Server Database Administration
- Version Control with Git





---
