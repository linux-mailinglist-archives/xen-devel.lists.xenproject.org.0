Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FA153297
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 15:14:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izLP6-0002Xu-Dx; Wed, 05 Feb 2020 14:11:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dCm0=3Z=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1izLP5-0002Xl-Dw
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 14:11:43 +0000
X-Inumbo-ID: 6e1c382e-4821-11ea-b211-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e1c382e-4821-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 14:11:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so2914312wrh.5
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2020 06:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+VZmLSczV5ilrWJmnhB+5psfuDV/T9qepLK0d6gkjsk=;
 b=avicB+2XaPtpbuuaLkQjWQzGLULzoghoWOACUcYnC9hzridnmR3+u+xbjRg7su87u7
 55yx2lF+dxJaiKtPI56d9FEVfTwsO12yF2zTESC3Gil/h57m7aw1QkKCJ2IvtZBBohE9
 qvCkyHwdLdQa8gHRUjaY+nQBcj76UN/rzRDFMHybbAzKIcktlppSoToZwkzMxJM5qCW1
 dKFI0uGBLjSkZJ8uyPou+FKdbDTqgeYlpg5oNdm9zAGj+YK2iyoRye2Wr0Og5zNTcqYp
 iThB3Mp9/1hQYGlSE7DLIQ9mhBySLnUDDYF+AT05bB0Do2wkbNBYcptxd5D42TASjHRX
 XRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+VZmLSczV5ilrWJmnhB+5psfuDV/T9qepLK0d6gkjsk=;
 b=aFaasvxx6SeUlw6SWoLJp9Sz0GKuEkPaVfQllsvwySKjTeNqu5FVacLAc1DWu5VTqP
 FtUf12URFo33EHiAAgh1m4xLLd2btKwE0779xgNmMeuLnk9JG4Ylw4yvT7JEdt75Hm8c
 bsSjohoa1blft5oeePhfrP5/x8X8/yQ4B7m/C2CI2Jv6Et99RYq+pDclVy+xND4EevuL
 VTpBtmKa9Gk8MTjOkXNPUkH+pWN6ryDOKpT9IovwmTNcXEcALhuPuMU1Zz3Q5CjESDTk
 AoUyfG+22ByB9RVAjHkFC8AUDIc7s7Hpy7qz0/dqEZDGZcS9aP/8TcpOdTGmKN7QOcES
 klfQ==
X-Gm-Message-State: APjAAAWQKMMk3WNFmu15FvN1o1ba2iSwpRrKJLdWGyfo6647pESvUekY
 cTkXlI4/p9I5YpafD1fiUskr/lGkhyICh1cLfJA=
X-Google-Smtp-Source: APXvYqyM38UE5/zI0dKK0paZSGku+i4CUUQ0LyXXdXItcDZonO7Q4CY+Wo7MZnJPDEtdHspslEGAuJIvo3+lNS5B+6w=
X-Received: by 2002:adf:f986:: with SMTP id f6mr25647615wrr.182.1580911900315; 
 Wed, 05 Feb 2020 06:11:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580746020.git.tamas.lengyel@intel.com>
 <4533b6750698ec7f3c4721261c6584a2e3285cc5.1580746020.git.tamas.lengyel@intel.com>
 <0c1ab600-902f-ef84-9c7e-3621cd29d2b5@suse.com>
