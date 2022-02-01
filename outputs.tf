output "selected_az" {
    description = "The AZ that was selected for deployment"
    value = aws_instance.vm.availability_zone

}