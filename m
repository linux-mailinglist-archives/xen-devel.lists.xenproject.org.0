Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D2F91F8
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 15:24:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUX3r-0008S0-Hk; Tue, 12 Nov 2019 14:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUX3p-0008Rf-8f
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 14:22:25 +0000
X-Inumbo-ID: d805b84e-0557-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d805b84e-0557-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 14:22:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A60AAB327;
 Tue, 12 Nov 2019 14:22:22 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20191002112004.25793-1-jgross@suse.com>
 <20191002112004.25793-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0eb11745-5ddf-b562-3f15-bb1c4e6fba9c@suse.com>
Date: Tue, 12 Nov 2019 15:22:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191002112004.25793-6-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] xen: add /buildinfo/config entry to
 hypervisor filesystem
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxMzoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgdGhlIC9idWls
ZGluZm8vY29uZmlnIGVudHJ5IHRvIHRoZSBoeXBlcnZpc29yIGZpbGVzeXN0ZW0uIFRoaXMKPiBl
bnRyeSBjb250YWlucyB0aGUgLmNvbmZpZyBmaWxlIHVzZWQgdG8gYnVpbGQgdGhlIGh5cGVydmlz
b3IuCgpJIHRoaW5rIHRoaXMgaXMgdGhlIDJuZCBzdGVwIGFoZWFkIG9mIHRoZSAxc3Q6IE11Y2gg
b2YgdGhlIHN0dWZmCmV4cG9zZWQgYXMgWEVOVkVSXyogc3ViLW9wcyBzaG91bGQgbWFuaWZlc3Qg
aXRzZWxmIGhlcmUgYWhlYWQgb2YKZXhwb3NpbmcgeGVuLy5jb25maWcuCgo+IEBAIC03OSwzICs4
MCwxMSBAQCBzdWJkaXItJChDT05GSUdfVUJTQU4pICs9IHVic2FuCj4gIAo+ICBzdWJkaXItJChD
T05GSUdfTkVFRFNfTElCRUxGKSArPSBsaWJlbGYKPiAgc3ViZGlyLSQoQ09ORklHX0hBU19ERVZJ
Q0VfVFJFRSkgKz0gbGliZmR0Cj4gKwo+ICtjb25maWdfZGF0YS5jOiAuLi8uY29uZmlnCj4gKwko
IGVjaG8gImNoYXIgeGVuX2NvbmZpZ19kYXRhW10gPSI7IFwKPiArCSAgLi4vdG9vbHMvYmluMmMg
PCQ8OyBcCj4gKwkgIGVjaG8gIjsiICkgPiAkQAoKVGhpcyBpcyB0aGUgdHlwaWNhbCBraW5kIG9m
IGNvbnN0cnVjdCB0aGF0IG1heSBicmVhayAoYSBzdWJzZXF1ZW50CmJ1aWxkIGF0dGVtcHQpIHdo
ZW4gaW50ZXJydXB0ZWQgaW4gdGhlIG1pZGRsZS4gVGhpcyBwcmV0dHkgY2xlYXJseQppcyBhIG1v
dmUtaWYtY2hhbmdlZCBjYW5kaWRhdGUsIGF0IHRoZSBzYW1lIHRpbWUgYWxzbyBhdm9pZGluZyBh
CihjaGVhcCwgYnV0IGFueXdheSkgcG9pbnRsZXNzIHJlLWJ1aWxkIGluIGNhc2UgLmNvbmZpZyB3
YXMgdG91Y2hlZAp3aXRob3V0IGFjdHVhbGx5IGNoYW5naW5nLgoKRnVydGhlcm1vcmUgaXMgdGhl
cmUgYSByZWFzb24gdG8gZXhwb3NlIHRoaXMgYXMgcGxhaW4gdGV4dCwgd2hlbgpMaW51eCBleHBv
c2VzIGEgZ3ppcC1lZCB2ZXJzaW9uIGluIC9wcm9jPyBUaGUgZmlsZSBpc24ndCB2ZXJ5Cmxhcmdl
IG5vdywgYnV0IHRoaXMgd2FzIGFsc28gdGhlIGNhc2UgZm9yIExpbnV4IG1hbnkgeWVhcnMgYWdv
LgoKPiAtLS0gYS94ZW4vY29tbW9uL2h5cGZzLmMKPiArKysgYi94ZW4vY29tbW9uL2h5cGZzLmMK
PiBAQCAtMjUsNiArMjUsMTAgQEAgc3RhdGljIHN0cnVjdCBoeXBmc19lbnRyeSBoeXBmc19yb290
X2VudHJ5ID0gewo+ICAgICAgLmRpciA9ICZoeXBmc19yb290LAo+ICB9Owo+ICAKPiArc3RhdGlj
IHN0cnVjdCBoeXBmc19kaXIgaHlwZnNfYnVpbGRpbmZvID0gewo+ICsgICAgLmxpc3QgPSBMSVNU
X0hFQURfSU5JVChoeXBmc19idWlsZGluZm8ubGlzdCksCj4gK307Cj4gKwo+ICBzdGF0aWMgaW50
IGh5cGZzX2FkZF9lbnRyeShzdHJ1Y3QgaHlwZnNfZGlyICpwYXJlbnQsIHN0cnVjdCBoeXBmc19l
bnRyeSAqbmV3KQo+ICB7Cj4gICAgICBpbnQgcmV0ID0gLUVOT0VOVDsKPiBAQCAtMzE2LDMgKzMy
MCwxNiBAQCBsb25nIGRvX2h5cGZzX29wKHVuc2lnbmVkIGludCBjbWQsCj4gIAo+ICAgICAgcmV0
dXJuIHJldDsKPiAgfQo+ICsKPiArc3RhdGljIGludCBfX2luaXQgaHlwZnNfaW5pdCh2b2lkKQo+
ICt7Cj4gKyAgICBpbnQgcmV0Owo+ICsKPiArICAgIHJldCA9IGh5cGZzX25ld19kaXIoJmh5cGZz
X3Jvb3QsICJidWlsZGluZm8iLCAmaHlwZnNfYnVpbGRpbmZvKTsKPiArICAgIEJVR19PTihyZXQp
Owo+ICsgICAgcmV0ID0gaHlwZnNfbmV3X2VudHJ5X3N0cmluZygmaHlwZnNfYnVpbGRpbmZvLCAi
Y29uZmlnIiwgeGVuX2NvbmZpZ19kYXRhKTsKPiArICAgIEJVR19PTihyZXQpOwo+ICsKPiArICAg
IHJldHVybiAwOwo+ICt9Cj4gK19faW5pdGNhbGwoaHlwZnNfaW5pdCk7CgpIbW0sIGRvIHlvdSBy
ZWFsbHkgd2FudCB0byBjZW50cmFsaXplIHBvcHVsYXRpb24gb2YgdGhlIGZpbGUgc3lzdGVtCmhl
cmUsIHJhdGhlciB0aGFuIGhhdmluZyB0aGUgaW5kaXZpZHVhbCBjb21wb25lbnRzIHRha2UgY2Fy
ZSBvZiBpdD8KCj4gLS0tIGEveGVuL3Rvb2xzL01ha2VmaWxlCj4gKysrIGIveGVuL3Rvb2xzL01h
a2VmaWxlCj4gQEAgLTEsMTMgKzEsMTggQEAKPiAgCj4gIGluY2x1ZGUgJChYRU5fUk9PVCkvQ29u
ZmlnLm1rCj4gIAo+ICtQUk9HUyA9IHN5bWJvbHMgYmluMmMKPiArCj4gIC5QSE9OWTogZGVmYXVs
dAo+ICBkZWZhdWx0Ogo+IC0JJChNQUtFKSBzeW1ib2xzCj4gKwkkKE1BS0UpICQoUFJPR1MpCgpD
b3VsZCBJIGFzayB5b3UgdG8gdGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGRvIGF3YXkgd2l0aCB0
aGUKdW5uZWNlc3NhcnkgKGFzIGl0IHNlZW1zIHRvIG1lKSBtYWtlIHJlY3Vyc2lvbj8gJChQUk9H
UykgY291bGQKZWFzaWx5IGJlY29tZSBhIGRlcGVuZGVuY3kgb2YgImRlZmF1bHQiIGFmYWljdC4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
