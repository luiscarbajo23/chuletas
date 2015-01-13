select q.* FROM (SELECT table_name,    CONCAT(ROUND(table_rows / 1000000, 1), 'Mb') rows,
  CONCAT(ROUND(data_length / ( 1024 * 1024 ), 1), 'Mb') DATA,
  CONCAT(ROUND(index_length / ( 1024 * 1024 ), 1), 'Mb') idx,
  CONCAT(ROUND(( data_length + index_length ) / ( 1024 * 1024 ), 1), 'Mb') total_size,
  ROUND(index_length / data_length, 1) idxfrac, data_free / 1024 / 1024 AS data_free_MB, `ENGINE`
  FROM  information_schema.TABLES  
  WHERE `TABLE_SCHEMA`=''  
  ORDER  BY data_length + index_length  DESC LIMIT 50) q 
  order by q.idxfrac DESC 
  limit 20;