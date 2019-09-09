Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B8AD4D3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 10:24:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7EwZ-0002y2-PV; Mon, 09 Sep 2019 08:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7EwX-0002xw-QY
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 08:22:37 +0000
X-Inumbo-ID: f9aaa1be-d2da-11e9-ac09-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9aaa1be-d2da-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 08:22:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E12EACE3;
 Mon,  9 Sep 2019 08:22:35 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190909073557.16168-1-jgross@suse.com>
 <20190909073557.16168-6-jgross@suse.com>
 <7a0b2a0c-28af-cd70-e193-309228dc58da@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5d8c6d41-cbe3-e321-69c7-1dbdea14106c@suse.com>
Date: Mon, 9 Sep 2019 10:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a0b2a0c-28af-cd70-e193-309228dc58da@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v6 5/5] xen: add debugtrace entry when entry
 count is wrapping
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMTkgMTA6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA5LjIwMTkgMDk6
MzUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0xNzMsMTAgKzE3NywyMyBAQCB2b2lkIGRl
YnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+PiAgICAgICBuciA9IHZzbnBy
aW50ZihidWYsIHNpemVvZihidWYpLCBmbXQsIGFyZ3MpOwo+PiAgICAgICB2YV9lbmQoYXJncyk7
Cj4+ICAgCj4+ICsgICAgaWYgKCBjb3VudCA9PSBERUJVR1RSQUNFX0NPVU5UX1dSQVAgKQo+PiAr
ICAgIHsKPj4gKyAgICAgICAgY291bnQgPSAwOwo+PiArICAgICAgICB3cmFwX2NudCsrOwo+PiAr
ICAgIH0KPj4gKwo+PiAgICAgICBpZiAoIGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlICkKPj4g
ICAgICAgewo+PiAtICAgICAgICB1bnNpZ25lZCBpbnQgbiA9IHNjbnByaW50ZihjbnRidWYsIHNp
emVvZihjbnRidWYpLCAiJXUgIiwgKytjb3VudCk7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBu
Owo+PiArCj4+ICsgICAgICAgIGlmICggY291bnQgPT0gMCApCj4+ICsgICAgICAgIHsKPj4gKyAg
ICAgICAgICAgIG4gPSBzY25wcmludGYoY250YnVmLCBzaXplb2YoY250YnVmKSwgIndyYXA6ICVs
dVxuIiwgd3JhcF9jbnQpOwo+PiArICAgICAgICAgICAgY29uc29sZV9zZXJpYWxfcHV0cyhjbnRi
dWYsIG4pOwo+PiArICAgICAgICB9Cj4+ICAgCj4+ICsgICAgICAgIG4gPSBzY25wcmludGYoY250
YnVmLCBzaXplb2YoY250YnVmKSwgIiV1ICIsICsrY291bnQpOwo+PiAgICAgICAgICAgY29uc29s
ZV9zZXJpYWxfcHV0cyhjbnRidWYsIG4pOwo+PiAgICAgICAgICAgY29uc29sZV9zZXJpYWxfcHV0
cyhidWYsIG5yKTsKPj4gICAgICAgfQo+IAo+IEp1c3Qgb25lIG1pbm9yIHJlbWFyazogSW4gdGhp
cyBjYXNlIHlvdSBpc3N1ZSBhICJ3cmFwIiBtZXNzYWdlIGF0Cj4gc3RhcnQgb2YgZGF5LCAuLi4K
PiAKPj4gQEAgLTE4NCw4ICsyMDEsMTYgQEAgdm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBj
aGFyICpmbXQsIC4uLikKPj4gICAgICAgewo+PiAgICAgICAgICAgdW5zaWduZWQgaW50IGNwdSA9
IGRlYnVndHJhY2VfcGVyX2NwdSA/IHNtcF9wcm9jZXNzb3JfaWQoKSA6IDA7Cj4+ICAgCj4+IC0g
ICAgICAgIGlmICggZGVidWd0cmFjZV9idWZfZW1wdHkgfHwgc3RyY21wKGJ1ZiwgbGFzdF9idWYp
ICkKPj4gKyAgICAgICAgaWYgKCBkZWJ1Z3RyYWNlX2J1Zl9lbXB0eSB8fCB3cmFwX2NudCAhPSBk
YXRhLT53cmFwX2NudCB8fAo+PiArICAgICAgICAgICAgIHN0cmNtcChidWYsIGxhc3RfYnVmKSAp
Cj4+ICAgICAgICAgICB7Cj4+ICsgICAgICAgICAgICBpZiAoIHdyYXBfY250ICE9IGRhdGEtPndy
YXBfY250ICkKPj4gKyAgICAgICAgICAgIHsKPj4gKyAgICAgICAgICAgICAgICBzbnByaW50Zihj
bnRidWYsIHNpemVvZihjbnRidWYpLCAid3JhcDogJWx1LT4lbHVcbiIsCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgZGF0YS0+d3JhcF9jbnQsIHdyYXBfY250KTsKPj4gKyAgICAgICAgICAg
ICAgICBkZWJ1Z3RyYWNlX2FkZF90b19idWYoY250YnVmKTsKPj4gKyAgICAgICAgICAgICAgICBk
YXRhLT53cmFwX2NudCA9IHdyYXBfY250Owo+PiArICAgICAgICAgICAgfQo+PiAgICAgICAgICAg
ICAgIGRlYnVndHJhY2VfYnVmX2VtcHR5ID0gZmFsc2U7Cj4+ICAgICAgICAgICAgICAgbGFzdF9w
cmQgPSBkYXRhLT5wcmQ7Cj4+ICAgICAgICAgICAgICAgbGFzdF9jb3VudCA9ICsrY291bnQ7Cj4g
Cj4gLi4uIHdoZXJlYXMgaGVyZSBvbmUgZ2V0cyBpc3N1ZWQgKGFzIEknZCBleHBlY3QgaXQpIG9u
bHkgYWZ0ZXIgdGhlCj4gZmlyc3Qgd3JhcHBpbmcgb2YgImNvdW50Ii4KClllcywgSSBrbm93LiBU
aGUgcmVhc29uIEkgaGF2ZSBkb25lIGl0IHRoaXMgd2F5IHdhcyB0aGUgcG9zc2liaWxpdHkgdG8K
c3VwcG9ydCBkZWJ1Z3RyYWNlIHZpYSBjb25zb2xlIGV2ZW4gaW4gY2FzZSBvZiBhIHplcm8tc2l6
ZWQgYnVmZmVyIGluCmZ1dHVyZS4gSSBjYW4gcG9pbnQgdGhhdCBvdXQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
