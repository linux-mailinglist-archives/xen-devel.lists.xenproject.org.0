Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A97F95FB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 17:48:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUZIK-0005Yi-1L; Tue, 12 Nov 2019 16:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUZII-0005Yd-QF
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 16:45:30 +0000
X-Inumbo-ID: d51fc138-056b-11ea-adbe-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d51fc138-056b-11ea-adbe-bc764e2007e4;
 Tue, 12 Nov 2019 16:45:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE334AEA2;
 Tue, 12 Nov 2019 16:45:27 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20191002112004.25793-1-jgross@suse.com>
 <20191002112004.25793-6-jgross@suse.com>
 <0eb11745-5ddf-b562-3f15-bb1c4e6fba9c@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d1d31f54-aa1b-ad87-b7e7-4d904072d3b8@suse.com>
Date: Tue, 12 Nov 2019 17:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0eb11745-5ddf-b562-3f15-bb1c4e6fba9c@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTEuMTkgMTU6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAyLjEwLjIwMTkgMTM6
MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFkZCB0aGUgL2J1aWxkaW5mby9jb25maWcgZW50
cnkgdG8gdGhlIGh5cGVydmlzb3IgZmlsZXN5c3RlbS4gVGhpcwo+PiBlbnRyeSBjb250YWlucyB0
aGUgLmNvbmZpZyBmaWxlIHVzZWQgdG8gYnVpbGQgdGhlIGh5cGVydmlzb3IuCj4gCj4gSSB0aGlu
ayB0aGlzIGlzIHRoZSAybmQgc3RlcCBhaGVhZCBvZiB0aGUgMXN0OiBNdWNoIG9mIHRoZSBzdHVm
Zgo+IGV4cG9zZWQgYXMgWEVOVkVSXyogc3ViLW9wcyBzaG91bGQgbWFuaWZlc3QgaXRzZWxmIGhl
cmUgYWhlYWQgb2YKPiBleHBvc2luZyB4ZW4vLmNvbmZpZy4KClllcyBhbmQgbm8uIFRoaXMgaXMg
bWVhbnQgYXMgYSByZXBsYWNlbWVudCBmb3IgbXkgcHJldmlvdXMgcGF0Y2ggc2VyaWVzCmFkZGlu
ZyAuY29uZmlnIHJlYWQgc3VwcG9ydC4KCkl0IGlzIG5vIHByb2JsZW0gdG8gYWRkIG90aGVyIGRh
dGEgYXMgd2VsbCwgYnV0IHRoZSBuZWVkIGZvciBiZWluZyBhYmxlCnRvIHJlYWQgLmNvbmZpZyBj
b250ZW50cyB3YXMgYWxyZWFkeSBhZ3JlZWQgb24uCgo+IAo+PiBAQCAtNzksMyArODAsMTEgQEAg
c3ViZGlyLSQoQ09ORklHX1VCU0FOKSArPSB1YnNhbgo+PiAgIAo+PiAgIHN1YmRpci0kKENPTkZJ
R19ORUVEU19MSUJFTEYpICs9IGxpYmVsZgo+PiAgIHN1YmRpci0kKENPTkZJR19IQVNfREVWSUNF
X1RSRUUpICs9IGxpYmZkdAo+PiArCj4+ICtjb25maWdfZGF0YS5jOiAuLi8uY29uZmlnCj4+ICsJ
KCBlY2hvICJjaGFyIHhlbl9jb25maWdfZGF0YVtdID0iOyBcCj4+ICsJICAuLi90b29scy9iaW4y
YyA8JDw7IFwKPj4gKwkgIGVjaG8gIjsiICkgPiAkQAo+IAo+IFRoaXMgaXMgdGhlIHR5cGljYWwg
a2luZCBvZiBjb25zdHJ1Y3QgdGhhdCBtYXkgYnJlYWsgKGEgc3Vic2VxdWVudAo+IGJ1aWxkIGF0
dGVtcHQpIHdoZW4gaW50ZXJydXB0ZWQgaW4gdGhlIG1pZGRsZS4gVGhpcyBwcmV0dHkgY2xlYXJs
eQo+IGlzIGEgbW92ZS1pZi1jaGFuZ2VkIGNhbmRpZGF0ZSwgYXQgdGhlIHNhbWUgdGltZSBhbHNv
IGF2b2lkaW5nIGEKPiAoY2hlYXAsIGJ1dCBhbnl3YXkpIHBvaW50bGVzcyByZS1idWlsZCBpbiBj
YXNlIC5jb25maWcgd2FzIHRvdWNoZWQKPiB3aXRob3V0IGFjdHVhbGx5IGNoYW5naW5nLgoKT2th
eS4KCj4gCj4gRnVydGhlcm1vcmUgaXMgdGhlcmUgYSByZWFzb24gdG8gZXhwb3NlIHRoaXMgYXMg
cGxhaW4gdGV4dCwgd2hlbgo+IExpbnV4IGV4cG9zZXMgYSBnemlwLWVkIHZlcnNpb24gaW4gL3By
b2M/IFRoZSBmaWxlIGlzbid0IHZlcnkKPiBsYXJnZSBub3csIGJ1dCB0aGlzIHdhcyBhbHNvIHRo
ZSBjYXNlIGZvciBMaW51eCBtYW55IHllYXJzIGFnby4KCmd6aXAgZGF0YSBtYXkgY29udGFpbiBi
eXRlcyB3aXRoIDB4MDAuIFN1cHBvcnRpbmcgdGhhdCB3b3VsZCByZXF1aXJlIGEKZGlmZmVyZW50
IGludGVyZmFjZSBhdCBhbGwgbGV2ZWxzLgoKPiAKPj4gLS0tIGEveGVuL2NvbW1vbi9oeXBmcy5j
Cj4+ICsrKyBiL3hlbi9jb21tb24vaHlwZnMuYwo+PiBAQCAtMjUsNiArMjUsMTAgQEAgc3RhdGlj
IHN0cnVjdCBoeXBmc19lbnRyeSBoeXBmc19yb290X2VudHJ5ID0gewo+PiAgICAgICAuZGlyID0g
Jmh5cGZzX3Jvb3QsCj4+ICAgfTsKPj4gICAKPj4gK3N0YXRpYyBzdHJ1Y3QgaHlwZnNfZGlyIGh5
cGZzX2J1aWxkaW5mbyA9IHsKPj4gKyAgICAubGlzdCA9IExJU1RfSEVBRF9JTklUKGh5cGZzX2J1
aWxkaW5mby5saXN0KSwKPj4gK307Cj4+ICsKPj4gICBzdGF0aWMgaW50IGh5cGZzX2FkZF9lbnRy
eShzdHJ1Y3QgaHlwZnNfZGlyICpwYXJlbnQsIHN0cnVjdCBoeXBmc19lbnRyeSAqbmV3KQo+PiAg
IHsKPj4gICAgICAgaW50IHJldCA9IC1FTk9FTlQ7Cj4+IEBAIC0zMTYsMyArMzIwLDE2IEBAIGxv
bmcgZG9faHlwZnNfb3AodW5zaWduZWQgaW50IGNtZCwKPj4gICAKPj4gICAgICAgcmV0dXJuIHJl
dDsKPj4gICB9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgX19pbml0IGh5cGZzX2luaXQodm9pZCkKPj4g
K3sKPj4gKyAgICBpbnQgcmV0Owo+PiArCj4+ICsgICAgcmV0ID0gaHlwZnNfbmV3X2RpcigmaHlw
ZnNfcm9vdCwgImJ1aWxkaW5mbyIsICZoeXBmc19idWlsZGluZm8pOwo+PiArICAgIEJVR19PTihy
ZXQpOwo+PiArICAgIHJldCA9IGh5cGZzX25ld19lbnRyeV9zdHJpbmcoJmh5cGZzX2J1aWxkaW5m
bywgImNvbmZpZyIsIHhlbl9jb25maWdfZGF0YSk7Cj4+ICsgICAgQlVHX09OKHJldCk7Cj4+ICsK
Pj4gKyAgICByZXR1cm4gMDsKPj4gK30KPj4gK19faW5pdGNhbGwoaHlwZnNfaW5pdCk7Cj4gCj4g
SG1tLCBkbyB5b3UgcmVhbGx5IHdhbnQgdG8gY2VudHJhbGl6ZSBwb3B1bGF0aW9uIG9mIHRoZSBm
aWxlIHN5c3RlbQo+IGhlcmUsIHJhdGhlciB0aGFuIGhhdmluZyB0aGUgaW5kaXZpZHVhbCBjb21w
b25lbnRzIHRha2UgY2FyZSBvZiBpdD8KCkkgY2FuIGFkZCBhIG5ldyBzb3VyY2UsIGUuZy4gY29t
bW9uL2J1aWxkaW5mby5jIGlmIHlvdSBsaWtlIHRoYXQgYmV0dGVyLgoKPiAKPj4gLS0tIGEveGVu
L3Rvb2xzL01ha2VmaWxlCj4+ICsrKyBiL3hlbi90b29scy9NYWtlZmlsZQo+PiBAQCAtMSwxMyAr
MSwxOCBAQAo+PiAgIAo+PiAgIGluY2x1ZGUgJChYRU5fUk9PVCkvQ29uZmlnLm1rCj4+ICAgCj4+
ICtQUk9HUyA9IHN5bWJvbHMgYmluMmMKPj4gKwo+PiAgIC5QSE9OWTogZGVmYXVsdAo+PiAgIGRl
ZmF1bHQ6Cj4+IC0JJChNQUtFKSBzeW1ib2xzCj4+ICsJJChNQUtFKSAkKFBST0dTKQo+IAo+IENv
dWxkIEkgYXNrIHlvdSB0byB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgZG8gYXdheSB3aXRoIHRo
ZQo+IHVubmVjZXNzYXJ5IChhcyBpdCBzZWVtcyB0byBtZSkgbWFrZSByZWN1cnNpb24/ICQoUFJP
R1MpIGNvdWxkCj4gZWFzaWx5IGJlY29tZSBhIGRlcGVuZGVuY3kgb2YgImRlZmF1bHQiIGFmYWlj
dC4KCkZpbmUgd2l0aCBtZS4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
