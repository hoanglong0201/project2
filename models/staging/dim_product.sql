SELECT 
      product.product_key
      ,product.product_name
      ,product.make_flag
      ,product.finished_goods_flag
      ,prosub.product_subcategory_key
      ,prosub.product_subcategory_name
      ,procate.product_category_key
      ,procate.product_category_name
      ,promodel.product_model_key
      ,promodel.product_model_name
      ,product.size_unit_measure_key
      ,product.weight_unit_measure_key
      ,product.color
      ,product.weight
      ,product.size
      ,product.safety_stock_level
      ,product.standard_cost
      ,product.list_price
FROM `project-2-unigap.adventurework_dw.stg_production_product` as product
JOIN `project-2-unigap.adventurework_dw.stg_production_productsubcategory` as prosub
ON product.product_subcategory_key = prosub.product_subcategory_key
JOIN `project-2-unigap.adventurework_dw.stg_production_productcategory` as procate
ON prosub.product_category_key = procate.product_category_key
JOIN `project-2-unigap.adventurework_dw.stg_production_model` as promodel
ON product.product_model_key = promodel.product_model_key
