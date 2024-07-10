<x-mail::message>

You are registered successfully to the {{ $setting['site_title'] ?? env('APP_NAME') }}<br>


<b>Email :</b> {{ $data['email'] }}<br>
<b>Password :</b> {{ $data['password'] }}<br>

Thanks,<br>
{{ $setting['site_title'] ?? env('APP_NAME') }}

</x-mail::message>
