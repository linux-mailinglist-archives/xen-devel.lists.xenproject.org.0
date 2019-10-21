Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7FDEFE1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 16:37:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMYmN-00007C-2C; Mon, 21 Oct 2019 14:35:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMYmK-000071-Tz
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 14:35:24 +0000
X-Inumbo-ID: 041ef6c4-f410-11e9-a531-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 041ef6c4-f410-11e9-a531-bc764e2007e4;
 Mon, 21 Oct 2019 14:35:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z9so14272335wrl.11
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 07:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rQl864ZyVO2MoelPsLL5xms94lTnvNCtVsNDWASs1rw=;
 b=g3O4XzBiPdu5f0IXZ9wBS2imsj/BMyI5DaJnYP0DNuocaSPgHbH/hDKJ7BypjmXDU7
 ln+VsKUy1nT5cpmN4o6bbHUFQiaBkn19GtGhgAJqeb/g7w8PUho9rFz0exQgzJBgM4Mp
 5hgv4cbLmtQfykgJ6jyppZOAO/S07BAkNUqzJ4w4zCfb5IJrKc5jmCPHH/1rGSsWFtoa
 Gq4TiY/ew991SKFtsIv4OGAfDI0PGsuQjDBrNLH8yF0WlOMw0OnjmZz1fH6TVXqnlrrg
 EVwaF1E+eINbQc+YaS3GwdPH/Maj1A+lw0JR/M/aHSTMgQGG4isZAxEv+8STSl9pnP+6
 LZlg==
X-Gm-Message-State: APjAAAXXzapMVnmxwn7Ilh76+OnEyiGvQTxGVCMEX4AV+NTslruL8eok
 yKwt+hLXKvdSlIPZqWKRW70=
X-Google-Smtp-Source: APXvYqzglXbm/YO/UdR4iOFRqWdm7C0pEG3te4p+KpaQzZmukvqbef9NYaiaIeZ2zDRVmkgt5bIH8A==
X-Received: by 2002:a5d:46ca:: with SMTP id g10mr20737201wrs.193.1571668523369; 
 Mon, 21 Oct 2019 07:35:23 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id b7sm506814wrn.53.2019.10.21.07.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:35:22 -0700 (PDT)
