Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524414BDF9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:45:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTxB-0000Tx-7J; Tue, 28 Jan 2020 16:43:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/zE=3R=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwTx9-0000Ts-Mz
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:43:03 +0000
X-Inumbo-ID: 401a2eb6-41ed-11ea-b211-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 401a2eb6-41ed-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 16:43:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s10so3269090wmh.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2020 08:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=95e2oKOxNi5A6zpKshtIqdYkJtGC8ne104A+rWcEhfw=;
 b=EkIZTPjBrLlZm5J5FbZJFsZy2+WxfGr563naX/QQDUtlz/l6l46vfbynnq3+Im169a
 5SujiHdO9Bo9oUrdAVVxRkNGWxIWic+xykQ5DJEq+Leq4kP8m7aS7nV4a+51dv9QIP+S
 HP7pSe0qgkZN7Bg45zCifPMaGlzi0j8tagp39FpmtJP0usZXSZDCw45tf/mLCgUocDI/
 wKOUV1LwCST1FlLolQNRc2Jg4zWJIJ4dvBMK+gPyzFQXzN0lP9B0Qmz/Ysj6YOFBH/Ck
 G2Apeupe81ez+WwsHbh4LrSkZNSjdRDtj9sV2ZfZJX50C7EUwFe64YHoYYNWoPvDYInH
 TYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=95e2oKOxNi5A6zpKshtIqdYkJtGC8ne104A+rWcEhfw=;
 b=sdTnr/IlMxlQSrEpWA/3m83Jg9obP9sblZTibH4Zo01yJRk+zZzcFxYfX3ekojoba1
 ezE31d/SFM/KqXNUIoQLCClfRcIBKZuYXhZgAz54Fr/dXRbYNpYVu/EqcshgYiDQHI4h
 sacR20jk5uwZagOdpyJp2Xstd3NXCjYHg5sJpKDy73pDpfowJJHs6o0vkQ/t4gcA8ucg
 +7pZSEVFpYLjR/vAmQ5/wVuFGLXRbZHLx6yTmq6+Ia1BAszyMFSEdaT1zwXtDi6E0JlS
 k+Lp8YfMMtE2e2PoeeiEYcTgdvXesEj8KQSwadqR0V5a+hmx1gxO33nNslWhaD0EphIJ
 VYKA==
X-Gm-Message-State: APjAAAV6Nax034Tm+IhPSYAjYbt5ARLV71ZYIjmrG348XW7ynuc1cwG1
 Dir8BrQlC+Qai3aoa6h3u3+ljnUyXvuH87K973o=
X-Google-Smtp-Source: APXvYqwahmP1aB0CGlqybhnHB1QV5Z7yKjJbJks7d0knV6ERBNPaojV6txz4eK69CdJ6Q95ddqIx6yypPe/rINXK/mg=
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr6323846wmg.154.1580229782182; 
 Tue, 28 Jan 2020 08:43:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <8f7138e4d6a11975ef85458c000a337a60a4e13e.1580148227.git.tamas.lengyel@intel.com>
 <0f3cf444-62f1-141c-bb3f-e202f6d9b839@suse.com>