In-Reply-To: <0c1ab600-902f-ef84-9c7e-3621cd29d2b5@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 5 Feb 2020 07:11:03 -0700
Message-ID: <CABfawhnHES33Dz7twCM2RJ6guK9w-z1ny0D-DQYATMZnoQAF-A@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v7 2/7] x86/hvm: introduce
 hvm_copy_context_and_params
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgNSwgMjAyMCBhdCA0OjQwIEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwMy4wMi4yMDIwIDE3OjEyLCBUYW1hcyBLIExlbmd5ZWwgd3Jv
dGU6Cj4gPiBAQCAtNDQxNCw2ICs0NDI0LDQwIEBAIHN0YXRpYyBpbnQgaHZtX2FsbG93X2dldF9w
YXJhbShzdHJ1Y3QgZG9tYWluICpkLAo+ID4gICAgICByZXR1cm4gcmM7Cj4gPiAgfQo+ID4KPiA+
ICtzdGF0aWMgaW50IGh2bV9nZXRfcGFyYW0oc3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3QgaW5k
ZXgsIHVpbnQ2NF90ICp2YWx1ZSkKPiA+ICt7Cj4gPiArICAgIGludCByYzsKPiA+ICsKPiA+ICsg
ICAgcmMgPSBodm1fYWxsb3dfZ2V0X3BhcmFtKGQsIGluZGV4KTsKPiA+ICsgICAgaWYgKCByYyAp
Cj4gPiArICAgICAgICByZXR1cm4gcmM7Cj4gPiArCj4gPiArICAgIHN3aXRjaCAoIGluZGV4ICkK
PiA+ICsgICAgewo+ID4gKyAgICBjYXNlIEhWTV9QQVJBTV9BQ1BJX1NfU1RBVEU6Cj4gPiArICAg
ICAgICAqdmFsdWUgPSBkLT5hcmNoLmh2bS5pc19zM19zdXNwZW5kZWQgPyAzIDogMDsKPiA+ICsg
ICAgICAgIGJyZWFrOwo+ID4gKwo+ID4gKyAgICBjYXNlIEhWTV9QQVJBTV9WTTg2X1RTUzoKPiA+
ICsgICAgICAgICp2YWx1ZSA9ICh1aW50MzJfdClkLT5hcmNoLmh2bS5wYXJhbXNbSFZNX1BBUkFN
X1ZNODZfVFNTX1NJWkVEXTsKPiA+ICsgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4gKyAgICBjYXNl
IEhWTV9QQVJBTV9WTTg2X1RTU19TSVpFRDoKPiA+ICsgICAgICAgICp2YWx1ZSA9IGQtPmFyY2gu
aHZtLnBhcmFtc1tIVk1fUEFSQU1fVk04Nl9UU1NfU0laRURdICYKPiA+ICsgICAgICAgICAgICAg
ICAgICAgflZNODZfVFNTX1VQREFURUQ7Cj4KPiBJbmRlbnRhdGlvbiBnb3QgYnJva2VuIGhlcmUu
Cj4KPiA+ICsgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4gKyAgICBjYXNlIEhWTV9QQVJBTV9YODdf
RklQX1dJRFRIOgo+ID4gKyAgICAgICAgKnZhbHVlID0gZC0+YXJjaC54ODdfZmlwX3dpZHRoOwo+
ID4gKyAgICAgICAgYnJlYWs7Cj4gPiArICAgIGRlZmF1bHQ6Cj4KPiBBIGJsYW5rIGxpbmUgd291
bGQgaGF2ZSB3YW50ZWQgaW50cm9kdWNpbmcgYWJvdmUgaGVyZS4KPgo+ID4gQEAgLTUzMDEsNiAr
NTMxNywzNyBAQCB2b2lkIGh2bV9zZXRfc2VnbWVudF9yZWdpc3RlcihzdHJ1Y3QgdmNwdSAqdiwg
ZW51bSB4ODZfc2VnbWVudCBzZWcsCj4gPiAgICAgIGFsdGVybmF0aXZlX3ZjYWxsKGh2bV9mdW5j
cy5zZXRfc2VnbWVudF9yZWdpc3Rlciwgdiwgc2VnLCByZWcpOwo+ID4gIH0KPiA+Cj4gPiAraW50
IGh2bV9jb3B5X2NvbnRleHRfYW5kX3BhcmFtcyhzdHJ1Y3QgZG9tYWluICpkc3QsIHN0cnVjdCBk
b21haW4gKnNyYykKPiA+ICt7Cj4gPiArICAgIGludCByYzsKPiA+ICsgICAgdW5zaWduZWQgaW50
IGk7Cj4gPiArICAgIHN0cnVjdCBodm1fZG9tYWluX2NvbnRleHQgYyA9IHsgfTsKPiA+ICsKPiA+
ICsgICAgYy5zaXplID0gaHZtX3NhdmVfc2l6ZShzcmMpOwo+Cj4gQXMgbWVudGlvbmVkIGluIGFu
IGVhcmxpZXIgdmVyc2lvbidzIHJldmlldywgdGhpcyBjb3VsZCBiZSBwdXQgaW4KPiB0aGUgdmFy
aWFibGUncyBpbml0aWFsaXplci4KPgo+IEknbGwgdGFrZSBjYXJlIG9mIGFsbCBvZiB0aGUgYWJv
dmUgYW5kIGFkZAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4gd2hpbGUgY29tbWl0dGluZy4KClRoYW5rcywgaXQncyBhcHByZWNpYXRlZC4KVGFtYXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
