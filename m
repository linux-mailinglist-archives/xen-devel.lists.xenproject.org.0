Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4B7DBF7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 14:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htAX8-0006A4-VM; Thu, 01 Aug 2019 12:50:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6jP+=V5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1htAX7-00069w-O4
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 12:50:13 +0000
X-Inumbo-ID: e5264f3c-b45a-11e9-910e-270b95d6a9f5
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5264f3c-b45a-11e9-910e-270b95d6a9f5;
 Thu, 01 Aug 2019 12:50:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0719ADF1;
 Thu,  1 Aug 2019 12:50:08 +0000 (UTC)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Jan Beulich <JBeulich@suse.com>
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
From: Juergen Gross <jgross@suse.com>
Message-ID: <d85e76b5-0a68-af0a-375c-7f3844e6e21f@suse.com>
Date: Thu, 1 Aug 2019 14:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZb8SYbLryapgNmnL3w7oAkyJZtdzM0jRgsvMA=5qtysNQ@mail.gmail.com>
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

T24gMDEuMDguMTkgMTQ6MTYsIFZpa3RvciBNaXRpbiB3cm90ZToKPiBPbiBUaHUsIEF1ZyAxLCAy
MDE5IGF0IDEwOjQwIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+
Cj4+IE9uIDMxLjA3LjIwMTkgMTg6MjAsIFZpa3RvciBNaXRpbiB3cm90ZToKPj4+IEhvdyBhbGwg
dGhvc2UgcHJvamVjdHMgbGl2ZSB3aXRob3V0IHRoaXMgaXNzdWU/Cj4+Cj4+IFBlcmhhcHMgdGhl
eSBkb24ndCBjYXJlPyBJIGRvLgo+Pgo+Pj4gV2hhdCBpcyB0aGUgcmVhc29uIG5vdCB0byBmaXgg
J2RpZmYgLXAnPyBJcyBpdCBub3QgcG9zc2libGUgYXQgYWxsPwo+Pgo+PiBJIGhhdmUgbm8gaWRl
YSwgYnV0IEkgZ3Vlc3MgdGhlcmUncyBhIHJlYXNvbiBmb3IgaXRzIGN1cnJlbnQKPj4gYmVoYXZp
b3IuCj4gCj4gSmFuLCBpdCBzZWVtcyBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8gbW9kaWZ5IHRo
ZSBYZW4gY29kaW5nIHN0eWxlCj4gd2l0aG91dCBpbnZlc3RpZ2F0aW9uIG9mIHRoZSBpc3N1ZSBm
aXJzdC4gSXQgdGFrZXMgc29tZSBlZmZvcnQgdG8KPiBhdXRvbWF0ZSBldmVyeSBzdWNoIChvciBz
aW1pbGFyKSBleGNlcHRpb25hbCBjb2RlIGZvcm1hdHRpbmcgY2FzZS4gU28KPiBpdCBsb29rcyB3
ZSBjb3VsZCBmaW5kIGEgYmV0dGVyIG9wdGlvbiwgdGhhbiBqdXN0IGFkZGluZyBvbmUgbW9yZQo+
IGV4Y2VwdGlvbiB0byBYZW4gY29kaW5nIHN0eWxlLCBhdCBsZWFzdCB3b3J0aCB0byBpbnZlc3Rp
Z2F0ZSBpdCBmaXJzdC4KPiAKPj4+IENvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgbW9yZSBkZXRhaWxz
IGFib3V0IHRoZSBiYWNrZ3JvdW5kIG9mIHRoZSBpc3N1ZQo+Pj4gYW5kIGV4YW1wbGVzPwo+Pgo+
PiBXaGF0IChmdXJ0aGVyKSBiYWNrZ3JvdW5kIGFuZCB3aGF0IGtpbmQgb2YgZXhhbXBsZXMgYXJl
IHlvdSBhZnRlcj8KPiAKPiBJIGV4cGVjdGVkIHlvdSB0byBoYXZlIHNvbWUgYXJndW1lbnRzIHdo
eSBpdCBjYW5ub3QgYmUgZml4ZWQgaW4gdGhlCj4gZGlmZiBvciBvdGhlciB0b29scy4KCkNoYW5n
aW5nIGRpZmYgdXBzdHJlYW0gbWlnaHQgYmUgcG9zc2libGUuIENoYW5naW5nIHRvZGF5J3MgaW5j
YXJuYXRpb25zCmluIGFsbCBkaXN0cm9zIG91dCBpbiB0aGUgd2lsZCBpcyBiYXJlbHkgZG9hYmxl
LgoKQW5vdGhlciBxdWVzdGlvbiBpcyB3aGV0aGVyIHdlIHJlYWxseSB3YW50IGRpZmYgdG8gYmUg
Y2hhbmdlZC4gVGhlCmN1cnJlbnQgYmVoYXZpb3IgaXMgZmluZSBmb3IgYXNzZW1ibHkgc291cmNl
cyBmb3IgZXhhbXBsZS4gQSBjaGFuZ2VkCmRpZmYgd291bGQgbm8gbG9uZ2VyIHByZXNlbnQgdGhl
IGxhc3QgbGFiZWwgZm9yIGNvbnRleHQuCgo+IFRoZSBleGFtcGxlcyBJIG1lYW50IGFyZSBhbnkg
cmVhbCBwYXRjaGVzIGNvZGUgZXhhbXBsZXMgdG8gYmUgdXNlZCBmb3IKPiB0aGlzIGludmVzdGln
YXRpb24uCgpBIHNuaXBwbGV0IGZyb20gY29tbWl0IDU3ZjhiMTNjNzI0MDIzYzc4ZmExNWE4MDQ1
MmQxZGUzZTUxYTE0MTg6CgpAQCAtNDA5NiwxNCArNDA5NywxMiBAQCByZXRyeV90cmFuc2FjdGlv
bjoKICAgICAgICAgIGdvdG8gb3V0OwoKICAgICAgaWYgKHRhcmdldCA9PSBOVUxMKSB7Ci0gICAg
ICAgIGxpYnhsX194c19wcmludGYoZ2MsIHQsIHRhcmdldF9wYXRoLCAiJSJQUkl1MzIsCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgKHVpbnQzMl90KSBpbmZvLmN1cnJlbnRfbWVta2IpOwotICAg
ICAgICAqdGFyZ2V0X21lbWtiID0gKHVpbnQzMl90KSBpbmZvLmN1cnJlbnRfbWVta2I7CisgICAg
ICAgIGxpYnhsX194c19wcmludGYoZ2MsIHQsIHRhcmdldF9wYXRoLCAiJSJQUkl1NjQsIAppbmZv
LmN1cnJlbnRfbWVta2IpOworICAgICAgICAqdGFyZ2V0X21lbWtiID0gaW5mby5jdXJyZW50X21l
bWtiOwogICAgICB9CiAgICAgIGlmIChzdGF0aWNtYXggPT0gTlVMTCkgewotICAgICAgICBsaWJ4
bF9feHNfcHJpbnRmKGdjLCB0LCBtYXhfcGF0aCwgIiUiUFJJdTMyLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICh1aW50MzJfdCkgaW5mby5tYXhfbWVta2IpOwotICAgICAgICAqbWF4X21lbWti
ID0gKHVpbnQzMl90KSBpbmZvLm1heF9tZW1rYjsKKyAgICAgICAgbGlieGxfX3hzX3ByaW50Zihn
YywgdCwgbWF4X3BhdGgsICIlIlBSSXU2NCwgaW5mby5tYXhfbWVta2IpOworICAgICAgICAqbWF4
X21lbWtiID0gaW5mby5tYXhfbWVta2I7CiAgICAgIH0KCiAgICAgIHJjID0gMDsKCgpKdWVyZ2Vu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
