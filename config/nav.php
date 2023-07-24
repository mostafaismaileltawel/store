<?php
return[

    // [
    //  'icon'=>'nav-icon fas fa-tachometer-alt',
    //  'route'=>'category.index',
    //  'title'=>'dashboard'
    //  'active'=''
     

    // ],
[
    'icon'=>'far fa-circle nav-icon',
     'route'=>'category.index',
     'title'=>'categores',
     'badge'=>'new',
     'active'=>'category*'
],
['icon'=>'far fa-circle nav-icon',
'route'=>'product.index',
'title'=>'products',
'active'=>'product.*'

],
['icon'=>'far fa-circle nav-icon',
'route'=>'product.index',
'title'=>'order',
'active'=>'products.*'

]



];