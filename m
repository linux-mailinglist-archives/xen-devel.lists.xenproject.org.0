Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511B7F068
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:25:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTmG-0007PL-Or; Fri, 02 Aug 2019 09:23:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F6th=V6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1htTmF-0007PC-2c
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:23:07 +0000
X-Inumbo-ID: 21498525-b507-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 21498525-b507-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 09:23:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A113AF54;
 Fri,  2 Aug 2019 09:23:03 +0000 (UTC)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
 <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
 <de9f1e4a-7923-40f8-9c3b-fab912aa250b@arm.com>
 <6aa7726a-5dc2-c901-2700-34bbc2726879@suse.com>
 <CAOcoXZY-0Bru-evWJtVMZ4LB0w1xx0EqD5M8ZDHw+EZUopEr6Q@mail.gmail.com>
 <be9cc69b-41cc-6725-b205-aafa31bdc39c@suse.com>
 <CAOcoXZb8SYbLryapgNmnL3w7oAkyJZtdzM0jRgsvMA=5qtysNQ@mail.gmail.com>
 <d85e76b5-0a68-af0a-375c-7f3844e6e21f@suse.com>
 <CAOcoXZYeV6oXXj4qJRH5pLC8JgM-nghna_JESYBWrO_j4PPL5Q@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <dcee6c93-df93-3118-1c13-75dfcc001965@suse.com>
