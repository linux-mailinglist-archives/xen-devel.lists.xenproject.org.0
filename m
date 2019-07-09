Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A080D6357D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 14:18:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkp1f-0005O1-Cd; Tue, 09 Jul 2019 12:15:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DJix=VG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkp1d-0005Nw-Lu
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 12:15:13 +0000
X-Inumbo-ID: 3341f3fa-a243-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3341f3fa-a243-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 12:15:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B16982B;
 Tue,  9 Jul 2019 05:15:11 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6D283F59C;
 Tue,  9 Jul 2019 05:15:10 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190708123545.19406-1-viktor.mitin.19@gmail.com>
 <a621f734-56c6-b5d9-4926-b7e04c75a4b7@arm.com>
 <CAOcoXZYXwphVM97dwPqgabzoHy48hFTye-Sb5A37w0rdORaGxg@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e15fedc0-63f3-0e2c-4aeb-5a6cff95c9be@arm.com>
Date: Tue, 9 Jul 2019 13:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZYXwphVM97dwPqgabzoHy48hFTye-Sb5A37w0rdORaGxg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Improve Dom0-less documentation
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
Cc: Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzkvMTkgODoyMyBBTSwgVmlrdG9yIE1pdGluIHdyb3RlOgo+IE9uIE1vbiwgSnVs
IDgsIDIwMTkgYXQgNjo0NSBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3
cm90ZToKPj4KPj4gSGVsbG8sCj4gSGVsbG8gSnVsaWVuLAo+IAo+Pgo+PiBPbiA3LzgvMTkgMToz
NSBQTSwgVmlrdG9yIE1pdGluIHdyb3RlOgo+Pj4gVXBkYXRlZCBjb25maWd1cmF0aW9uIGV4YW1w
bGUgYWNjb3JkaW5nIHRvIGFybTY0Cj4+PiBhbmQgYWRkZWQgbW9yZSBjYXNlcyBhYm91dCBrbm93
biB4bCBsaW1pdGF0aW9ucy4KPj4KPj4gZG9tMGxlc3MgaXMgbm90IGFuIGFybTY0IHNwZWNpZmlj
IGZlYXR1cmUuIEl0IGFsc28gd29ya3Mgb24gYXJtMzIsIGFuZAo+PiB0aGVyZWZvcmUgdGhlIGRv
Y3Mgc2hvdWxkIHdvcmsgZm9yIGJvdGggY2FzZXMuIEhvd2V2ZXIuLi4KPj4KPiBUaGVyZSBpcyBv
bmUgaXNzdWUgd2l0aCBpdCwgcGxlYXNlIHNlZSBiZWxvdy4KPiAKPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KPj4+IC0tLQo+Pj4gICAg
ZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MgfCAyOSArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9j
IGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MKPj4+IGluZGV4IGUwNzZlMzczOWUuLjk2
MTgxMzY5NmYgMTAwNjQ0Cj4+PiAtLS0gYS9kb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBhbmRvYwo+
Pj4gKysrIGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MKPj4+IEBAIC02MiwxOSArNjIs
MTkgQEAgZGV2aWNlIHRyZWUgYWRkaW5nIGEgbm9kZSB1bmRlciAvY2hvc2VuIGFzIGZvbGxvd3M6
Cj4+Pgo+Pj4gICAgICAgIGRvbVUxIHsKPj4+ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4s
ZG9tYWluIjsKPj4+IC0gICAgICAgIG1lbW9yeSA9IDwweDIwMDAwPjsKPj4+ICsgICAgICAgIG1l
bW9yeSA9IDwweDAgMHgyMDAwMD47ID4gICAgICAgICAgIGNwdXMgPSAxOwo+Pj4gICAgICAgICAg
ICB2cGwwMTE7Cj4+Pgo+Pj4gICAgICAgICAgICBtb2R1bGVAMjAwMDAwMCB7Cj4+PiAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxrZXJuZWwiLCAibXVsdGlib290LG1vZHVs
ZSI7Cj4+PiAtICAgICAgICAgICAgcmVnID0gPDB4MjAwMDAwMCAweGZmZmZmZj47Cj4+PiArICAg
ICAgICAgICAgcmVnID0gPDB4MCAweDIwMDAwMDAgMHgwIDB4ZmZmZmZmPjsKPj4KPj4gLi4uIG5v
dGhpbmcgb24gYXJtNjQgaW1wb3NlICNhZGRyZXNzLWNlbGxzID0gMiBhbmQgI3NpemUtY2VsbHMg
PSAyLiBUaGUKPj4gcHJvYmxlbSBoZXJlIGlzIHRoZSB0d28gcHJvcGVydGllcyBhcmUgbWlzc2lu
ZyBpbiB0aGUgbm9kZSBkb21VMS4KPiAKPiBUaGUgbmV4dCBpc3N1ZSB3YXMgb2JzZXJ2ZWQgd2l0
aCBhcm02NCAoYXJtMzIgd2FzIG5vdCB0ZXN0ZWQpLgo+IFRoZSByZWcgcHJvcGVydGllcyBpbnNp
ZGUgJ21vZHVsZScgbm9kZXMgYXJlIG9rIGVpdGhlciB3aXRoIGFkZGl0aW9uYWwgJzB4MCcKPiBv
ciB3aXRoICNhZGRyZXNzLWNlbGxzID0gMiBhbmQgI3NpemUtY2VsbHMgPSAyLgo+IAo+IEhvd2V2
ZXIsIHRoZSAnbWVtb3J5JyBwcm9wZXJ0eSBkb2VzIG5vdCB3b3JrIHdpdGhvdXQgYWRkaXRpb25h
bCAnMHgwJwo+IGFuZCAjYWRkcmVzcy1jZWxscyA9IDIgYW5kICNzaXplLWNlbGxzID0gMiBkb24n
dCBhZmZlY3QgaXQuCj4gVGhlIG5leHQgY29kZSBmYWlscyB3aXRob3V0ICcweDAnLiBUaGlzIHdh
cyB0aGUgcmVhc29uIHdoeSBJIGFkZGVkICcweDAnCj4gYW5kIG5vdCAjYWRkcmVzcy1jZWxscyA9
IDIgYW5kICNzaXplLWNlbGxzID0gMi4gTm93IGl0IGlzIGNsZWFyIHRoYXQKPiB3ZSBuZWVkIHRv
IHVzZQo+ICNhZGRyZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscyBhbnl3YXksIGhvd2V2ZXIsIEkn
bSBub3Qgc3VyZSBhYm91dAo+IG1lbW9yeSBwcm9wZXJ0eS4KPiBTaG91bGQgaXQgYmUgd2l0aCBl
eHRyYSB6ZXJvIGFueXdheSBmb3IgYm90aCBjYXNlcyBhcm0zMiBhbmQgYXJtNjQ/Cj4gCj4gbWVt
b3J5ID0gPDB4MCAweDIwMDAwPjsKClBlciB0aGUgZG9jdW1lbnRhdGlvbiAoZG9jcy9taXNjL2Fy
bS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dCk6CgoiLSBtZW1vcnkKCkEgNjQtYml0IGludGVnZXIg
c3BlY2lmeWluZyB0aGUgYW1vdW50IG9mIGtpbG9ieXRlcyBvZiBSQU0gdG8KYWxsb2NhdGUgdG8g
dGhlIGd1ZXN0LgoiCgpTbyBtZW1vcnkgaXMgYWx3YXlzIGEgNjQtYml0IGludGVnZXIgYW5kIHRo
ZXJlZm9yZSBpcyBkZXNjcmliZWQgdXNpbmcgMiAKY2VsbHMuCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
