Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D459B41E50
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 09:55:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hay4U-00041p-4P; Wed, 12 Jun 2019 07:53:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hay4S-00041e-FY
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 07:53:24 +0000
X-Inumbo-ID: 26fe8cf6-8ce7-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 26fe8cf6-8ce7-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 07:53:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 01:53:21 -0600
Message-Id: <5D00AF6E0200007800237550@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 01:53:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1906111134410.13737@sstabellini-ThinkPad-T480s>
 <6ad24adc-dfb7-a2da-b4c8-2fe49c61a31f@arm.com>
In-Reply-To: <6ad24adc-dfb7-a2da-b4c8-2fe49c61a31f@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, nd@arm.com,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>, oleksandr_tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDExLjA2LjE5IGF0IDIxOjU2LCA8SnVsaWVuLkdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpLAo+IAo+IE9uIDExLzA2LzIwMTkgMTk6MzcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
Pj4gT24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gQ3VycmVudGx5
LCB0aGUgTUZOIHdpbGwgYmUgaW5jcmVtZW50ZWQgZXZlbiBpZiBpdCBpcyBpbnZhbGlkLiBUaGlz
IHdpbGwKPj4+IHJlc3VsdCB0byBoYXZlIGEgdmFsaWQgTUZOIGFmdGVyIHRoZSBmaXJzdCBpdGVy
YXRpb24uCj4+Pgo+Pj4gV2hpbGUgdGhpcyBpcyBub3QgYSBtYWpvciBwcm9ibGVtIHRvZGF5LCB0
aGlzIHdpbGwgYmUgaW4gdGhlIGZ1dHVyZSBpZgo+Pj4gdGhlIGNvZGUgZXhwZWN0IGFuIGludmFs
aWQgTUZOIGF0IGV2ZXJ5IGl0ZXJhdGlvbi4KPj4+Cj4+PiBTdWNoIGJlaGF2aW9yIGlzIHByZXZl
bnRlZCBieSBhdm9pZGluZyB0byBpbmNyZW1lbnQgYW4gaW52YWxpZCBNRk4uCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+IFJldmll
d2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+Pj4KPj4+IC0t
LQo+Pj4gICAgICBDaGFuZ2VzIGluIHYyOgo+Pj4gICAgICAgICAgLSBNb3ZlIHRoZSBwYXRjaCBl
YXJsaWVyIG9uIGluIHRoZSBzZXJpZXMKPj4+ICAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmll
d2VkLWJ5Cj4+PiAtLS0KPj4+ICAgeGVuL2FyY2gvYXJtL21tLmMgfCA1ICsrKystCj4+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+Pj4gaW5kZXgg
Zjk1NmFhNjM5OS4uOWRlMmExMTUwZiAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5j
Cj4+PiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+Pj4gQEAgLTEwNTEsMTEgKzEwNTEsMTQgQEAg
c3RhdGljIGludCB4ZW5fcHRfdXBkYXRlKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKPj4+ICAg
Cj4+PiAgICAgICBzcGluX2xvY2soJnhlbl9wdF9sb2NrKTsKPj4+ICAgCj4+PiAtICAgIGZvcig7
IGFkZHIgPCBhZGRyX2VuZDsgYWRkciArPSBQQUdFX1NJWkUsIG1mbiA9IG1mbl9hZGQobWZuLCAx
KSkKPj4+ICsgICAgZm9yKCA7IGFkZHIgPCBhZGRyX2VuZDsgYWRkciArPSBQQUdFX1NJWkUgKQo+
Pj4gICAgICAgewo+Pj4gICAgICAgICAgIHJjID0geGVuX3B0X3VwZGF0ZV9lbnRyeShvcCwgYWRk
ciwgbWZuLCBmbGFncyk7Cj4+PiAgICAgICAgICAgaWYgKCByYyApCj4+PiAgICAgICAgICAgICAg
IGJyZWFrOwo+Pj4gKwo+Pj4gKyAgICAgICAgaWYgKCAhbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4p
ICkKPj4+ICsgICAgICAgICAgICBtZm4gPSBtZm5fYWRkKG1mbiwgMSk7Cj4+PiAgICAgICB9Cj4+
IAo+PiBUaGlzIGlzIE9LIGJ1dCBnb3QgbWUgdGhpbmtpbmc6IHNob3VsZCB3ZSBiZSB1cGRhdGlu
ZyB0aGUgbWZuIGluIG1mbl9hZGQKPj4gaWYgdGhlIG1mbiBpcyBJTlZBTElEPyBUaGUgbWZuX2Vx
KG1mbiwgSU5WQUxJRF9NRk4pIGNvdWxkIGxpdmUgaW5zaWRlCj4+IHRoZSBzdGF0aWMgaW5saW5l
IG1mbl90IG1mbl9hZGQgZnVuY3Rpb24uIFdoYXQgZG8geW91IHRoaW5rPyBJIGRvbid0Cj4+IHRo
aW5rIHRoZXJlIGFyZSBhbnkgdmFsaWQgc2NlbmFyaW9zIHdoZXJlIHdlIHdhbnQgdG8gaW5jcmVt
ZW50Cj4+IElOVkFMSURfTUZOLi4uCj4gCj4gTXkgZmlyc3QgdGhvdWdodCBpcyBtZm5fYWRkKC4u
LikgbWF5IGJlIHVzZWQgaW4gcGxhY2Ugd2hlcmUgd2Uga25vdyB0aGUgCj4gbWZuIGlzIG5vdCBJ
TlZBTElEX01GTi4gU28gd2Ugd291bGQgYWRkIGV4dHJhIGNoZWNrIHdoZW4gaXQgbWF5IG5vdCBi
ZSAKPiBuZWNlc3NhcnkuIEFsdGhvdWdoLCBJIGFtIG5vdCBzdXJlIGlmIGl0IGlzIGltcG9ydGFu
dC4KPiAKPiBJIGhhdmUgYWRkZWQgQW5kcmV3ICYgSmFuIHRvIGdldCBhbnkgb3BpbmlvbnMuCgpG
V0lXIC0gSSBhZ3JlZSB3aXRoIEFuZHJldy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
