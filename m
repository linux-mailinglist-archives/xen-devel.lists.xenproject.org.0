Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABA1B451
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 12:51:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ8W3-0005lV-QQ; Mon, 13 May 2019 10:49:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQ8W2-0005lQ-Hi
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:49:06 +0000
X-Inumbo-ID: b8985d02-756c-11e9-84d0-eb4b83f3f11e
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8985d02-756c-11e9-84d0-eb4b83f3f11e;
 Mon, 13 May 2019 10:49:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85380079"
Date: Mon, 13 May 2019 11:48:55 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <20190513104855.GB2798@zion.uk.xensource.com>
References: <20190507135320.103953-1-elnikety@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507135320.103953-1-elnikety@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2] libxl: make vkbd tunable for HVM guests
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Amit Shah <aams@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDE6NTM6MjBQTSArMDAwMCwgRXNsYW0gRWxuaWtldHkg
d3JvdGU6Cj4gRWFjaCBIVk0gZ3Vlc3QgY3VycmVudGx5IGdldHMgYSB2a2JkIGZyb250ZW5kL2Jh
Y2tlbmQgcGFpciAoYy9zIGViYmQyNTYxYjRjKS4KPiBUaGlzIGNvbnN1bWVzIGhvc3QgcmVzb3Vy
Y2VzIHVubmVjZXNzYXJpbHkgZm9yIGd1ZXN0cyB0aGF0IGhhdmUgbm8gdXNlIGZvcgo+IHZrYmQu
IE1ha2UgdGhpcyBiZWhhdmlvdXIgdHVuYWJsZSB0byBhbGxvdyBhbiBhZG1pbmlzdHJhdG9yIHRv
IGNob29zZS4gVGhlCj4gY29tbWl0IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIC0tIEhW
TSBndWVzdHMgc3RpbGwgZ2V0IHZrZGIgdW5sZXNzCj4gc3BlY2lmaWVkIG90aGVyd2lzZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBFc2xhbSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4KPiAK
PiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gQWRkZWQgYSBtaXNzaW5nIGh1
bmsgLyBzZXR0aW5nIHZrYl9kZXZpY2UgcGVyIGNvbmZpZwo+IC0tLQo+ICB0b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYyAgfCA5ICsrKysrKy0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5p
ZGwgfCAxICsKPiAgdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAgIHwgMSArCj4gIHRvb2xzL3hs
L3hsX3N4cC5jICAgICAgICAgICB8IDIgKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4
bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCj4gaW5kZXggODlmZTgwZmM5
Yy4uMDNjZTE2NmY0ZiAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+
ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCj4gQEAgLTMxMCw2ICszMTAsNyBAQCBp
bnQgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKPiAg
ICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmJfaW5mby0+dS5odm0udnB0X2FsaWdu
LCAgICAgICAgICB0cnVlKTsKPiAgICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmJf
aW5mby0+dS5odm0uYWx0cDJtLCAgICAgICAgICAgICBmYWxzZSk7Cj4gICAgICAgICAgbGlieGxf
ZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLnVzYiwgICAgICAgICAgICAgICAgZmFs
c2UpOwo+ICsgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT51Lmh2bS52
a2JfZGV2aWNlLCAgICAgICAgIHRydWUpOwo+ICAgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVm
YXVsdCgmYl9pbmZvLT51Lmh2bS54ZW5fcGxhdGZvcm1fcGNpLCAgIHRydWUpOwo+ICAKPiAgICAg
ICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmJfaW5mby0+dS5odm0uc3BpY2UuZW5hYmxl
LCBmYWxzZSk7Cj4gQEAgLTE0MTYsOSArMTQxNywxMSBAQCBzdGF0aWMgdm9pZCBkb21jcmVhdGVf
bGF1bmNoX2RtKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX211bHRpZGV2ICptdWx0aWRldiwKPiAg
ICAgICAgICBsaWJ4bF9fZGV2aWNlX2NvbnNvbGVfYWRkKGdjLCBkb21pZCwgJmNvbnNvbGUsIHN0
YXRlLCAmZGV2aWNlKTsKPiAgICAgICAgICBsaWJ4bF9fZGV2aWNlX2NvbnNvbGVfZGlzcG9zZSgm
Y29uc29sZSk7Cj4gIAo+IC0gICAgICAgIGxpYnhsX2RldmljZV92a2JfaW5pdCgmdmtiKTsKPiAt
ICAgICAgICBsaWJ4bF9fZGV2aWNlX2FkZChnYywgZG9taWQsICZsaWJ4bF9fdmtiX2RldnR5cGUs
ICZ2a2IpOwo+IC0gICAgICAgIGxpYnhsX2RldmljZV92a2JfZGlzcG9zZSgmdmtiKTsKPiArICAg
ICAgICBpZiAobGlieGxfZGVmYm9vbF92YWwoZF9jb25maWctPmJfaW5mby51Lmh2bS52a2JfZGV2
aWNlKSkgewo+ICsgICAgICAgICAgICBsaWJ4bF9kZXZpY2VfdmtiX2luaXQoJnZrYik7Cj4gKyAg
ICAgICAgICAgIGxpYnhsX19kZXZpY2VfYWRkKGdjLCBkb21pZCwgJmxpYnhsX192a2JfZGV2dHlw
ZSwgJnZrYik7Cj4gKyAgICAgICAgICAgIGxpYnhsX2RldmljZV92a2JfZGlzcG9zZSgmdmtiKTsK
PiArICAgICAgICB9Cj4gIAo+ICAgICAgICAgIGRjcy0+c2Rzcy5kbS5ndWVzdF9kb21pZCA9IGRv
bWlkOwo+ICAgICAgICAgIGlmIChsaWJ4bF9kZWZib29sX3ZhbChkX2NvbmZpZy0+Yl9pbmZvLmRl
dmljZV9tb2RlbF9zdHViZG9tYWluKSkKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxf
dHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCj4gaW5kZXggYjY4NWFjNDdh
Yy4uOWEwYjkyZjFkNCAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwK
PiArKysgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiBAQCAtNTgzLDYgKzU4Myw3IEBA
IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvID0gU3RydWN0KCJkb21haW5fYnVpbGRfaW5mbyIsWwo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIC0gInRhYmxldCIgZm9y
IGFic29sdXRlIG1vdXNlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAjIC0gIm1vdXNlIiBmb3IgUFMvMiBwcm90b2NvbCByZWxhdGl2ZSBtb3VzZQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoInVzYmRldmljZSIsICAgICAgICBzdHJp
bmcpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoInZrYl9kZXZp
Y2UiLCAgICAgICBsaWJ4bF9kZWZib29sKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKCJzb3VuZGh3IiwgICAgICAgICAgc3RyaW5nKSwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKCJ4ZW5fcGxhdGZvcm1fcGNpIiwgbGlieGxfZGVm
Ym9vbCksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgidXNiZGV2
aWNlX2xpc3QiLCAgIGxpYnhsX3N0cmluZ19saXN0KSwKPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGwv
eGxfcGFyc2UuYyBiL3Rvb2xzL3hsL3hsX3BhcnNlLmMKPiBpbmRleCAzNTJjZDIxNGRkLi5lMTA1
YmRhMmJiIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMKPiArKysgYi90b29scy94
bC94bF9wYXJzZS5jCj4gQEAgLTI2NTIsNiArMjY1Miw3IEBAIHNraXBfdXNiZGV2Ogo+ICAgICAg
ICAgICAgICBmcHJpbnRmKHN0ZGVyciwieGw6IFVuYWJsZSB0byBwYXJzZSB1c2JkZXZpY2UuXG4i
KTsKPiAgICAgICAgICAgICAgZXhpdCgtRVJST1JfRkFJTCk7Cj4gICAgICAgICAgfQo+ICsgICAg
ICAgIHhsdV9jZmdfZ2V0X2RlZmJvb2woY29uZmlnLCAidmtiX2RldmljZSIsICZiX2luZm8tPnUu
aHZtLnZrYl9kZXZpY2UsIDApOwo+ICAgICAgICAgIHhsdV9jZmdfcmVwbGFjZV9zdHJpbmcgKGNv
bmZpZywgInNvdW5kaHciLCAmYl9pbmZvLT51Lmh2bS5zb3VuZGh3LCAwKTsKPiAgICAgICAgICB4
bHVfY2ZnX2dldF9kZWZib29sKGNvbmZpZywgInhlbl9wbGF0Zm9ybV9wY2kiLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJmJfaW5mby0+dS5odm0ueGVuX3BsYXRmb3JtX3BjaSwgMCk7
CgpPaCBoZXJlIGl0IGlzIHRoZSBjb2RlIHdoaWNoIHVzZXMgdGhlIG5ldyBmaWVsZCAtLSBpbiB0
aGF0IGNhc2UsIHlvdQphbHNvIG5lZWQgdG8gZG9jdW1lbnQgdGhpcyBpbiB4bCBtYW5wYWdlLgoK
VGhlIG1hbnBhZ2UgaXMgZG9jcy9tYW4veGwuY29uZi5wb2QuNS4KClNvcnJ5IGZvciBub3QgaGF2
aW5nIG1lbnRpb25lZCB0aGlzIGVhcmxpZXI6IHdlIGFsc28gYXNrIGZvciBhbgphY2NvbXBhbnlp
bmcgbWFjcm8gZm9yIHRoZSBuZXcgZmllbGQgaW4gdGhlIHB1YmxpYyBpbnRlcmZhY2UuIFNlZQp2
YXJpb3VzIExJQlhMX0hBVkUgbWFjcm9zIGluIGxpYnhsLmguCgpMZXQgbWUga25vdyBpZiB5b3Ug
aGF2ZSBmdXJ0aGVyIHF1ZXN0aW9ucy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
