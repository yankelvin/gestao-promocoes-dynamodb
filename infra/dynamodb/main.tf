data "aws_dynamodb_table" "promocao_existing_table" {
  name = "Promocao"
}

data "aws_dynamodb_table" "item_promocao_existing_table" {
  name = "ItemPromocao"
}

data "aws_dynamodb_table" "historico_uso_promocao_existing_table" {
  name = "HistoricoUsoPromocao"
}

locals {
  promocao_existing = length(data.aws_dynamodb_table.promocao_existing_table) == 0
  item_promocao_existing = length(data.aws_dynamodb_table.item_promocao_existing_table) == 0
  historico_uso_promocao_existing = length(data.aws_dynamodb_table.historico_uso_promocao_existing_table) == 0
}

# Tabela Promocao
resource "aws_dynamodb_table" "promocao_table" {
  count        = local.promocao_existing ? 1 : 0
  name         = "Promocao"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "S"
  }
}

# Tabela Item Promocao
resource "aws_dynamodb_table" "item_promocao_table" {
  count        = local.item_promocao_existing ? 1 : 0
  name         = "ItemPromocao"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "S"
  }
}

# Tabela Historico Uso Promocao
resource "aws_dynamodb_table" "historico_uso_promocao_table" {
  count        = local.historico_uso_promocao_existing ? 1 : 0
  name         = "HistoricoUsoPromocao"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Id"

  attribute {
    name = "Id"
    type = "S"
  }
}
