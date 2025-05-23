resource "aws_route53_record" "expense" {
    for_each = aws_instance.ramserver
    zone_id = local.zone_id
   #backend.ramops.online
   name = each.key=="frontend-prod"?local.domain_name:"${each.key}.${local.domain_name}"
   type = "A"
   ttl = 1  
   records = each.key=="fronten-prod"?[each.value.public_ip]:[each.value.private_ip]
   allow_overwrite = true

}