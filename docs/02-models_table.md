bin/rails generate model Company \
name:string \
website:string \
industry:string \
phone:string \
email:string \
address:text

bin/rails generate model Contact \
company:references \
first_name:string \
last_name:string \
email:string \
phone:string \
position:string

bin/rails generate model Deal \
company:references \
contact:references \
title:string \
value:decimal \
stage:string \
expected_close_date:date

bin/rails generate model Activity \
company:references \
contact:references \
deal:references \
activity_type:string \
subject:string \
description:text \
occurred_at:datetime

bin/rails generate model Task \
company:references \
contact:references \
deal:references \
title:string \
description:text \
due_at:datetime \
completed:boolean