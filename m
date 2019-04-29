Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABDE34B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 15:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL61G-0001aq-6t; Mon, 29 Apr 2019 13:08:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL61E-0001ai-Oz
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 13:08:28 +0000
X-Inumbo-ID: df482128-6a7f-11e9-8f40-4f5595479d73
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df482128-6a7f-11e9-8f40-4f5595479d73;
 Mon, 29 Apr 2019 13:08:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 07:08:24 -0600
Message-Id: <5CC6F7430200007800229FBA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 07:08:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DE8F0200007800229E9A@prv1-mh.provo.novell.com>
 <5CC6F4270200007800229FA8@prv1-mh.provo.novell.com>
In-Reply-To: <5CC6F4270200007800229FA8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC 1/9] x86/IRQ: deal with move-in-progress
 state in fixup_irqs()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA0LjE5IGF0IDE0OjU1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDI5LjA0LjE5IGF0IDEzOjIyLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+PiBSRkM6
IEkndmUgc2VlbiB0aGUgbmV3IEFTU0VSVCgpIGluIGlycV9tb3ZlX2NsZWFudXBfaW50ZXJydXB0
KCkgdHJpZ2dlci4KPj4gICAgICBJJ20gcHJldHR5IHN1cmUgdGhhdCB0aGlzIGFzc2VydGlvbiB0
cmlnZ2VyaW5nIG1lYW5zIHNvbWV0aGluZyBlbHNlCj4+ICAgICAgaXMgd3JvbmcsIGFuZCBoYXMg
YmVlbiBldmVuIHByaW9yIHRvIHRoaXMgY2hhbmdlIChhZGRpbmcgdGhlCj4+ICAgICAgYXNzZXJ0
aW9uIHdpdGhvdXQgYW55IG9mIHRoZSBvdGhlciBjaGFuZ2VzIGhlcmUgc2hvdWxkIGJlIHZhbGlk
IGluCj4+ICAgICAgbXkgdW5kZXJzdGFuZGluZykuCj4gCj4gU28gSSB0aGluayB3aGF0IGlzIG1p
c3NpbmcgaXMgdXBkYXRpbmcgb2YgdmVjdG9yX2lycSAuLi4KPiAKPj4gQEAgLTIzOTEsNiArMjQw
MSwyNCBAQCB2b2lkIGZpeHVwX2lycXMoY29uc3QgY3B1bWFza190ICptYXNrLCBiCj4+ICAgICAg
ICAgICAgICBjb250aW51ZTsKPj4gICAgICAgICAgfQo+PiAgCj4+ICsgICAgICAgIC8qCj4+ICsg
ICAgICAgICAqIEluIG9yZGVyIGZvciB0aGUgYWZmaW5pdHkgYWRqdXN0bWVudCBiZWxvdyB0byBi
ZSBzdWNjZXNzZnVsLCB3ZQo+PiArICAgICAgICAgKiBuZWVkIF9fYXNzaWduX2lycV92ZWN0b3Io
KSB0byBzdWNjZWVkLiBUaGlzIGluIHBhcnRpY3VsYXIgbWVhbnMKPj4gKyAgICAgICAgICogY2xl
YXJpbmcgZGVzYy0+YXJjaC5tb3ZlX2luX3Byb2dyZXNzIGlmIHRoaXMgd291bGQgb3RoZXJ3aXNl
Cj4+ICsgICAgICAgICAqIHByZXZlbnQgdGhlIGZ1bmN0aW9uIGZyb20gc3VjY2VlZGluZy4gU2lu
Y2UgdGhlcmUncyBubyB3YXkgZm9yIHRoZQo+PiArICAgICAgICAgKiBmbGFnIHRvIGdldCBjbGVh
cmVkIGFueW1vcmUgd2hlbiB0aGVyZSdzIG5vIHBvc3NpYmxlIGRlc3RpbmF0aW9uCj4+ICsgICAg
ICAgICAqIGxlZnQgKHRoZSBvbmx5IHBvc3NpYmlsaXR5IHRoZW4gd291bGQgYmUgdGhlIElSUXMg
ZW5hYmxlZCB3aW5kb3cKPj4gKyAgICAgICAgICogYWZ0ZXIgdGhpcyBsb29wKSwgdGhlcmUncyB0
aGVuIGFsc28gbm8gcmFjZSB3aXRoIHVzIGRvaW5nIGl0IGhlcmUuCj4+ICsgICAgICAgICAqCj4+
ICsgICAgICAgICAqIFRoZXJlZm9yZSB0aGUgbG9naWMgaGVyZSBhbmQgdGhlcmUgbmVlZCB0byBy
ZW1haW4gaW4gc3luYy4KPj4gKyAgICAgICAgICovCj4+ICsgICAgICAgIGlmICggZGVzYy0+YXJj
aC5tb3ZlX2luX3Byb2dyZXNzICYmCj4+ICsgICAgICAgICAgICAgIWNwdW1hc2tfaW50ZXJzZWN0
cyhtYXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNrKSApCj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAg
ICAgIHJlbGVhc2Vfb2xkX3ZlYyhkZXNjKTsKPj4gKyAgICAgICAgICAgIGRlc2MtPmFyY2gubW92
ZV9pbl9wcm9ncmVzcyA9IDA7Cj4+ICsgICAgICAgIH0KPiAKPiAuLi4gaGVyZSBhbmQgaW4gdGhl
IHNvbWV3aGF0IHNpbWlsYXIgbG9naWMgcGF0Y2ggMiBpbnNlcnRzIGEgZmV3IGxpbmVzCj4gdXAu
IEknbSBhYm91dCB0byB0cnkgdGhpcyBvdXQsIGJ1dCBnaXZlbiBob3cgcmFyZWx5IEkndmUgc2Vl
biB0aGUKPiBwcm9ibGVtIHRoaXMgd2lsbCB0YWtlIGEgd2hpbGUgdG8gZmVlbCBjb25maWRlbnQg
KGlmLCBvZiBjb3Vyc2UsIGl0IGhlbHBzCj4gaW4gdGhlIGZpcnN0IHBsYWNlKS4KCkFjdHVhbGx5
IG5vLCB0aGUgMm5kIHBhdGNoIGRvZXNuJ3QgbmVlZCBhbnkgY2hhbmdlIC0gdGhlIGNvZGUKYWRk
ZWQgdGhlcmUgb25seSBkZWFscyB3aXRoIENQVXMgYWxyZWFkeSBtYXJrZWQgb2ZmbGluZS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
