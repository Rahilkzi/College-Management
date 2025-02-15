<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class QrCodeController extends Controller
{
    public function generate(Request $request)
    {
        $qrcode = QrCode::size(300)->generate($request->qr_code);
        return response($qrcode)->header('Content-Type', 'image/svg+xml');
    }
} 