Date: Fri, 2 Aug 2019 11:23:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZYeV6oXXj4qJRH5pLC8JgM-nghna_JESYBWrO_j4PPL5Q@mail.gmail.com>
Content-Language: de-DE
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
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMTkgMTA6MzgsIFZpa3RvciBNaXRpbiB3cm90ZToKPiBPbiBUaHUsIEF1ZyAxLCAy
MDE5IGF0IDM6NTAgUE0gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4K
Pj4gT24gMDEuMDguMTkgMTQ6MTYsIFZpa3RvciBNaXRpbiB3cm90ZToKPj4+IE9uIFRodSwgQXVn
IDEsIDIwMTkgYXQgMTA6NDAgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4+Pgo+Pj4+IE9uIDMxLjA3LjIwMTkgMTg6MjAsIFZpa3RvciBNaXRpbiB3cm90ZToKPj4+
Pj4gSG93IGFsbCB0aG9zZSBwcm9qZWN0cyBsaXZlIHdpdGhvdXQgdGhpcyBpc3N1ZT8KPj4+Pgo+
Pj4+IFBlcmhhcHMgdGhleSBkb24ndCBjYXJlPyBJIGRvLgo+Pj4+Cj4+Pj4+IFdoYXQgaXMgdGhl
IHJlYXNvbiBub3QgdG8gZml4ICdkaWZmIC1wJz8gSXMgaXQgbm90IHBvc3NpYmxlIGF0IGFsbD8K
Pj4+Pgo+Pj4+IEkgaGF2ZSBubyBpZGVhLCBidXQgSSBndWVzcyB0aGVyZSdzIGEgcmVhc29uIGZv
ciBpdHMgY3VycmVudAo+Pj4+IGJlaGF2aW9yLgo+Pj4KPj4+IEphbiwgaXQgc2VlbXMgaXQgaXMg
bm90IGEgZ29vZCBpZGVhIHRvIG1vZGlmeSB0aGUgWGVuIGNvZGluZyBzdHlsZQo+Pj4gd2l0aG91
dCBpbnZlc3RpZ2F0aW9uIG9mIHRoZSBpc3N1ZSBmaXJzdC4gSXQgdGFrZXMgc29tZSBlZmZvcnQg
dG8KPj4+IGF1dG9tYXRlIGV2ZXJ5IHN1Y2ggKG9yIHNpbWlsYXIpIGV4Y2VwdGlvbmFsIGNvZGUg
Zm9ybWF0dGluZyBjYXNlLiBTbwo+Pj4gaXQgbG9va3Mgd2UgY291bGQgZmluZCBhIGJldHRlciBv
cHRpb24sIHRoYW4ganVzdCBhZGRpbmcgb25lIG1vcmUKPj4+IGV4Y2VwdGlvbiB0byBYZW4gY29k
aW5nIHN0eWxlLCBhdCBsZWFzdCB3b3J0aCB0byBpbnZlc3RpZ2F0ZSBpdCBmaXJzdC4KPj4+Cj4+
Pj4+IENvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgbW9yZSBkZXRhaWxzIGFib3V0IHRoZSBiYWNrZ3Jv
dW5kIG9mIHRoZSBpc3N1ZQo+Pj4+PiBhbmQgZXhhbXBsZXM/Cj4+Pj4KPj4+PiBXaGF0IChmdXJ0
aGVyKSBiYWNrZ3JvdW5kIGFuZCB3aGF0IGtpbmQgb2YgZXhhbXBsZXMgYXJlIHlvdSBhZnRlcj8K
Pj4+Cj4+PiBJIGV4cGVjdGVkIHlvdSB0byBoYXZlIHNvbWUgYXJndW1lbnRzIHdoeSBpdCBjYW5u
b3QgYmUgZml4ZWQgaW4gdGhlCj4+PiBkaWZmIG9yIG90aGVyIHRvb2xzLgo+Pgo+PiBDaGFuZ2lu
ZyBkaWZmIHVwc3RyZWFtIG1pZ2h0IGJlIHBvc3NpYmxlLiBDaGFuZ2luZyB0b2RheSdzIGluY2Fy
bmF0aW9ucwo+PiBpbiBhbGwgZGlzdHJvcyBvdXQgaW4gdGhlIHdpbGQgaXMgYmFyZWx5IGRvYWJs
ZS4KPj4KPj4gQW5vdGhlciBxdWVzdGlvbiBpcyB3aGV0aGVyIHdlIHJlYWxseSB3YW50IGRpZmYg
dG8gYmUgY2hhbmdlZC4gVGhlCj4+IGN1cnJlbnQgYmVoYXZpb3IgaXMgZmluZSBmb3IgYXNzZW1i
bHkgc291cmNlcyBmb3IgZXhhbXBsZS4gQSBjaGFuZ2VkCj4+IGRpZmYgd291bGQgbm8gbG9uZ2Vy
IHByZXNlbnQgdGhlIGxhc3QgbGFiZWwgZm9yIGNvbnRleHQuCj4+Cj4+PiBUaGUgZXhhbXBsZXMg
SSBtZWFudCBhcmUgYW55IHJlYWwgcGF0Y2hlcyBjb2RlIGV4YW1wbGVzIHRvIGJlIHVzZWQgZm9y
Cj4+PiB0aGlzIGludmVzdGlnYXRpb24uCj4+Cj4+IEEgc25pcHBsZXQgZnJvbSBjb21taXQgNTdm
OGIxM2M3MjQwMjNjNzhmYTE1YTgwNDUyZDFkZTNlNTFhMTQxODoKPj4KPj4gQEAgLTQwOTYsMTQg
KzQwOTcsMTIgQEAgcmV0cnlfdHJhbnNhY3Rpb246Cj4+ICAgICAgICAgICAgZ290byBvdXQ7Cj4+
Cj4+ICAgICAgICBpZiAodGFyZ2V0ID09IE5VTEwpIHsKPj4gLSAgICAgICAgbGlieGxfX3hzX3By
aW50ZihnYywgdCwgdGFyZ2V0X3BhdGgsICIlIlBSSXUzMiwKPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAodWludDMyX3QpIGluZm8uY3VycmVudF9tZW1rYik7Cj4+IC0gICAgICAgICp0YXJn
ZXRfbWVta2IgPSAodWludDMyX3QpIGluZm8uY3VycmVudF9tZW1rYjsKPj4gKyAgICAgICAgbGli
eGxfX3hzX3ByaW50ZihnYywgdCwgdGFyZ2V0X3BhdGgsICIlIlBSSXU2NCwKPj4gaW5mby5jdXJy
ZW50X21lbWtiKTsKPj4gKyAgICAgICAgKnRhcmdldF9tZW1rYiA9IGluZm8uY3VycmVudF9tZW1r
YjsKPj4gICAgICAgIH0KPj4gICAgICAgIGlmIChzdGF0aWNtYXggPT0gTlVMTCkgewo+PiAtICAg
ICAgICBsaWJ4bF9feHNfcHJpbnRmKGdjLCB0LCBtYXhfcGF0aCwgIiUiUFJJdTMyLAo+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICh1aW50MzJfdCkgaW5mby5tYXhfbWVta2IpOwo+PiAtICAg
ICAgICAqbWF4X21lbWtiID0gKHVpbnQzMl90KSBpbmZvLm1heF9tZW1rYjsKPj4gKyAgICAgICAg
bGlieGxfX3hzX3ByaW50ZihnYywgdCwgbWF4X3BhdGgsICIlIlBSSXU2NCwgaW5mby5tYXhfbWVt
a2IpOwo+PiArICAgICAgICAqbWF4X21lbWtiID0gaW5mby5tYXhfbWVta2I7Cj4+ICAgICAgICB9
Cj4+Cj4+ICAgICAgICByYyA9IDA7Cj4+Cj4gCj4gSSd2ZSBidWlsZCBnbnUgZGlmZnV0aWxzIGxh
dGVzdCByZWxlYXNlIDMuNyBhbmQgY2hlY2tlZCB0aGUgY29kZSBhbmQKPiB0aGUgaXNzdWUuIEl0
IHNlZW1zIHRoaXMgZmVhdHVyZSAoLXApIGRvZXNuJ3Qgd29yayBwcm9wZXJseSBhbmQgaGFzCj4g
bWFueSBtb3JlIGJ1Z3MgdGhhbiBqdXN0IHRoZSBpc3N1ZSB3aXRoIGxhYmVscy4gU2VlIHRoZSBl
eGFtcGxlIGJlbG93LAo+IHRoZSBjaGFuZ2UgaGFzIGJlZW4gbWFkZSBpbiB0aGUgZnVuY3Rpb24g
YTEoKSwgaG93ZXZlciwgaW4gdGhlIGRpZmYKPiBhbm90aGVyIGZ1bmN0aW9uIGlzIHNob3duIGEo
KS4KClRoaXMgY2FzZSBpcyBjb21wbGV0ZWx5IGZpbmUsIGFzIHRoZSBjb250ZXh0IG9mIHRoZSBk
aWZmIGlzIHN0YXJ0aW5nCmJlZm9yZSB0aGUgZGVmaW5pdGlvbiBvZiBhKCkgKGFuZCBqdXN0IGFm
dGVyIGExKCkpLiBUaGlzIGlzIGltcG9ydGFudCBpbgpjYXNlIHlvdSBvbmx5IGFkZCBhIG5ldyBm
dW5jdGlvbiBmb3IgZXhhbXBsZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
