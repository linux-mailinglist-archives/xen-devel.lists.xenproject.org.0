Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF919EB6
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:08:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP69v-0008N0-I8; Fri, 10 May 2019 14:05:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hP69u-0008Mv-Fo
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:05:58 +0000
X-Inumbo-ID: ba53c08e-732c-11e9-8980-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ba53c08e-732c-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 14:05:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,453,1549929600"; d="scan'208";a="89700586"
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
 <253e3a5c-8e84-a671-499c-7009d93658bb@arm.com>
 <5CD57F9F020000780022D936@prv1-mh.provo.novell.com>
 <9b8e78a4-db71-1b0d-a9c6-89a35e5feb2f@arm.com>
 <5CD58484020000780022D98E@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fae0871e-1ca9-890b-f782-562501782bcb@citrix.com>
Date: Fri, 10 May 2019 15:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD58484020000780022D98E@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDUvMjAxOSAxNTowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTAuMDUuMTkg
YXQgMTU6NDYsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDEwLzA1LzIwMTkg
MTQ6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTAuMDUuMTkgYXQgMTU6MzQsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMTAvMDUvMjAxOSAxNDoyMSwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0LCA8anVsaWVuLmdy
YWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+Pj4gQEAgLTEwMzAsMTkgKzEwMzEsMTkgQEAgbG9uZyBw
Mm1fcHRfYXVkaXRfcDJtKHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCj4+Pj4+PiBAQCAtMjc5NSw1
NCArMjc5NSw1NCBAQCB2b2lkIGF1ZGl0X3AybShzdHJ1Y3QgZG9tYWluICpkLAo+Pj4+Pj4gICAg
ICAgIHNwaW5fbG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsKPj4+Pj4+ICAgICAgICBwYWdlX2xp
c3RfZm9yX2VhY2ggKCBwYWdlLCAmZC0+cGFnZV9saXN0ICkKPj4+Pj4+ICAgICAgICB7Cj4+Pj4+
PiAtICAgICAgICBtZm4gPSBtZm5feChwYWdlX3RvX21mbihwYWdlKSk7Cj4+Pj4+PiArICAgICAg
ICBtZm4gPSBwYWdlX3RvX21mbihwYWdlKTsKPj4+Pj4+ICAgIAo+Pj4+Pj4gLSAgICAgICAgUDJN
X1BSSU5USygiYXVkaXRpbmcgZ3Vlc3QgcGFnZSwgbWZuPSUjbHhcbiIsIG1mbik7Cj4+Pj4+PiAr
ICAgICAgICBQMk1fUFJJTlRLKCJhdWRpdGluZyBndWVzdCBwYWdlLCBtZm49JSJQUklfbWZuIlxu
IiwgbWZuX3gobWZuKSk7Cj4+Pj4+PiAgICAKPj4+Pj4+ICAgICAgICAgICAgb2QgPSBwYWdlX2dl
dF9vd25lcihwYWdlKTsKPj4+Pj4+ICAgIAo+Pj4+Pj4gICAgICAgICAgICBpZiAoIG9kICE9IGQg
KQo+Pj4+Pj4gICAgICAgICAgICB7Cj4+Pj4+PiAtICAgICAgICAgICAgUDJNX1BSSU5USygid3Jv
bmcgb3duZXIgJSNseCAtPiAlcCgldSkgIT0gJXAoJXUpXG4iLAo+Pj4+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgbWZuLCBvZCwgKG9kP29kLT5kb21haW5faWQ6LTEpLCBkLCBkLT5kb21haW5f
aWQpOwo+Pj4+Pj4gKyAgICAgICAgICAgIFAyTV9QUklOVEsoIndyb25nIG93bmVyICUiUFJJX21m
biIgLT4gJXAoJXUpICE9ICVwKCV1KVxuIiwKPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IG1mbl94KG1mbiksIG9kLCAob2Q/b2QtPmRvbWFpbl9pZDotMSksIGQsIGQtPmRvbWFpbl9pZCk7
Cj4+Pj4+IFBsZWFzZSBiZSBjYXJlZnVsIG5vdCB0byBkcm9wIDB4IHByZWZpeGVzIGZyb20gdGhl
IHJlc3VsdGluZyBvdXRwdXQKPj4+Pj4gKHdoaWNoIGFyZSBhbiBlZmZlY3Qgb2YgdGhlICMgZmxh
ZyB0aGF0IHlvdSBkZWxldGUpLCBhdCBsZWFzdCB3aGVuCj4+Pj4+IGxvZyBtZXNzYWdlcyBjb250
YWluIGEgbWl4IG9mIGhleCBhbmQgZGVjIG51bWJlcnMuIChJIGFtLCBidHcsCj4+Pj4+IG5vdCBj
b252aW5jZWQgdGhhdCBzd2l0Y2hpbmcgdG8gUFJJX21mbiBoZXJlIGlzIGhlbHBmdWwuKQo+Pj4+
IExhc3QgdGltZSBJIGtlZXBlZCAlIyBmb3IgTUZOLCBJIGhhdmUgYmVlbiBhc2tlZCB0byByZW1v
dmUgdGhlICMuIEkgcHJlZmVyCj4+Pj4gaGF2aW5nIDB4IGZvciBhbGwgdGhlIGhleCwgYW5kIEkg
YW0gaGFwcHkgdG8gYmUga2VlcCBhcyBpcy4gQnV0IEkgd291bGQgbGlrZSBhCj4+Pj4gYml0IG9m
IGNvbnNpc3RlbmN5IG9uIHRoZSB3YXkgd2UgcHJpbnQgTUZOLi4uCj4+PiBXZWxsLCAiJSMiUFJJ
X21mbiBpcyBib2d1cyAoYmVjYXVzZSBvZiB0aGUgY29tYmluYXRpb24gd2l0aCB0aGUKPj4+IG1p
bmltdW0gd2lkdGggc3BlY2lmaWNhdGlvbiksIHNvIGl0IG91Z2h0IHRvIGJlICIlI2x4IiBvciAi
MHglIlBSSV9tZm4uCj4+PiBIYXZlIHlvdSByZWFsbHkgYmVlbiBhc2tlZCBmb3Igc29tZXRoaW5n
IGVsc2U/IElmIHNvLCBhbmQgaWYgaXQgd2FzIG1lLAo+Pj4gdGhlbiBJIGFwb2xvZ2l6ZS4KPj4g
SSBhbSBub3Qgc3VyZSB3aHkgdGhpcyBpcyBib2d1cy4gVGhlIHRoaW5nIGlzIHVzaW5nIGRpZmZl
cmVudCBmb3JtYXQgZm9yIHRoZSBNRk4gCj4+IG1ha2VzIGl0IGRpZmZpY3VsdCB0byByZWFkIGEg
bWVzc2FnZSB3aXRob3V0IGxvb2tpbmcgZm9ybWF0IHN0cmluZy4KPiBXZSBsb29rIHRvIGJlIGlu
IGFncmVlbWVudCB0aGF0IHRoZXJlIHNob3VsZCBiZSBhIDB4IHByZWZpeCBoZXJlLgo+IFdoYXQg
SSdtIGFza2luZyBmb3IgaXMgdG8gYXZvaWQgdGhlIHZhbHVlIGxvZ2dlZCB0byBkZS1nZW5lcmF0
ZSBpbnRvCj4gYSAzLWRpZ2l0IG9uZSAoMHg/Pz8pIHdoZW4gYSBmaXZlIGRpZ2l0IG9uZSBpcyBt
ZWFudCAoc2VlIFBSSV9tZm4pLgo+IE5vdCB0byBzcGVhayBvZiB0aGUgZnVydGhlciBpbmNvbnNp
c3RlbnQgc3RyaW5nIHRoYXQgd291bGQgYmUgbG9nZ2VkCj4gZm9yIE1GTiAwLgoKVGhlIG92ZXJ3
aGVsbWluZyBtYWpvcml0eSB3YXkgb2YgcHJpbnRpbmcgbWZucyBpcyB2aWE6CgptZm4gJSJQUklf
bWZuIgoKd2hpY2ggaXMgYWxtb3N0IGZ1bGx5IGNvbnNpc3RlbnQgYWNyb3NzIHRoZSB4ODYgY29k
ZS4KClZhcmlvdXMgYml0cyBvZiBjb21tb24gY29kZSwgYW5kIG1vc3Qgb2YgQVJNIGNvZGUgdXNl
IHZhcmlhdGlvbnMgb2YKJSMiUFJJX21mbiIsIGFuZCB0aGlzIG91Z2h0IHRvIGJlIGZpeGVkLgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
