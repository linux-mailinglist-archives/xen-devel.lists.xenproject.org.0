Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F6BC31B8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFeV-0005pA-He; Tue, 01 Oct 2019 10:45:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFFeU-0005p0-B7
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:45:06 +0000
X-Inumbo-ID: 86d3e7ce-e438-11e9-96f7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 86d3e7ce-e438-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 10:45:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5501B011;
 Tue,  1 Oct 2019 10:45:03 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48e28ff1-3598-52a5-2f79-0087596a0688@suse.com>
Date: Tue, 1 Oct 2019 12:45:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930182437.25478-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 1/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_ARRAY_HARDEN
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAyMDoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL0tjb25maWcKPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcKPiBAQCAtNzcsNiArNzcsMjcg
QEAgY29uZmlnIEhBU19DSEVDS1BPTElDWQo+ICAJc3RyaW5nCj4gIAlvcHRpb24gZW52PSJYRU5f
SEFTX0NIRUNLUE9MSUNZIgo+ICAKPiArbWVudSAiU3BlY3VsYXRpdmUgaGFyZGVuaW5nIgo+ICsK
PiArY29uZmlnIFNQRUNVTEFUSVZFX0FSUkFZX0hBUkRFTgoKU2VlaW5nIGFsc28gdGhlIG5ldyBp
dGVtIGluIHBhdGNoIDIgLSB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgZm9yIHRoZW0gYWxsCnRvIGhh
dmUgKGp1c3QpIGEgY29tbW9uIHByZWZpeCwgcmF0aGVyIHRoYW4gY29tbW9uIHByZWZpeCBhbmQg
YSBjb21tb24Kc3VmZml4LiBFLmcuIFNQRUNVTEFUSVZFX0hBUkRFTl9BUlJBWVMgaGVyZSBhbmQg
U1BFQ1VMQVRJVkVfSEFSREVOX0JSQU5DSEVTCnRoZXJlPwoKPiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vbm9zcGVjLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmgKPiBAQCAtMzMsNiAr
MzMsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJyYXlfaW5kZXhfbWFza19ub3Nw
ZWModW5zaWduZWQgbG9uZyBpbmRleCwKPiAgfQo+ICAjZW5kaWYKPiAgCj4gKyNpZmRlZiBDT05G
SUdfU1BFQ1VMQVRJVkVfQVJSQVlfSEFSREVOCj4gIC8qCj4gICAqIGFycmF5X2luZGV4X25vc3Bl
YyAtIHNhbml0aXplIGFuIGFycmF5IGluZGV4IGFmdGVyIGEgYm91bmRzIGNoZWNrCj4gICAqCj4g
QEAgLTU4LDYgKzU5LDE3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBhcnJheV9pbmRl
eF9tYXNrX25vc3BlYyh1bnNpZ25lZCBsb25nIGluZGV4LAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
ICAgICAodHlwZW9mKF9pKSkgKF9pICYgX21hc2spOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiAgfSkKPiArI2Vsc2UKPiArLyogTm8gaW5kZXggaGFyZGVuaW5n
LiAqLwo+ICsjZGVmaW5lIGFycmF5X2luZGV4X25vc3BlYyhpbmRleCwgc2l6ZSkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIHR5cGVv
ZihpbmRleCkgX2kgPSAoaW5kZXgpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICsgICAgdHlwZW9mKHNpemUpIF9zID0gKHNpemUpOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICh2
b2lkKV9zOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICsgICAgX2k7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gK30pCgpXaHkgbm90IHRoZSBzaW1wbGVy
CgojZGVmaW5lIGFycmF5X2luZGV4X25vc3BlYyhpbmRleCwgc2l6ZSkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCih7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICh2b2lkKShzaXplKTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAg
KGluZGV4KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCn0pCgphdCB3aGljaCBwb2ludCBpdCB3b3VsZCBzZWVtIGZlYXNpYmxlIHRv
IGF2b2lkIHRoZSB1c2Ugb2YgY29tcGlsZXIKZXh0ZW5zaW9ucyBhbHRvZ2V0aGVyIGJ5IG1ha2lu
ZyBpdAoKI2RlZmluZSBhcnJheV9pbmRleF9ub3NwZWMoaW5kZXgsIHNpemUpICgodm9pZCkoc2l6
ZSksIChpbmRleCkpCgo/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