In-Reply-To: <0f3cf444-62f1-141c-bb3f-e202f6d9b839@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 28 Jan 2020 09:42:25 -0700
Message-ID: <CABfawhngYGk0pccEjkKT1DVzwhmeXhYdq_5HQTKgx9uSxezQjQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 1/9] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgOTozOCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vcDJtLmMKPiA+IEBAIC01NzQsMTEgKzU3NCwxMiBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpw
Mm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCj4gPiAgICAgICAgICAgICAgICAgIGlmICggZmRvbSA9PSBO
VUxMICkKPiA+ICAgICAgICAgICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOwo+ID4gICAgICAgICAg
ICAgIH0KPiA+IC0gICAgICAgICAgICBlbHNlIGlmICggIWdldF9wYWdlKHBhZ2UsIHAybS0+ZG9t
YWluKSAmJgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAvKiBQYWdlIGNvdWxkIGJlIHNoYXJl
ZCAqLwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAoIWRvbV9jb3cgfHwgIXAybV9pc19zaGFy
ZWQoKnQpIHx8Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAhZ2V0X3BhZ2UocGFnZSwgZG9t
X2NvdykpICkKPiA+IC0gICAgICAgICAgICAgICAgcGFnZSA9IE5VTEw7Cj4gPiArICAgICAgICAg
ICAgZWxzZQo+ID4gKyAgICAgICAgICAgIHsKPiA+ICsgICAgICAgICAgICAgICAgc3RydWN0IGRv
bWFpbiAqZCA9ICFwMm1faXNfc2hhcmVkKCp0KSA/IHAybS0+ZG9tYWluIDogZG9tX2NvdzsKPiA+
ICsgICAgICAgICAgICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgZCkgKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgcGFnZSA9IE5VTEw7Cj4gPiArICAgICAgICAgICAgfQo+ID4gICAgICAgICAg
fQo+ID4gICAgICAgICAgcDJtX3JlYWRfdW5sb2NrKHAybSk7Cj4gPgo+ID4gQEAgLTU5NCw4ICs1
OTUsOSBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCj4gPiAgICAg
IG1mbiA9IGdldF9nZm5fdHlwZV9hY2Nlc3MocDJtLCBnZm5feChnZm4pLCB0LCBhLCBxLCBOVUxM
KTsKPiA+ICAgICAgaWYgKCBwMm1faXNfcmFtKCp0KSAmJiBtZm5fdmFsaWQobWZuKSApCj4gPiAg
ICAgIHsKPiA+ICsgICAgICAgIHN0cnVjdCBkb21haW4gKmQgPSAhcDJtX2lzX3NoYXJlZCgqdCkg
PyBwMm0tPmRvbWFpbiA6IGRvbV9jb3c7Cj4gPiAgICAgICAgICBwYWdlID0gbWZuX3RvX3BhZ2Uo
bWZuKTsKPiA+IC0gICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIHAybS0+ZG9tYWluKSApCj4g
PiArICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBkKSApCj4gPiAgICAgICAgICAgICAgcGFn
ZSA9IE5VTEw7Cj4gPiAgICAgIH0KPiA+ICAgICAgcHV0X2dmbihwMm0tPmRvbWFpbiwgZ2ZuX3go
Z2ZuKSk7Cj4KPiBQZXJzb25hbGx5IEkgd291bGQgaGF2ZSBwcmVmZXJyZWQgdG8gZ28gd2l0aG91
dCBuZXcgbG9jYWwgdmFyaWFibGVzCj4gaGVyZSwgYnV0IEknbSBub3QgdGhlIG1haW50YWluZXIg
b2YgdGhpcyBjb2RlLiBIb3dldmVyLCBhdCB0aGUgdmVyeQo+IGxlYXN0IGJsYW5rIGxpbmVzIHdv
dWxkIG5lZWQgaW5zZXJ0aW5nIGJldHdlZW4gZGVjbGFyYXRpb24gYW5kCj4gc3RhdGVtZW50cy4g
V2l0aCBhdCBsZWFzdCB0aGlzIGRvbmUgKHdoaWNoIGNvdWxkIGJlIGRvbmUgd2hpbGUKPiBjb21t
aXR0aW5nKQo+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pgo+IEFzIGFuIGFzaWRlLCBJIGRvbid0IHRoaW5rIHRoZSB0aXRsZSBhY2N1cmF0ZWx5IGRlc2Ny
aWJlcyB0aGUKPiBjaGFuZ2UsIHNpbmNlIHRoZXJlJ3MganVzdCBvbmUgb3V0IG9mIHR3byBjYXNl
cyB3aGljaCBzaGFyZWQKPiBlbnRyaWVzIHdlcmVuJ3QgdGFrZW4gY2FyZSBvZi4gU2ltaWxhcmx5
IHRoZSBkZXNjcmlwdGlvbiBkb2Vzbid0Cj4gcmVmbGVjdCB0aGlzIGF0IGFsbC4KCldlbGwsIGZv
ciBvdXIgdXNlLWNhc2UgaXQgaXMgYnJva2VuIHJpZ2h0IG5vdy4gU28ganVzdCBiZWNhdXNlIGl0
J3MKbm90IGJyb2tlbiBpbiBhbm90aGVyIGRvZXNuJ3QgbWFrZSB0aGUgdGl0bGUvZGVzY3JpcHRp
b24gaW5jb3JyZWN0LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
