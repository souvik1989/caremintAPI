<x-mail::message>

A new Registration of provider/franchise done on {{ $data['date'] }}<br>

The details of the provider/franchise is:
<b>Email :</b> {{ $data['email'] }}<br>
<b>Password:</b> {{ $data['password'] }}<br>

Thanks,<br>
{{ $setting['site_title'] ?? env('APP_NAME') }}

</x-mail::message>
