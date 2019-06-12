Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC00B42685
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 14:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb2fO-0007N7-UW; Wed, 12 Jun 2019 12:47:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hb2fN-0007Mw-Uj
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 12:47:49 +0000
X-Inumbo-ID: 46c63d64-8d10-11e9-9559-778dc87d0134
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 46c63d64-8d10-11e9-9559-778dc87d0134;
 Wed, 12 Jun 2019 12:47:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C8628;
 Wed, 12 Jun 2019 05:47:45 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB6FB3F246;
 Wed, 12 Jun 2019 05:47:44 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1906111134410.13737@sstabellini-ThinkPad-T480s>
 <6ad24adc-dfb7-a2da-b4c8-2fe49c61a31f@arm.com>
 <c2876923-91b7-77ef-c14a-c4c46b0cfcb7@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2dbf8e6c-04ae-0925-cc1f-cfcb65678272@arm.com>
Date: Wed, 12 Jun 2019 13:47:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c2876923-91b7-77ef-c14a-c4c46b0cfcb7@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Checking INVALID_MFN in mfn_add (WAS: Re: [PATCH
 MM-PART3 v2 04/12] xen/arm: mm: Only increment mfn when valid in
 xen_pt_update)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8wNi8yMDE5IDIxOjI0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDExLzA2
