Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A284576C3B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 17:00:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1ed-0007Z9-Ky; Fri, 26 Jul 2019 14:57:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr1ec-0007Z4-9t
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:57:06 +0000
X-Inumbo-ID: a1b1490e-afb5-11e9-b8ae-13e3da73514e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a1b1490e-afb5-11e9-b8ae-13e3da73514e;
 Fri, 26 Jul 2019 14:57:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98D43152D;
 Fri, 26 Jul 2019 07:57:04 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2EED3F71F;
 Fri, 26 Jul 2019 07:57:02 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>,
 Lars Kurth <lars.kurth@citrix.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c474cc6f-7759-88e8-60fe-3f8362551620@arm.com>
Date: Fri, 26 Jul 2019 15:57:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bE9uIDI2LzA3LzIwMTkgMTU6NDksIFZpa3RvciBNaXRpbiB3cm90ZToKPiBIaSBKdWxpZW4sIEFs
bCwKCkhpLAoKPiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA2OjQ0IFBNIEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBUYW1hcywKPj4KPj4gT24gNy8x
OC8xOSA0OjE0IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+PiBPbiBUaHUsIEp1bCAxOCwg
MjAxOSBhdCA5OjAyIEFNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3Rl
Ogo+Pj4+Cj4+Pj4gSGkgVGFtYXMsCj4+Pj4KPj4+PiBBZGRpbmcgTGFycywgQXJ0ZW0gYW5kIEl1
cmlpLiBJdXJpaSBoYXMgYmVlbiB3b3JraW5nIG9uIGEgdmVyc2lvbiBmb3IKPj4+PiBjbGFuZy1m
b3JtYXQgcmVjZW50bHkuCj4+Pj4KPj4+PiBPbiA3LzE4LzE5IDM6NDMgUE0sIFRhbWFzIEsgTGVu
Z3llbCB3cm90ZToKPj4+Pj4gVXNpbmcgYXN0eWxlIChodHRwOi8vYXN0eWxlLnNvdXJjZWZvcmdl
Lm5ldCkgY2FuIGdyZWF0bHkgcmVkdWNlIHRoZSBvdmVyaGVhZCBvZgo+Pj4+PiBtYW51YWxseSBj
aGVja2luZyBhbmQgYXBwbHlpbmcgc3R5bGUtZml4ZXMgdG8gc291cmNlLWNvZGUuIFRoZSBpbmNs
dWRlZAo+Pj4+PiAuYXN0eWxlcmMgaXMgdGhlIGNsb3Nlc3QgYXBwcm94aW1hdGlvbiBvZiB0aGUg
ZXN0YWJsaXNoZWQgWGVuIHN0eWxlIChpbmNsdWRpbmcKPj4+Pj4gc3R5bGVzIG5vdCBmb3JtYWxs
eSBzcGVsbGVkIG91dCBieSBDT0RJTkdfU1RZTEUgYnV0IGNvbW1vbmx5IHJlcXVlc3RlZCkuCj4+
Pj4+Cj4+Pj4+IENoZWNraW5nIHRoZSBjb21tZW50IHN0eWxlcyBhcmUgbm90IGluY2x1ZGVkIGlu
IHRoZSBhdXRvbWF0aW9uLgo+Pj4+Pgo+Pj4+PiBJbmNvcnBvcmF0aW5nIFhlbidzIGV4Y2VwdGlv
biB0byB0aGUgZG8td2hpbGUgc3R5bGUgaXMgb25seSBwYXJ0aWFsbHkgcG9zc2libGUsCj4+Pj4+
IHRodXMgYSBjaGFuZ2UgaXMgcHJvcG9zZWQgdG8gdGhlIENPRElOR19TVFlMRSBvZiBtb3Zpbmcg
dGhlIGJyYWNlIGZyb20gImRvIHsiCj4+Pj4+IHRvIHRoZSBuZXh0IGxpbmUuCj4+Pj4+Cj4+Pj4+
IE1vc3Qgb2YgWGVuJ3MgY29kZS1iYXNlIGlzIG5vbi1jb25mb3JtaW5nIGF0IHRoZSBtb21lbnQ6
IDI4OSBmaWxlcyBwYXNzCj4+Pj4+IHVuY2hhbmdlZCwgODc2IGhhdmUgc29tZSBzdHlsZSBpc3N1
ZQo+Pj4+Pgo+Pj4+PiBJZGVhbGx5IHdlIGNhbiBzbG93bHkgbWlncmF0ZSB0aGUgZW50aXJlIGNv
ZGUtYmFzZSB0byBiZSBjb25mb3JtaW5nLCB0aHVzCj4+Pj4+IGVsaW1pbmF0aW5nIHRoZSBuZWVk
IG9mIGRpc2N1c3NpbmcgYW5kIGVuZm9yY2luZyBzdHlsZSBpc3N1ZXMgbWFudWFsbHkgb24gdGhl
Cj4+Pj4+IG1haWxpbmdsaXN0Lgo+Pj4+Cj4+Pj4gSSBxdWl0ZSBsaWtlIHRoZSBpZGVhIG9mIGFu
IGF1dG9tYXRpYyBjb2Rpbmcgc3R5bGUgY2hlY2tlci4gSG93ZXZlciwgaXQKPj4+PiBpcyBhIGJp
dCBjb25jZXJuaW5nIHRoYXQgbm90IGV2ZW4gYSAxLzMgb2YgdGhlIGZpbGVzIGFyZSBhYmxlIHRv
IHBhc3MKPj4+PiB0aGUgY29kaW5nIHN0eWxlIHlvdSBzdWdnZXN0LiBDb3VsZCB5b3UgZXhwbGFp
biB3aGV0aGVyIHRoaXMgaXMgYmVjYXVzZQo+Pj4+IHRoZSBmaWxlcyBkb2VzIG5vdCBhbHJlYWR5
IGZvbGxvdyBYZW4gY29kaW5nIHN0eWxlIG9yIGlzIGl0IGp1c3QgdGhlCj4+Pj4gZGlmZmVyZW5j
ZSB3aXRoIGFzdHlsZT8KPj4+Pgo+Pj4+IFdoYXQgYXJlIHRoZSBtYWluIHN0eWxlIGlzc3Vlcz8K
Pj4+Cj4+PiBMb29rcyBsaWtlIGEgbG90IG9mIGZpbGVzIHRoYXQgZG9uJ3QgZm9sbG93IHRoZSBY
ZW4gY29kaW5nIHN0eWxlCj4+PiBhcy1pcy4gQWxpZ25tZW50IGlzc3VlcyBzZWVtIHRvIG1lIHRv
IGJlIHRoZSBtb3N0IGNvbW1vbiBlcnJvcnMuIFNlZQo+Pj4gdGhlIGZ1bGwgZGlmZiBoZXJlOgo+
Pj4KPj4+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3RrbGVuZ3llbC9jNWNhYzE0YTBkNTdmMTE5
ZGQ3NzQ3YTFiZTZmYjI2MAo+Pj4KPj4+IFdlIGNhbiBwZXJoYXBzIHR1bmUgc29tZSBhc3BlY3Rz
IG9mIGl0IHdlIGRpc2FncmVlIHdpdGggdGhlIGFzdHlsZQo+Pj4gZ2VuZXJhdGVkIHN0eWxlIGFu
ZCB0cnkgdG8gb3ZlcnJpZGUgaXQuIEkgZGlkIG15IGJlc3QgdG8gbWFrZSBpdAo+Pj4gY29uZm9y
bSB0byB0aGUgZXhpc3RpbmcgWGVuIHN0eWxlIGJ1dCBjZXJ0YWlubHkgdGhlcmUgY291bGQgYmUg
b3RoZXIKPj4+IHR3ZWFrcyBtYWRlIHRvIHJlZHVjZSB0aGUgY2h1cm4uCj4+Cj4+IEkgdGhpbmsg
d2UgZGVmaW5pdGVseSB3YW50IHRvIGF2b2lkIGNodXJuIGFzIHRoaXMgaXMgZ29pbmcgdG8gdGFr
ZSBhIGxvdAo+PiBvZiB0aW1lIHRvIGZpeCBhbGwgdGhlIHBsYWNlcyB0byB0aGUgbmV3IGluZGVu
dGF0aW9uLgo+Pgo+PiBHb2luZyB0aHJvdWdoIHRoZSBkaWZmIEkgY2FuIHNlZSBtYWpvciBkaWZm
ZXJlbmNlcyB3aXRoIHRoZSBYZW4gQ29kaW5nCj4+IHN0eWxlIGFuZCBhbHNvIHdoYXQgbG9va3Mg
bGlrZSBpbmNvbnNpc3RlbmNpZXMgZnJvbSB0aGUgdG9vbHMgaXRzZWxmOgo+PiAgICAgLSBMaW5l
IDU4OiBUaGlzIGlzIGZhaXJseSBjb21tb24gdG8gaW5kZW50IHRoZSBwYXJhbWV0ZXJzIGFzIGl0
IGlzCj4+IHRvZGF5LiBCdXQgdGhlbiBvbiBsaW5lIDE1OC8yNzIgaXQgaW5kZW50cyBhcyB3ZSBk
byB0b2RheS4gU28gSSBhbSBub3QKPj4gc3VyZSB3aGF0IHRoZSBleHBlY3RlZCBjb2Rpbmcgc3R5
bGUgZnJvbSB0aGUgdG9vbHMuCj4+ICAgICAtIExpbmUgNjc6IEkgYmVsaWV2ZSBKYW4gcmVxdWVz
dCB0aGUgc3BhY2UgYmVmb3JlIGxhYmVsCj4gU2VlbXMgYWdyZWVkIG5vdCB0byBhZGQgdGhlIHNw
YWNlcyBiZWZvcmUgbGFiZWwuIFJpZ2h0PwoKSSBkb24ndCByZW1lbWJlciBhbnkgYWdyZWVtZW50
IG9uIHRoaXMuIFBsZWFzZSBwb2ludCB0byB0aGUgdGhyZWFkLgoKPiAKPj4gICAgIC0gTGluZSAx
Mzk6IFRoZSB7IGFyZSBjb21tb25seSBvbiB0aGUgc2FtZSBsaW5lIGFzIHN0cnVjdCBvciBkZWZp
bml0aW9uLgo+IFRoaXMgc2hvdWxkIGJlIHN0YXRlZCBpbiB0aGUgQ29kaW5nIHN0eWxlIGV4cGxp
Y2l0bHkuCgpbLi4uXQoKPiBQbGVhc2UgYmUgYXdhcmUgdGhhdCBpdCBpcyBpbXBvcnRhbnQgdG8g
YWRkIGFsbCB0aGUgY2FzZXMgbWVudGlvbmVkCj4gYWJvdmUgKGFuZCBhbGwgdGhlIG90aGVyKSB0
byB0aGUgWGVuIENvZGluZyBzdHlsZSBkb2N1bWVudCBleHBsaWNpdGx5Lgo+IFRoaXMgc2VlbXMg
dGhlIGJpZ2dlc3Qgbm9uLXRlY2huaWNhbCBpc3N1ZSB0byBvdmVyY29tZS4uLgoKVGhhbmsgeW91
IGZvciB0aGUgcmVtaW5kZXIuIEhvd2V2ZXIsIHNvbWVvbmUgbmVlZHMgdG8gZHJpdmUgaXQuLi4g
QXJlIHlvdSBnb2luZyAKdG8gZG8gdGhhdD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
