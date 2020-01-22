<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CSC561 | Lab1c</title>
  </head>
<body>

  <h3>Status of all of our inventory items - (Inventory -> { belongsTo } -> Status)</h3>

  <table border="1">
    <thead>
      <th>Inventory Id</th>
      <th>User Id</th>
      <th>Description</th>
      <th>checkout Time</th>
  
    </thead>

    <tbody>
    
      @foreach ($transactions -> where('user_id') as $transaction)
        <tr>
          <td>{{ $transaction->inventory_id}}</td>
          <td>{{ $transaction->user_id}}</td>
          <td>{{$transaction->description}}</td>
          <td>{{$transaction->checkout_time}}</td>
        </tr>
@endforeach

    </tbody>
</table> 


</body>
</html>
