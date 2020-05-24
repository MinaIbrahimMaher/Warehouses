select spi.Sup_Per_Id,wh.WH_Name,sp.Sup_Per_Date,it.Item_Name,spi.Sup_Per_Item_Quantity,spi.Sup_Per_Item_Pro_Date,spi.Sup_Per_Item_Validation,s.Supplier_Name
from Item it inner join Sup_Per_Item spi
on spi.Sup_Per_Item_Id=it.Item_Id
inner join Supplier s
on spi.Sup_Id=s.Supplier_Id
inner join Supply_Permission sp
on spi.Sup_Per_Id=sp.Sup_Per_Id
inner join Warehouse wh
on sp.Sup_Per_WH_Id=wh.WH_Id

select spi.Ex_Per_Id,it.Item_Name,spi.Ex_Per_Item_Quantity,s.Customer_Name
from Item it inner join Ex_Per_Item spi
on spi.Ex_Per_Item_Id=it.Item_Id
inner join Customer s
on spi.Cus_ID=s.Customer_Id


select  w.WH_Name ,wh.WH_Name , t.Trans_Id
from Warehouse w inner join Transfer t
on w.WH_Id=t.WH_From_Id
inner join Warehouse wh
on wh.WH_Id=t.WH_To_Id









select * from 