LzIwMTkgMjA6NTYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMTEvMDYvMjAxOSAxOTozNywg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+Pj4+IEN1cnJlbnRseSwgdGhlIE1GTiB3aWxsIGJlIGluY3JlbWVudGVk
IGV2ZW4gaWYgaXQgaXMgaW52YWxpZC4gVGhpcyB3aWxsCj4+Pj4gcmVzdWx0IHRvIGhhdmUgYSB2
YWxpZCBNRk4gYWZ0ZXIgdGhlIGZpcnN0IGl0ZXJhdGlvbi4KPj4+Pgo+Pj4+IFdoaWxlIHRoaXMg
aXMgbm90IGEgbWFqb3IgcHJvYmxlbSB0b2RheSwgdGhpcyB3aWxsIGJlIGluIHRoZSBmdXR1cmUg
aWYKPj4+PiB0aGUgY29kZSBleHBlY3QgYW4gaW52YWxpZCBNRk4gYXQgZXZlcnkgaXRlcmF0aW9u
Lgo+Pj4+Cj4+Pj4gU3VjaCBiZWhhdmlvciBpcyBwcmV2ZW50ZWQgYnkgYXZvaWRpbmcgdG8gaW5j
cmVtZW50IGFuIGludmFsaWQgTUZOLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+PiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNv
diA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPj4+Pgo+Pj4+IC0tLQo+Pj4+ICAgICAgIENoYW5n
ZXMgaW4gdjI6Cj4+Pj4gICAgICAgICAgIC0gTW92ZSB0aGUgcGF0Y2ggZWFybGllciBvbiBpbiB0
aGUgc2VyaWVzCj4+Pj4gICAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4+Pj4g
LS0tCj4+Pj4gICAgeGVuL2FyY2gvYXJtL21tLmMgfCA1ICsrKystCj4+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPj4+PiBpbmRleCBmOTU2
YWE2Mzk5Li45ZGUyYTExNTBmIDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMKPj4+PiBAQCAtMTA1MSwxMSArMTA1MSwxNCBAQCBz
dGF0aWMgaW50IHhlbl9wdF91cGRhdGUoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAo+Pj4+ICAg
IAo+Pj4+ICAgICAgICBzcGluX2xvY2soJnhlbl9wdF9sb2NrKTsKPj4+PiAgICAKPj4+PiAtICAg
IGZvcig7IGFkZHIgPCBhZGRyX2VuZDsgYWRkciArPSBQQUdFX1NJWkUsIG1mbiA9IG1mbl9hZGQo
bWZuLCAxKSkKPj4+PiArICAgIGZvciggOyBhZGRyIDwgYWRkcl9lbmQ7IGFkZHIgKz0gUEFHRV9T
SVpFICkKPj4+PiAgICAgICAgewo+Pj4+ICAgICAgICAgICAgcmMgPSB4ZW5fcHRfdXBkYXRlX2Vu
dHJ5KG9wLCBhZGRyLCBtZm4sIGZsYWdzKTsKPj4+PiAgICAgICAgICAgIGlmICggcmMgKQo+Pj4+
ICAgICAgICAgICAgICAgIGJyZWFrOwo+Pj4+ICsKPj4+PiArICAgICAgICBpZiAoICFtZm5fZXEo
bWZuLCBJTlZBTElEX01GTikgKQo+Pj4+ICsgICAgICAgICAgICBtZm4gPSBtZm5fYWRkKG1mbiwg
MSk7Cj4+Pj4gICAgICAgIH0KPj4+IFRoaXMgaXMgT0sgYnV0IGdvdCBtZSB0aGlua2luZzogc2hv
dWxkIHdlIGJlIHVwZGF0aW5nIHRoZSBtZm4gaW4gbWZuX2FkZAo+Pj4gaWYgdGhlIG1mbiBpcyBJ
TlZBTElEPyBUaGUgbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pIGNvdWxkIGxpdmUgaW5zaWRlCj4+
PiB0aGUgc3RhdGljIGlubGluZSBtZm5fdCBtZm5fYWRkIGZ1bmN0aW9uLiBXaGF0IGRvIHlvdSB0
aGluaz8gSSBkb24ndAo+Pj4gdGhpbmsgdGhlcmUgYXJlIGFueSB2YWxpZCBzY2VuYXJpb3Mgd2hl
cmUgd2Ugd2FudCB0byBpbmNyZW1lbnQKPj4+IElOVkFMSURfTUZOLi4uCj4+IE15IGZpcnN0IHRo
b3VnaHQgaXMgbWZuX2FkZCguLi4pIG1heSBiZSB1c2VkIGluIHBsYWNlIHdoZXJlIHdlIGtub3cg
dGhlCj4+IG1mbiBpcyBub3QgSU5WQUxJRF9NRk4uIFNvIHdlIHdvdWxkIGFkZCBleHRyYSBjaGVj
ayB3aGVuIGl0IG1heSBub3QgYmUKPj4gbmVjZXNzYXJ5LiBBbHRob3VnaCwgSSBhbSBub3Qgc3Vy
ZSBpZiBpdCBpcyBpbXBvcnRhbnQuCj4+Cj4+IEkgaGF2ZSBhZGRlZCBBbmRyZXcgJiBKYW4gdG8g
Z2V0IGFueSBvcGluaW9ucy4KPiAKPiBtZm5fYWRkKGZvbywgYmFyKSBpcyBzaG9ydGhhbmQgZm9y
IGZvbyArPSBiYXIsIGFuZCBzaG91bGQgcmVtYWluIGFzIHN1Y2guCj4gCj4gSXQgZXhpc3RzIG9u
bHkgYmVjYXVzZSB3ZSBjYW4ndCBvdmVybG9hZCBvcGVyYXRvcnMgaW4gQywgYW5kIHdhbnQKPiBz
b21ldGhpbmcgc2xpZ2h0bHkgbW9yZSByZWFkYWJsZSB0aGFuIF9tZm4obWZuX3goZm9vKSArIGJh
cikKPiAKPiBCZWhpbmQgdGhlIHNjZW5lcywgdGhlIGNvbXBpbGVyIHdpbGwgdHVybiBpdCBiYWNr
IGludG8gYSBzaW5nbGUgYWRkCj4gaW5zdHJ1Y3Rpb24uCj4gCj4gVGhlIHNhdHVyYXRpbmcgYmVo
YXZpb3VyIGhlcmUgaXMgc3BlY2lmaWMgdG8gdGhlIHBhZ2V0YWJsZSBvcGVyZWF0aW9ucwo+IHdo
ZXJlIHBhc3NpbmcgSU5WQUxJRF9NRk4gaXMgYW4gYWxpYXMgZm9yIHVubWFwLCBhbmQgaXMgdGhl
cmVmb3JlIG5vdAo+IHVzZWZ1bCBpbiB0aGUgbWFqb3JpdHkgb2YgdGhlIHVzZXJzIG9mIG1mbl9h
ZGQoKSwgYW5kIGNlcnRhaW5seSBub3QKPiBzb21ldGhpbmcgd2Ugc2hvdWxkIGhhdmUgYSBoaWRk
ZW4gYnJhbmNoIGZvciBpbiB0aGUgbWlkZGxlIG9mIG1hbnkgdGlnaHQKPiBsb29wcy4KClRoYW5r
IHlvdSBmb3IgdGhlIGlucHV0ISBJIHdpbGwga2VlcCBtZm5fYWRkKCkgYXMgaXQgaXMuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
