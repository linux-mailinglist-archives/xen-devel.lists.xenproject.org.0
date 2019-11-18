Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1010071D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 15:12:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWhj4-0005PK-00; Mon, 18 Nov 2019 14:09:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWhj2-0005PF-OM
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 14:09:56 +0000
X-Inumbo-ID: 18360932-0a0d-11ea-a2d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18360932-0a0d-11ea-a2d9-12813bfff9fa;
 Mon, 18 Nov 2019 14:09:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E58ECB25D;
 Mon, 18 Nov 2019 14:09:53 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <8c928769-c0ea-8a48-3bda-aba7d17133ba@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9141e27c-edd4-301a-ee76-e3fcf5e787af@suse.com>
Date: Mon, 18 Nov 2019 15:09:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8c928769-c0ea-8a48-3bda-aba7d17133ba@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "julien@xen.org" <julien@xen.org>,
 "wl@xen.org" <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxNDozOSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTIuMTEuMjAxOSAxMzo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA2LjExLjIwMTkgMTY6
MzUsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gQEAgLTQ2OTMsOCArNDY5NCwy
MyBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPj4+ICAgICAgICAgICB9Cj4+PiAgICAgICAg
ICAgYnJlYWs7Cj4+PiAgIAo+Pj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfc3VwcHJlc3Nf
dmVfbXVsdGk6Cj4+PiArICAgICAgICBpZiAoIGEudS5zdXBwcmVzc192ZS5wYWQxIHx8ICFhLnUu
c3VwcHJlc3NfdmUubnIgKQo+Pgo+PiBBIGNvdW50IG9mIHplcm8gdHlwaWNhbGx5IGlzIHRha2Vu
IGFzIGEgbm8tb3AsIG5vdCBhbiBlcnJvci4KPiAKPiBJIHdpbGwgcmV0dXJuIC1FUEVSTSBmb3Ig
IW5yLgoKSG93IGlzIC1FUEVSTSBiZXR0ZXIgdGhhbiAuLi4KCj4+PiArICAgICAgICAgICAgcmMg
PSAtRUlOVkFMOwoKLi4uIHRoaXMsIGFuZCBoZW5jZSBob3cgaXMgaXQgYWRkcmVzc2luZyBteSBy
ZW1hcms/Cgo+Pj4gKyAgICAgICAgZWxzZQo+Pj4gKyAgICAgICAgewo+Pj4gKyAgICAgICAgICAg
IHJjID0gcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShkLCAmYS51LnN1cHByZXNzX3ZlKTsKPj4+
ICsKPj4+ICsgICAgICAgICAgICBpZiAoIHJjID09IC1FUkVTVEFSVCApCj4+PiArICAgICAgICAg
ICAgICAgIGlmICggX19jb3B5X2ZpZWxkX3RvX2d1ZXN0KGd1ZXN0X2hhbmRsZV9jYXN0KGFyZywK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVuX2h2bV9h
bHRwMm1fb3BfdCksCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZhLCB1LnN1cHByZXNzX3ZlLm9wYXF1ZSkgKQo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
cmMgPSAtRUZBVUxUOwo+Pgo+PiBJZiB0aGUgb3BlcmF0aW9uIGlzIGJlc3QgZWZmb3J0LCBfc29t
ZV8gaW5kaWNhdGlvbiBvZiBmYWlsdXJlIHNob3VsZAo+PiBzdGlsbCBiZSBoYW5kZWQgYmFjayB0
byB0aGUgY2FsbGVyLiBXaGV0aGVyIHRoYXQncyB0aHJvdWdoIHRoZSBvcGFxdWUKPj4gZmllbGQg
b3IgYnkgc29tZSBvdGhlciBtZWFucyBpcyBzZWNvbmRhcnkuIElmIG5vdCB2aWEgdGhhdCBmaWVs
ZAo+PiAod2hpY2ggd291bGQgbWFrZSB0aGUgb3V0ZXIgb2YgdGhlIHR3byBpZigpLXMgZGlzYXBw
ZWFyKSwgcGxlYXNlIGZvbGQKPj4gdGhlIGlmKCktcy4KPiAKPiBUaGlzIGNhbiBiZSBzb2x2ZWQg
YnkgaGF2aW5nIGEgaW50IGVycm9yX2xpc3QgdGhhdCB3aWxsIGdldCAKPiAiY29weV90b19ndWVz
dF9vZmZzZXQoKSIgYXQgdGhlIGVuZC4KCkkgd2FzIGFjdHVhbGx5IG5vdCBtZWFuaW5nIHRvIHN1
Z2dlc3QgdG8gZ28gX3RoYXRfIGZhciwgYnV0IEkKd291bGRuJ3QgbWluZCBzdWNoIGEgZnVsbCBz
b2x1dGlvbi4gU2luY2UgdGhlcmUncyBhICJnZXQiCmNvdW50ZXJwYXJ0LCBJIHdhcyByYXRoZXIg
dGhpbmtpbmcgdGhhdCBhbiBpbmRpY2F0aW9uIG9mICJ0aGVyZQp3YXMgX3NvbWVfIGVycm9yIiBt
aWdodCBzdWZmaWNlLCBzdWdnZXN0aW5nIHRvIHRoZSBjYWxsZXIgdG8KaW5zcGVjdCB3aGljaCBz
ZXR0aW5ncyBhY3R1YWxseSB0b29rIGVmZmVjdC4gU3VjaCBhbiBpbmRpY2F0aW9uCmNvdWxkIGUu
Zy4gYmUgYW4gaW5kZXggdmFsdWUgaWRlbnRpZnlpbmcgdGhlIGZpcnN0IGZhaWxlZApvcGVyYXRp
b24uCgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+Pj4gKysrIGIv
eGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+Pj4gQEAgLTQyLDggKzQyLDkgQEAgc3Ry
dWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlIHsKPj4+ICAgICAgIHVpbnQxNl90IHZpZXc7
Cj4+PiAgICAgICB1aW50OF90IHN1cHByZXNzX3ZlOyAvKiBCb29sZWFuIHR5cGUuICovCj4+PiAg
ICAgICB1aW50OF90IHBhZDE7Cj4+PiAtICAgIHVpbnQzMl90IHBhZDI7Cj4+PiArICAgIHVpbnQz
Ml90IG5yOwo+Pj4gICAgICAgdWludDY0X3QgZ2ZuOwo+Pj4gKyAgICB1aW50NjRfdCBvcGFxdWU7
Cj4+PiAgIH07Cj4+Cj4+IEhvdyBpcyB0aGlzIGFkZGl0aW9uIG9mIGEgZmllbGQgZ29pbmcgdG8g
d29yayBjb21wYXRpYmx5IHdpdGggb2xkCj4+IGFuZCBuZXcgY2FsbGVycyBvbiBvbGQgYW5kIG5l
dyBoeXBlcnZpc29ycz8gUmVjYWxsIGluIHBhcnRpY3VsYXIKPj4gdGhhdCB0aGVzZSBvcGVyYXRp
b25zIGFyZSAoYWxtb3N0PykgYWxsIHBvdGVudGlhbGx5IHVzYWJsZSBieSB0aGUKPj4gZ3Vlc3Qg
aXRzZWxmLgo+IAo+IEZvciB0aGlzIEhWTU9QX0FMVFAyTV9JTlRFUkZBQ0VfVkVSU0lPTiBzaG91
dCBiZSBpbmNyZWFzZWQuIEkgd2lsbCBsZWF2ZSAKPiBpdCB0byBUYW1hcyB0byBkZWNpZGUgaWYg
d2Ugd2lsbCBuZWVkIGEgZGlmZmVyZW50IHN0cnVjdHVyZSBmb3IgCj4geGVuX2h2bV9hbHRwMm1f
c3VwcHJlc3NfdmVfbXVsdGkgdG8ga2VlcCB0aGUgY29tcGF0aWJpbGl0eS4KCldhc24ndCBpcyB0
aGF0IGR1ZSB0byB0aGUgcG9zc2libGUgZ3Vlc3QgZXhwb3N1cmUgaXQgd2FzIGRlY2lkZWQKdGhh
dCB0aGUgaW50ZXJmYWNlIHZlcnNpb24gYXBwcm9hY2ggd2FzIG5vdCBzdWl0YWJsZSBoZXJlLCBh
bmQgaGVuY2UKaXQgc2hvdWxkbid0IGJlIGJ1bXBlZCBhbnkgZnVydGhlcj8KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
