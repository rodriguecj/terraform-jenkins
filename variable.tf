## Variables
# Si no definimos un valor por defecto al colocar el comando terraform plan o apply nos preguntara por el valor que queremos colocar
# Tambien se puede colocar en la linea de comando los valores de las variables de la siguiente forma:
# terraform plan var="ec2_image_id=ami-053b0d53c279acc90"
# Para utilizar la variable en algun archivo de TF debemos interpolarlo como var.[nombre de la variable]


# Region
variable "region_aws"{
    type = string
    description = "Region norte de virginea"
}

# Imagen instancia Ec2
variable "ec2_image_id" {
  type = string
  description = "ec2_image_id, imagen de las instancias Ec2"
}
