Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CED74B25A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 08:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdUKz-00063a-IH; Wed, 19 Jun 2019 06:44:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdUKz-00063V-0C
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 06:44:53 +0000
X-Inumbo-ID: bd3ad638-925d-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd3ad638-925d-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 06:44:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 00:44:51 -0600
Message-Id: <5D09D9E1020000780023980F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 00:44:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B854E020000780021F24B@prv1-mh.provo.novell.com>
 <3ccecb4a-64e5-808a-5b2e-97615df3fe86@citrix.com>
In-Reply-To: <3ccecb4a-64e5-808a-5b2e-97615df3fe86@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 31/50] x86emul: support remaining misc
 AVX512{F, BW} insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDE4OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMDo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoaXMgY29t
cGxldGVzIHN1cHBvcnQgb2YgQVZYNTEyQlcgaW4gdGhlIGluc24gZW11bGF0b3IsIGFuZCBsZWF2
ZXMganVzdAo+PiB0aGUgc2NhdHRlci9nYXRoZXIgb25lcyBvcGVuIGluIHRoZSBBVlg1MTJGIHNl
dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiAtLS0KPj4gdjU6IE5ldy4KPj4gLS0tCj4+IFRCRDogVGhlICpibGVuZG0qIGlubGluZSBmdW5j
dGlvbnMgZG9uJ3QgcmVsaWFibHkgcHJvZHVjZSB0aGUgaW50ZW5kZWQKPj4gICAgICBpbnNucywg
YXMgdGhlIHJlc3BlY3RpdmUgbW92ZXMgYXJlIGFib3V0IGFzIGdvb2QgYSBmaXQgZm9yIHRoZQo+
PiAgICAgIGNvbXBpbGVyIHdoZW4gbG9va2luZyBmb3IgYSBtYXRjaCBmb3IgdGhlIGludGVuZGVk
IG9wZXJhdGlvbi4gV2UnZAo+PiAgICAgIG5lZWQgdG8gc3dpdGNoIHRvIGlubGluZSBhc3NlbWJs
eSBpZiB3ZSB3YW50ZWQgdG8gZ3VhcmFudGVlIHRoZQo+PiAgICAgIHRlc3Rpbmcgb2YgdGhvc2Ug
aW5zbnMuIFRob3VnaHRzPwo+IAo+IERvIHlvdSBtZWFuIF9fYnVpbHRpbl9pYTMyX2JsZW5kbV8q
IGhlcmU/CgpZZXMsIG9yIHRoZWlyIHdyYXBwZXJzIGluIHRoZSAqaW50cmluLmggaGVhZGVycyAo
d2hpY2ggd2UgZG9uJ3QgdXNlIGZvcgp2YXJpb3VzIHJlYXNvbnMpLgoKPiAgSSBndWVzcyBpdCBk
ZXBlbmRzIG9uIHRoZQo+IHdyaXRlbWFzayBhcyB0byB3aGV0aGVyIG1vdiBpbnN0cnVjdGlvbnMg
d291bGQgYmUgbW9yZSBlZmZpY2llbnQuCgpSaWdodCwgYnV0IHdlIGRvbid0IHVzZSB3cml0ZSBt
YXNrcyBoZXJlLiBUaGVpciB1c2UgaW4gZ2VuZXJhbCBpcyBpbW8KcmF0aGVyIGN1bWJlcnNvbWUg
aW4gQyBsZXZlbCBjb2RlIGFueXdheSwgYW5kIGl0IHdvdWxkbid0IGZpdCB0aGUKZ2VuZXJhbCBz
dHJ1Y3R1cmUgb2Ygc2ltZF90ZXN0KCkgdmVyeSB3ZWxsIGlmIHdlIHdhbnRlZCB0byBtYWtlIHVz
ZQpvZiB0aGVtLgoKPiBJIHRoaW5rIHdlIGNhbiBwcm9iYWJseSByZWx5IG9uIGZ1enppbmcgdG8g
Y292ZXIgdGhlIGRpZmZlcmVuY2UsIHNlZWluZwo+IGFzIHRoZXJlIGlzIG5vdGhpbmcgaW50ZXJl
c3Rpbmcgb3Igbm9uc3RhbmRhcmQgYWJvdXQgdGhlc2UKPiBpbnN0cnVjdGlvbnMuICBUaGF0IGNl
cnRhaW5seSBzZWVtcyBwcmVmZXJhYmxlIHRvIGEgY3VzdG9tIGJvZGUuCj4gCj4gQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
