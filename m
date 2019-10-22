Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F1E0B51
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 20:18:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMyg5-00051L-8w; Tue, 22 Oct 2019 18:14:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wjmx=YP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iMyg3-00051D-An
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 18:14:39 +0000
X-Inumbo-ID: ce296b92-f4f7-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ce296b92-f4f7-11e9-beca-bc764e2007e4;
 Tue, 22 Oct 2019 18:14:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39A751650;
 Tue, 22 Oct 2019 11:14:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FA603F718;
 Tue, 22 Oct 2019 11:14:34 -0700 (PDT)
To: Oleksandr Grytsov <al1img@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
References: <20191010135004.24226-1-al1img@gmail.com>
 <23968.40023.163583.784817@mariner.uk.xensource.com>
 <049b184d-530f-5a02-8d85-83cdd2b2c266@arm.com>
 <CACvf2oVN0ga1UfyCHMdqej9++UfVM9LdUu13rsqUPGRhdbsmaA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ac6277ad-fe2d-188a-1f72-3635016ebf0d@arm.com>
Date: Tue, 22 Oct 2019 19:14:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACvf2oVN0ga1UfyCHMdqej9++UfVM9LdUu13rsqUPGRhdbsmaA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v1] Reset iomem's gfn to
 LIBXL_INVALID_GFN on reboot
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
Cc: Matthew Fioravante <matthew.fioravante@jhuapl.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "wl@xen.org" <wl@xen.org>, Arianna Avanzini <avanzini.arianna@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKQXBvbG9naWVzIGZvciB0aGUgbGF0ZSBhbnN3ZXIuCgpPbiAxNi8xMC8y
MDE5IDE0OjA5LCBPbGVrc2FuZHIgR3J5dHNvdiB3cm90ZToKPiBPbiBNb24sIE9jdCAxNCwgMjAx
OSBhdCAxMjoyOCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToK
PiBUaGFua3MgdG8gcG9pbnQgbWUgb3V0IGZvciB0aGlzIG9sZCB0aHJlYWQuIEkgY29tcGxldGVs
eSBmb3Jnb3QgYWJvdXQgaXQKPiAoSSBoYXZlbid0IHdvcmtlZCB3aXRoIHhlbiBzaW5jZSBsb25n
IHRpbWUpLiBJJ3ZlIHBlcmZvcm1lZCBhZGRpdGlvbmFsCj4gaW52ZXN0aWdhdGlvbgo+IGFuZCBm
b3VuZCB0aGUgcm9vdCBjYXVzZSBvZiB0aGUgaXNzdWUuIEl0IGRvZXNuJ3QgcmVsYXRlIHRvIGlv
bWVtIEdGTiBkaXJlY3RseS4KPiBUaGUgcHJvYmxlbSBpcyBpbiB0eXBlIGZyb20ganNvbiBwYXJz
aW5nIGF0IHBsYWNlIHdoZXJlIGxpYnhsIGNyZWF0ZXMgYXJyYXkgb2YKPiBzdHJ1Y3QuCj4gCj4g
Rm9yIGV4YW1wbGUsIGxpYnhsX2RvbWFpbl9jb25maWdfZnJvbV9qc29uIGNhbGxzIGxpYnhsX2Rv
bWFpbl9jb25maWdfaW5pdAo+IHdoaWNoIGluaXRpYWxpemVzIGFsbCBjaGlsZCBzdHJ1Y3R1cmVz
IGFuZCBhcnJheXMuIEJ1dCB0aGVuIHdoZW4gbGlieGwgcGFyc2VzCj4ganNvbiBhbmQgY3JlYXRl
cyB0aGUgYXJyYXkgb2Ygc3RydWN0dXJlLCBpdCBkb2Vzbid0IGluaXRpYWxpemUgYXJyYXkgZWxl
bWVudHMKPiBwcm9wZXJseSAoc2VlIGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19wYXJzZV9qc29u
IGlvbWVtIHBhcnNpbmcpOgo+IAo+IHAtPm51bV9pb21lbSA9IHgtPnUuYXJyYXktPmNvdW50Owo+
IHAtPmlvbWVtID0gbGlieGxfX2NhbGxvYyhOT0dDLCBwLT5udW1faW9tZW0sIHNpemVvZigqcC0+
aW9tZW0pKTsKPiBpZiAoIXAtPmlvbWVtICYmIHAtPm51bV9pb21lbSAhPSAwKSB7Cj4gICAgICBy
YyA9IC0xOwo+ICAgICAgZ290byBvdXQ7Cj4gfQo+IGZvciAoaT0wOyAodD1saWJ4bF9fanNvbl9h
cnJheV9nZXQoeCxpKSk7IGkrKykgewo+ICAgICAgcmMgPSBsaWJ4bF9faW9tZW1fcmFuZ2VfcGFy
c2VfanNvbihnYywgdCwgJnAtPmlvbWVtW2ldKTsKPiAgICAgIGlmIChyYykKPiAgICAgICAgIGdv
dG8gb3V0Owo+IH0KPiAKPiBsaWJ4bCBjcmVhdGVzIGFycmF5IGVsZW1lbnQgd2l0aCBjYWxsb2Mg
ZnVuY3Rpb24sIHNvIGFsbCBlbGVtZW50Cj4gZmllbGRzIGFyZSBpbml0aWFsaXplZAo+IHdpdGgg
emVybyB2YWx1ZXMuIEV2ZW4gc29tZSBvZiB0aGVtIGhhdmUgZGVmYXVsdCB2YWx1ZSBkaWZmZXJl
bnQgZnJvbSB6ZXJvLgo+IEZvciB0aGVzZSBwdXJwb3NlIGRlZGljYXRlZCBpbml0IGZ1bmN0aW9u
IHNob3VsZCBiZSBjYWxsZWQgZm9yIGVhY2ggZWxlbWVudC4KPiBBYm92ZSBleGFtcGxlIHNob3Vs
ZCBiZToKPiAKPiBmb3IgKGk9MDsgKHQ9bGlieGxfX2pzb25fYXJyYXlfZ2V0KHgsaSkpOyBpKysp
IHsKPiAgICAgIGxpYnhsX2lvbWVtX3JhbmdlX2luaXQoJnAtPmlvbWVtW2ldKTsKPiAgICAgIHJj
ID0gbGlieGxfX2lvbWVtX3JhbmdlX3BhcnNlX2pzb24oZ2MsIHQsICZwLT5pb21lbVtpXSk7Cj4g
ICAgICBpZiAocmMpCj4gICAgICAgICBnb3RvIG91dDsKPiB9CgpOb3QgaW5pdGlhbGl6aW5nIHRo
ZSB2YWx1ZXMgaXMgZmluZSBhcyBsb25nIGFzIHRoZSBKU09OIGRlc2NyaWJlcyBhbGwgdGhlIGZp
ZWxkcyAKb2YgdGhlIHN0cnVjdHVyZS4KClRoZSBrZXkgcG9pbnQgaGVyZSBpcyB0aGUgR0ZOIGlz
IG5vdCBkZXNjcmliZWQgaW4gdGhlIEpTT04gKHNlZSAKbGlieGxfaW9tZW1fcmFuZ2VfZ2VuX2pz
b24pIGlmIGl0IGlzIGVxdWFsIHRvIExJQlhMX0lOVkFMSURfR0ZOLiBBcyB0aGUgZmllbGQgaXMg
Cm5vdCBkZXNjcmliZWQsIGl0IHdpbGwgYmUgZGVmYXVsdGVkIHRvIDAuCgo+IAo+IEkndmUgY2hh
bmdlcyBnZW50eXBlcy5weSBhcyBmb2xsb3dpbmc6Cj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2dlbnR5cGVzLnB5IGIvdG9vbHMvbGlieGwvZ2VudHlwZXMucHkKPiBpbmRleCA4OGU1YzVm
MzBlLi45MmUyOGJlNDY5IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5Cj4g
KysrIGIvdG9vbHMvbGlieGwvZ2VudHlwZXMucHkKPiBAQCAtNDU0LDYgKzQ1NCw4IEBAIGRlZiBs
aWJ4bF9DX3R5cGVfcGFyc2VfanNvbih0eSwgdywgdiwgaW5kZW50ID0gIgo+ICAgIiwgcGFyZW50
ID0gTm9uZSwgZGlzY3JpbWluYQo+ICAgICAgICAgICBzICs9ICIgICAgICAgIGdvdG8gb3V0O1xu
Igo+ICAgICAgICAgICBzICs9ICIgICAgfVxuIgo+ICAgICAgICAgICBzICs9ICIgICAgZm9yIChp
PTA7ICh0PWxpYnhsX19qc29uX2FycmF5X2dldCh4LGkpKTsgaSsrKSB7XG4iCj4gKyAgICAgICAg
aWYgdHkuZWxlbV90eXBlLmluaXRfZm4gaXMgbm90IE5vbmUgYW5kCj4gdHkuZWxlbV90eXBlLmF1
dG9nZW5lcmF0ZV9pbml0X2ZuOgoKTXkga25vd2xlZGdlIG9mIGxpYnhsIGlzIHF1aXRlIGxpbWl0
ZWQuIEJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgaXMgY29ycmVjdCwgeW91IAp3YW50IHRvIGNhbGwg
aW5pdF9mbiB3aGV0aGVyIHRoaXMgaGFzIGJlZW4gYXV0b2dlbmVyYXRlZCBvciBub3QuCgo+ICsg
ICAgICAgICAgICBzICs9IGluZGVudCArICIgICAgIisiJXNfaW5pdCgmJXNbaV0pO1xuIiAlCj4g
KHR5LmVsZW1fdHlwZS50eXBlbmFtZSwgdikKCkxvb2tpbmcgYXQgdGhlIG90aGVyIHVzYWdlIChs
aWtlIF9saWJ4bF9DX3R5cGVfaW5pdCksIGluaXRfZm4gaXMgY2FsbGVkIHdpdGgKCiAgICAgICAg
ICAgICBzICs9ICIlcyglcyk7XG4iICUgKHR5LmluaXRfZm4sIHR5LnBhc3NfYXJnKHYsIHBhcmVu
dCBpcyBOb25lKSkKCkkgYW0gYWxzbyBub3QgZW50aXJlbHkgc3VyZSB3aGV0aGVyIHdlIHNob3Vs
ZCBhbHNvIGNhdGVyIHRoZSB0eS5pbml0X3ZhbCAhPSBOb25lIAphcyB3ZWxsIGhlcmUuCgo+ICAg
ICAgICAgICBzICs9IGxpYnhsX0NfdHlwZV9wYXJzZV9qc29uKHR5LmVsZW1fdHlwZSwgInQiLCB2
KyJbaV0iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZGVudCAr
ICIgICAgIiwgcGFyZW50KQo+ICAgICAgICAgICBzICs9ICIgICAgfVxuIgo+IAo+IEknbSBub3Qg
c3VyZSBpcyBpdCByaWdodCBhbmQgY29tcGxldGUgZml4Lgo+IAo+IElhbiwgY291bGQgeW91IHJl
dmlldz8KPiAKPiBJZiB0aGUgZml4IGlzIG9rLCBJIHdpbGwgc3VibWl0IHRoZSBwYXRjaC4KCklI
TU8sIHRoZSBpZGVhIGlzIHRoZXJlLiBUaGUgY29kZSBtYXkgbmVlZCBzb21lIG1vZGlmaWNhdGlv
bnMgKHNlZSBhYm92ZSkuIApQbGVhc2UgcG9zdCBhIHBhdGNoIHNvIHdlIGNhbiBnbyBmb3J3YXJk
IGluIHRoZSBwcm9jZXNzIHRvIHJldmlldyBpdC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
