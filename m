Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F6032AD3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 10:29:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXiI3-0004UA-CZ; Mon, 03 Jun 2019 08:25:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXiI1-0004U5-Jr
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 08:25:57 +0000
X-Inumbo-ID: 350abff9-85d9-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 350abff9-85d9-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 08:25:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 02:25:55 -0600
Message-Id: <5CF4D98F02000078002346D9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 02:25:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <CABfawhmsNx6L74jJEuPnfcXPXv3w2_q_nXHrcqVbd6TdDjs6pA@mail.gmail.com>
In-Reply-To: <CABfawhmsNx6L74jJEuPnfcXPXv3w2_q_nXHrcqVbd6TdDjs6pA@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA2LjE5IGF0IDAyOjQwLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMzozNSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiBBIGNvdXBsZSBvZiBhZGp1c3RtZW50cyBhcmUgbmVlZGVkIHRv
IGNvZGUgY2hlY2tpbmcgZm9yIGRvbV9jb3csIGJ1dAo+PiBzaW5jZSB0aGVyZSBhcmUgcHJldHR5
IGZldyBpdCBpcyBwcm9iYWJseSBiZXR0ZXIgdG8gYWRqdXN0IHRob3NlIHRoYW4KPj4gdG8gc2V0
IHVwIGFuZCBrZWVwIGFyb3VuZCBhIG5ldmVyIHVzZWQgZG9tYWluLgo+Pgo+PiBUYWtlIHRoZSBv
cHBvcnR1bml0eSBhbmQgdGlnaHRlbiBhIEJVR19PTigpIGluIGVtdWwtcHJpdi1vcC5jOnJlYWRf
Y3IoKS4KPj4gKEFyZ3VhYmx5IHRoaXMgcGVyaGFwcyBzaG91bGRuJ3QgYmUgYSBCVUdfT04oKSBp
biB0aGUgZmlyc3QgcGxhY2UuKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiBXaGlsZSBmb3Igbm93IHRoaXMgYXZvaWRzIGNyZWF0
aW5nIHRoZSBkb21haW4gb24gQXJtIG9ubHksIFRhbWFzJ2VzCj4+IHBhdGNoIHN3aXRjaGluZyB0
byBDT05GSUdfTUVNX1NIQVJJTkcgd2lsbCBtYWtlIHg4NiBsZXZlcmFnZSB0aGlzIHRvby4KPiAK
PiBwZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIHRoaXMgcGF0Y2ggYmUgYXBwbGll
ZCBhZnRlciBteQo+IHBhdGNoPyBZb3UgYWxyZWFkeSBhY2tlZCB0aGF0IG9uZSBhbmQgaXQgY291
bGQgYmUgYXBwbGllZCBzZXBhcmF0ZWx5Cj4gZnJvbSB0aGUgc2VyaWVzIHRoYXQgSSd2ZSBzZW50
IGl0IGFzIHBhcnQgb2YuCgpPaCwgSSBkaWRuJ3QgcmVhbGl6ZSBpdCBpcyBlbnRpcmVseSBpbmRl
cGVuZGVudCBvZiB0aGUgZWFybGllciBwYXRjaGVzLgpJdCB3b3VsZCBoZWxwIHRvIHBvaW50IHN1
Y2ggb3V0IGluIHRoZSBjb3ZlciBsZXR0ZXIsIHJlcXVpcmluZyB0aGVyZQp0byBiZSBvbmUgaW4g
dGhlIGZpcnN0IHBsYWNlLgoKWWV0IGV2ZW4gdGhlbiAtIGl0J3MgbGFja2luZyBhbiBYU00gbWFp
bnRhaW5lciBhY2sgYWZhaWNzIChhbmQgaXQKbG9va3MgYXMgaWYgeW91IGRpZG4ndCBldmVuIENj
IERhbmllbCksIGFuZCBJJ2QgcHJlZmVyIGEgcGF0Y2ggbGlrZQp0aGlzIHRvIGFsc28gaGF2ZSBh
biBhY2sgZnJvbSBHZW9yZ2UsIGV2ZW4gaWYganVkZ2luZyBieSB0aGUgZmlsZXMKdG91Y2hlZCB0
aGlzIG1heSBub3QgYmUgc3RyaWN0bHkgcmVxdWlyZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
