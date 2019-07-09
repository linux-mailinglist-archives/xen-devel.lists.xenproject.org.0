Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD2F63A52
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 19:54:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkuHr-0006vX-7Q; Tue, 09 Jul 2019 17:52:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DJix=VG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkuHp-0006vS-GO
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 17:52:17 +0000
X-Inumbo-ID: 49cfb48a-a272-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 49cfb48a-a272-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 17:52:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA9EC28;
 Tue,  9 Jul 2019 10:52:15 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F18353F59C;
 Tue,  9 Jul 2019 10:52:14 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190709105617.16088-1-viktor.mitin.19@gmail.com>
 <a569e616-431e-474c-0e3f-4c309555dc7f@arm.com>
 <CAOcoXZaKKEf9S9U56UPz5vgc6pw+LWWFADjJeyBHtqaeQ+OgXA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4490c790-ec60-d416-baa4-2467a8be917f@arm.com>
Date: Tue, 9 Jul 2019 18:52:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAOcoXZaKKEf9S9U56UPz5vgc6pw+LWWFADjJeyBHtqaeQ+OgXA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/doc: remove obsolete warning about
 testing gcov on arm
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzkvMTkgNjowNSBQTSwgVmlrdG9yIE1pdGluIHdyb3RlOgo+IE9uIFR1ZSwgSnVs
IDksIDIwMTkgYXQgMzoxMSBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3
cm90ZToKPj4KPj4gSGksCj4+Cj4gSGkgSnVsaWVuLAo+IAo+PiBPbiA3LzkvMTkgMTE6NTYgQU0s
IFZpa3RvciBNaXRpbiB3cm90ZToKPj4+IFJlbW92ZSBvYnNvbGV0ZSB3YXJuaW5nIGFib3V0IHRl
c3RpbmcgZ2NvdiBvbiBhcm0uCj4+PiBnY292IGhhcyBiZWVuIGZpeGVkIGFuZCB0ZXN0ZWQgd2l0
aCBhcm0gaHcgcHJldmlvdXNseQo+Pj4KPj4+IFNlZSBjb21taXQgNmFjNjZjOQo+Pgo+PiBUaGlz
IGNvbW1pdC4uLgo+Pgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFZpa3RvciBNaXRpbiA8dmlrdG9y
X21pdGluQGVwYW0uY29tPgo+Pj4gLS0tCj4+PiAgICBkb2NzL2h5cGVydmlzb3ItZ3VpZGUvY29k
ZS1jb3ZlcmFnZS5yc3QgfCA3IC0tLS0tLS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kb2NzL2h5cGVydmlzb3ItZ3VpZGUvY29kZS1j
b3ZlcmFnZS5yc3QgYi9kb2NzL2h5cGVydmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QKPj4+
IGluZGV4IDNjZWJmMmQ5NmUuLjk0N2VlNDg3MDEgMTAwNjQ0Cj4+PiAtLS0gYS9kb2NzL2h5cGVy
dmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QKPj4+ICsrKyBiL2RvY3MvaHlwZXJ2aXNvci1n
dWlkZS9jb2RlLWNvdmVyYWdlLnJzdAo+Pj4gQEAgLTYsMTMgKzYsNiBAQCB0aGUgY292ZXJhZ2Ug
b2YgaXRzIG93biBiYXNpYyBibG9ja3MuICBCZWluZyBhIHBpZWNlIG9mIHN5c3RlbSBzb2Z0d2Fy
ZSByYXRoZXIKPj4+ICAgIHRoYW4gYSB1c2Vyc3BhY2UsIGl0IGNhbid0IGF1dG9tYXRpY2FsbHkg
d3JpdGUgY292ZXJhZ2Ugb3V0IHRvIHRoZSBmaWxlc3lzdGVtLAo+Pj4gICAgc28gc29tZSBleHRy
YSBzdGVwcyBhcmUgcmVxdWlyZWQgdG8gY29sbGVjdCBhbmQgcHJvY2VzcyB0aGUgZGF0YS4KPj4+
Cj4+PiAtLi4gd2FybmluZzo6Cj4+PiAtCj4+PiAtICBDb3ZlcmFnZSBoYXMgb25seSBiZWVuIHRl
c3RlZCBvbiB4ODYgYXQgdGhlIG1vbWVudC4gIEFSTSBkb2Vzbid0IGN1cnJlbnRseQo+Pj4gLSAg
Ym9vdCB3aGVuIHRoZSBmaW5hbCBiaW5hcnkgZXhjZWVkcyAyTUIgaW4gc2l6ZSwgYW5kIHRoZSBj
b3ZlcmFnZSBidWlsZCB0ZW5kcwo+Pj4gLSAgdG8gZXhjZWVkcyB0aGlzIGxpbWl0Lgo+Pgo+PiAu
Li4gZG9lcyBub3QgYWRkcmVzcyB0aGUgMk1CIHBhcnQuIFNvIHBhcnQgb2YgdGhlIHdhcm5pbmcg
aXMgc3RpbGwgdmFsaWQKPj4gaGVyZS4KPj4KPiBJcyBpdCBrbm93biB3aHkgZG8gd2UgaGF2ZSB0
aGlzIDJNQiBsaW1pdD8KCldpdGhvdXQgY29kZSBjb3ZlcmFnZSAoYW5kIFVCU0FOKSBYZW4gaXMg
cXVpdGUgc21hbGwgYW5kIGNhbiBmaXQgaW4gMk1CLgoKVGhlIG1lbW9yeSBsYXlvdXQgaXMgZml4
ZWQsIHNvIHdlIGhhZCB0byBkZWZpbmUgYSBtYXhpbXVtIHNpemUuIDJNQiBpcyAKY29udmVuaWVu
dCBiZWNhdXNlIHlvdSBvbmx5IGRlYWwgd2l0aCBvbmx5IGEgc2Vjb25kLWxldmVsIHBhZ2UtdGFi
bGUgZW50cnkuCgo+IFNob3VsZCB3ZSBmaXggaXQ/CgpJdCBzaG91bGQgYmUgZml4ZWQgYnV0IG5v
dCB2ZXJ5IGVhc3kgd2l0aCB0aGUgY3VycmVudCBib290IGNvZGUuIEkgYW0gaW4gCnByb2Nlc3Mg
dG8gcmV3b3JrIHRoZSBib290L21lbW9yeSBjb2RlIChzZWUgWzFdKS4gVGhlcmUgYXJlIG1vcmUg
dG8gY29tZS4KCk9uY2UgdGhlIHdvcmsgaXMgZmluaXNoZWQsIGl0IHNob3VsZCBiZSBlYXN5IHRv
IGV4dGVuZCB0aGUgbGltaXQgdG8gNE1CIAoob3IgYmlnZ2VyIGlmIG5lY2Vzc2FyeSkuCgpDaGVl
cnMsCgpbMV0gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTktMDYvbXNnMDA1ODguaHRtbAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