Date: Mon, 21 Oct 2019 15:35:20 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20191021143520.gsmvjs2chdnbtsvh@debian>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-8-liuwe@microsoft.com>
 <20191021095636.GF17494@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021095636.GF17494@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v2 7/9] x86: switch xen
 implementation to use hypervisor framework
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTE6NTY6MzZBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKWy4uLl0KPiA+ICBzdGF0aWMgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpob3BzIF9f
cmVhZF9tb3N0bHk7Cj4gPiAgCj4gPiBAQCAtMzEsNyArMzEsMzQgQEAgYm9vbCBoeXBlcnZpc29y
X3Byb2JlKHZvaWQpCj4gPiAgICAgIGlmICggaG9wcyApCj4gPiAgICAgICAgICByZXR1cm4gdHJ1
ZTsKPiA+ICAKPiA+IC0gICAgcmV0dXJuIGZhbHNlOwo+ID4gKyAgICAvKiBUb28gZWFybHkgdG8g
dXNlIGNwdV9oYXNfaHlwZXJ2aXNvciAqLwo+ID4gKyAgICBpZiAoICEoY3B1aWRfZWN4KDEpICYg
Y3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpKSApCj4gPiArICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gPiArCj4gPiArI2lmZGVmIENPTkZJR19YRU5fR1VFU1QKPiA+ICsgICAgaWYg
KCB4ZW5fcHJvYmUoKSApCj4gPiArICAgICAgICBob3BzID0gJnhlbl9oeXBlcnZpc29yX29wczsK
PiA+ICsjZW5kaWYKPiAKPiBJIHRoaW5rIHlvdSBsaWtlbHkgd2FudCBzb21ldGhpbmcgbGlrZToK
PiAKPiAgICAgaWYgKCB4ZW5fcHJvYmUoKSApCj4gICAgIHsKPiAgICAgICAgIGhvcHMgPSAmeGVu
X2h5cGVydmlzb3Jfb3BzOwo+IAlyZXR1cm4gdHJ1ZTsKPiAgICAgfQo+ICAgICBpZiAoIGh5cGVy
dl9wcm9iZSgpICkKPiAgICAgewo+ICAgICAgICAgLi4uLgo+IAlyZXR1cm4gdHJ1ZTsKPiAgICAg
fQo+IAo+ICAgICByZXR1cm4gZmFsc2U7Cj4gCj4gSW4gb3JkZXIgdG8gcmV0dXJuIGFmdGVyIGEg
c3VjY2Vzc2Z1bCBwcm9iZSwgb3IgZWxzZSB5b3UgbG9zZSBjeWNsZXMKPiBwcm9iaW5nIGZvciBo
eXBlcnZpc29ycyB3aGVuIGEgbWF0Y2ggaGFzIGJlZW4gZm91bmQsIGFuZCBhbHNvIGluIHRoZQo+
IFhlbiBjYXNlIHlvdSByaXNrIGRldGVjdGluZyB0aGUgSHlwZXJWIHN1cHBvcnQgaW4gWGVuIGFu
ZCB0aHVzIHVzaW5nCj4gdGhhdCBpbnN0ZWFkIG9mIHRoZSBYZW4gb25lLgo+IAoKR29vZCBwb2lu
dC4KCj4gTG9uZyB0ZXJtIGlmIHdlIGdhaW4gbW9yZSBndWVzdHMgc3VwcG9ydCBJIHdvdWxkIGxp
a2VseSB3YW50IHRvIHNlZQo+IGh5cGVydmlzb3Jfb3BzIHR1cm5pbmcgaW50byBhbiBhcnJheSBh
bmQgZ2FpbmluZyBhIHByb2JlIGZ1bmN0aW9uIHNvCj4gdGhhdCB0aGlzIGNhbiBiZSBkb25lIGlu
IGEgbG9vcCBpbnN0ZWFkIG9mIGhhdmluZyB0aGlzIGZ1bmN0aW9uLgo+IAoKVGhhdCB3YXMgbXkg
cGxhbiBmcm9tIHRoZSBnZXQtZ28gYnV0IFhlbiBsYWNrZWQgYXBwcm9wcmlhdGUKaW5mcmFzdHJ1
Y3R1cmUsIGhlbmNlIEkgcmVzb3J0ZWQgdG8gc29tZXRoaW5nIGFraW4gdG8gSFZNIGhvb2tzLgoK
Wy4uLl0KPiA+IC12b2lkIF9faW5pdCBoeXBlcnZpc29yX3NldHVwKHZvaWQpCj4gPiArdm9pZCBf
X2luaXQgeGVuX3NldHVwKHZvaWQpCj4gPiAgewo+ID4gICAgICBpbml0X21lbW1hcCgpOwo+ID4g
IAo+ID4gQEAgLTI3Nyw3ICsyNzIsNyBAQCB2b2lkIF9faW5pdCBoeXBlcnZpc29yX3NldHVwKHZv
aWQpCj4gPiAgICAgIGluaXRfZXZ0Y2huKCk7Cj4gPiAgfQo+ID4gIAo+ID4gLXZvaWQgaHlwZXJ2
aXNvcl9hcF9zZXR1cCh2b2lkKQo+ID4gK3ZvaWQgeGVuX2FwX3NldHVwKHZvaWQpCj4gPiAgewo+
ID4gICAgICBzZXRfdmNwdV9pZCgpOwo+ID4gICAgICBtYXBfdmNwdWluZm8oKTsKPiA+IEBAIC0z
MDcsNyArMzAyLDcgQEAgc3RhdGljIHZvaWQgYXBfcmVzdW1lKHZvaWQgKnVudXNlZCkKPiA+ICAg
ICAgaW5pdF9ldnRjaG4oKTsKPiA+ICB9Cj4gPiAgCj4gPiAtdm9pZCBoeXBlcnZpc29yX3Jlc3Vt
ZSh2b2lkKQo+ID4gK3ZvaWQgeGVuX3Jlc3VtZSh2b2lkKQo+IAo+IEkgdGhpbmsgeGVuX3tzZXR1
cC9hcF9zZXR1cC9yZXN1bWV9IGNhbiBiZSBtYWRlIHN0YXRpYyBub3c/CgpJbmRlZWQuIEkgd2ls
bCBmaXggdGhpcy4KCldlaS4KCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
