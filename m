Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089D6D145
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:44:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho8YA-0005RG-Ta; Thu, 18 Jul 2019 15:42:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8c6=VP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ho8Y9-0005RB-2f
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:42:29 +0000
X-Inumbo-ID: a5551fa3-a972-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a5551fa3-a972-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 15:42:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49CA8344;
 Thu, 18 Jul 2019 08:42:27 -0700 (PDT)
Received: from [10.37.10.69] (unknown [10.37.10.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CB263F71F;
 Thu, 18 Jul 2019 08:42:24 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
Date: Thu, 18 Jul 2019 16:42:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiA3LzE4LzE5IDQ6MTQgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBP
biBUaHUsIEp1bCAxOCwgMjAxOSBhdCA5OjAyIEFNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBUYW1hcywKPj4KPj4gQWRkaW5nIExhcnMsIEFydGVt
IGFuZCBJdXJpaS4gSXVyaWkgaGFzIGJlZW4gd29ya2luZyBvbiBhIHZlcnNpb24gZm9yCj4+IGNs
YW5nLWZvcm1hdCByZWNlbnRseS4KPj4KPj4gT24gNy8xOC8xOSAzOjQzIFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4+PiBVc2luZyBhc3R5bGUgKGh0dHA6Ly9hc3R5bGUuc291cmNlZm9yZ2Uu
bmV0KSBjYW4gZ3JlYXRseSByZWR1Y2UgdGhlIG92ZXJoZWFkIG9mCj4+PiBtYW51YWxseSBjaGVj
a2luZyBhbmQgYXBwbHlpbmcgc3R5bGUtZml4ZXMgdG8gc291cmNlLWNvZGUuIFRoZSBpbmNsdWRl
ZAo+Pj4gLmFzdHlsZXJjIGlzIHRoZSBjbG9zZXN0IGFwcHJveGltYXRpb24gb2YgdGhlIGVzdGFi
bGlzaGVkIFhlbiBzdHlsZSAoaW5jbHVkaW5nCj4+PiBzdHlsZXMgbm90IGZvcm1hbGx5IHNwZWxs
ZWQgb3V0IGJ5IENPRElOR19TVFlMRSBidXQgY29tbW9ubHkgcmVxdWVzdGVkKS4KPj4+Cj4+PiBD
aGVja2luZyB0aGUgY29tbWVudCBzdHlsZXMgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGUgYXV0b21h
dGlvbi4KPj4+Cj4+PiBJbmNvcnBvcmF0aW5nIFhlbidzIGV4Y2VwdGlvbiB0byB0aGUgZG8td2hp
bGUgc3R5bGUgaXMgb25seSBwYXJ0aWFsbHkgcG9zc2libGUsCj4+PiB0aHVzIGEgY2hhbmdlIGlz
IHByb3Bvc2VkIHRvIHRoZSBDT0RJTkdfU1RZTEUgb2YgbW92aW5nIHRoZSBicmFjZSBmcm9tICJk
byB7Igo+Pj4gdG8gdGhlIG5leHQgbGluZS4KPj4+Cj4+PiBNb3N0IG9mIFhlbidzIGNvZGUtYmFz
ZSBpcyBub24tY29uZm9ybWluZyBhdCB0aGUgbW9tZW50OiAyODkgZmlsZXMgcGFzcwo+Pj4gdW5j
aGFuZ2VkLCA4NzYgaGF2ZSBzb21lIHN0eWxlIGlzc3VlCj4+Pgo+Pj4gSWRlYWxseSB3ZSBjYW4g
c2xvd2x5IG1pZ3JhdGUgdGhlIGVudGlyZSBjb2RlLWJhc2UgdG8gYmUgY29uZm9ybWluZywgdGh1
cwo+Pj4gZWxpbWluYXRpbmcgdGhlIG5lZWQgb2YgZGlzY3Vzc2luZyBhbmQgZW5mb3JjaW5nIHN0
eWxlIGlzc3VlcyBtYW51YWxseSBvbiB0aGUKPj4+IG1haWxpbmdsaXN0Lgo+Pgo+PiBJIHF1aXRl
IGxpa2UgdGhlIGlkZWEgb2YgYW4gYXV0b21hdGljIGNvZGluZyBzdHlsZSBjaGVja2VyLiBIb3dl
dmVyLCBpdAo+PiBpcyBhIGJpdCBjb25jZXJuaW5nIHRoYXQgbm90IGV2ZW4gYSAxLzMgb2YgdGhl
IGZpbGVzIGFyZSBhYmxlIHRvIHBhc3MKPj4gdGhlIGNvZGluZyBzdHlsZSB5b3Ugc3VnZ2VzdC4g
Q291bGQgeW91IGV4cGxhaW4gd2hldGhlciB0aGlzIGlzIGJlY2F1c2UKPj4gdGhlIGZpbGVzIGRv
ZXMgbm90IGFscmVhZHkgZm9sbG93IFhlbiBjb2Rpbmcgc3R5bGUgb3IgaXMgaXQganVzdCB0aGUK
Pj4gZGlmZmVyZW5jZSB3aXRoIGFzdHlsZT8KPj4KPj4gV2hhdCBhcmUgdGhlIG1haW4gc3R5bGUg
aXNzdWVzPwo+IAo+IExvb2tzIGxpa2UgYSBsb3Qgb2YgZmlsZXMgdGhhdCBkb24ndCBmb2xsb3cg
dGhlIFhlbiBjb2Rpbmcgc3R5bGUKPiBhcy1pcy4gQWxpZ25tZW50IGlzc3VlcyBzZWVtIHRvIG1l
IHRvIGJlIHRoZSBtb3N0IGNvbW1vbiBlcnJvcnMuIFNlZQo+IHRoZSBmdWxsIGRpZmYgaGVyZToK
PiAKPiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS90a2xlbmd5ZWwvYzVjYWMxNGEwZDU3ZjExOWRk
Nzc0N2ExYmU2ZmIyNjAKPiAKPiBXZSBjYW4gcGVyaGFwcyB0dW5lIHNvbWUgYXNwZWN0cyBvZiBp
dCB3ZSBkaXNhZ3JlZSB3aXRoIHRoZSBhc3R5bGUKPiBnZW5lcmF0ZWQgc3R5bGUgYW5kIHRyeSB0
byBvdmVycmlkZSBpdC4gSSBkaWQgbXkgYmVzdCB0byBtYWtlIGl0Cj4gY29uZm9ybSB0byB0aGUg
ZXhpc3RpbmcgWGVuIHN0eWxlIGJ1dCBjZXJ0YWlubHkgdGhlcmUgY291bGQgYmUgb3RoZXIKPiB0
d2Vha3MgbWFkZSB0byByZWR1Y2UgdGhlIGNodXJuLgoKSSB0aGluayB3ZSBkZWZpbml0ZWx5IHdh
bnQgdG8gYXZvaWQgY2h1cm4gYXMgdGhpcyBpcyBnb2luZyB0byB0YWtlIGEgbG90IApvZiB0aW1l
IHRvIGZpeCBhbGwgdGhlIHBsYWNlcyB0byB0aGUgbmV3IGluZGVudGF0aW9uLgoKR29pbmcgdGhy
b3VnaCB0aGUgZGlmZiBJIGNhbiBzZWUgbWFqb3IgZGlmZmVyZW5jZXMgd2l0aCB0aGUgWGVuIENv
ZGluZyAKc3R5bGUgYW5kIGFsc28gd2hhdCBsb29rcyBsaWtlIGluY29uc2lzdGVuY2llcyBmcm9t
IHRoZSB0b29scyBpdHNlbGY6CiAgIC0gTGluZSA1ODogVGhpcyBpcyBmYWlybHkgY29tbW9uIHRv
IGluZGVudCB0aGUgcGFyYW1ldGVycyBhcyBpdCBpcyAKdG9kYXkuIEJ1dCB0aGVuIG9uIGxpbmUg
MTU4LzI3MiBpdCBpbmRlbnRzIGFzIHdlIGRvIHRvZGF5LiBTbyBJIGFtIG5vdCAKc3VyZSB3aGF0
IHRoZSBleHBlY3RlZCBjb2Rpbmcgc3R5bGUgZnJvbSB0aGUgdG9vbHMuCiAgIC0gTGluZSA2Nzog
SSBiZWxpZXZlIEphbiByZXF1ZXN0IHRoZSBzcGFjZSBiZWZvcmUgbGFiZWwKICAgLSBMaW5lIDEz
OTogVGhlIHsgYXJlIGNvbW1vbmx5IG9uIHRoZSBzYW1lIGxpbmUgYXMgc3RydWN0IG9yIGRlZmlu
aXRpb24uCiAgIC0gTGluZSAyNzY6IFRoZSBzd2l0Y2ggY2FzZSBpbmRlbnRhdGlvbiB3YXMgY29y
cmVjdCBmcm9tIFhlbiBQb1YgYmVmb3JlCiAgIC0gTGluZSAyODk6IEZpbGVzIGltcG9ydGVkIGZy
b20gTGludXggc2hvdWxkIG5vdCBiZSB0b3VjaCBoZXJlLgogICAtIExpbmUgMTAyNTogVGhlIHRv
b2xzIG5lZWRzIHRvIGJlIGFibGUgdG8gZGVhbCBmb3JfZWFjaF92Y3B1KC4uLikgJiBjby4KICAg
LSBMaW5lIDg3MzU6IEl0IGxvb2tzIGxpa2UgdG8gbWUgdGhlIHRvb2xzIHBvbGljeSBpcyBxdWl0
ZSAKaW5jb25zaXN0ZW50LiBJbiBwcmV2aW91cyBwbGFjZSBpdCBrZWVwcyBpdCBwcm9wZXJseSBh
bGlnbmVkIHNlZSBsaW5lIDU3NzcuCgpJIGhhdmUgb25seSBsb29rZWQgcXVpY2tseSB0aHJvdWdo
IHRoZSBkaWZmLCBidXQgSSB0aGluayB0aGV5IGFyZSB0aGUgCm1haW4gb25lIHRoYXQgc2hvdWxk
IHByb2JhYmx5IGJlIHJlc29sdmVkLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
