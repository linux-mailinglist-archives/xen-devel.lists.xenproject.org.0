Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7D427F67
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 16:20:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hToWr-0007gy-3a; Thu, 23 May 2019 14:17:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hToWp-0007gt-Fi
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 14:17:07 +0000
X-Inumbo-ID: 71578524-7d65-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 71578524-7d65-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 14:17:06 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 08:17:04 -0600
Message-Id: <5CE6AB600200007800231BF1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 08:17:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <nmanthey@amazon.de>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-3-git-send-email-nmanthey@amazon.de>
In-Reply-To: <1558424746-24059-3-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 2/3] common/grant_table:
 harden bound accesses
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA1LjE5IGF0IDA5OjQ1LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBH
dWVzdHMgY2FuIGlzc3VlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3Qg
Y29udHJvbGxlZAo+IGRhdGEgdG8gdGhlbS4gVGhpcyBkYXRhIGlzIHVzZWQgYXMgaW5kZXggZm9y
IG1lbW9yeSBsb2FkcyBhZnRlciBib3VuZAo+IGNoZWNrcyBoYXZlIGJlZW4gZG9uZS4gVG8gYXZv
aWQgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzLCB3ZQo+IHVzZSB0aGUgYXJyYXlf
aW5kZXhfbm9zcGVjIG1hY3JvIHdoZXJlIGFwcGxpY2FibGUsIG9yIHRoZSBtYWNybwo+IGJsb2Nr
X3NwZWN1bGF0aW9uLiBOb3RlLCB0aGF0IHRoZSBibG9ja19zcGVjdWxhdGlvbiBpcyBhbHdheXMg
dXNlZCBpbgoKcy9hbHdheXMvYWxyZWFkeS8gPwoKPiB0aGUgY2FsbHMgdG8gc2hhcmVkX2VudHJ5
X2hlYWRlciBhbmQgbnJfZ3JhbnRfZW50cmllcywgc28gdGhhdCBubwo+IGFkZGl0aW9uYWwgcHJv
dGVjdGlvbiBpcyByZXF1aXJlZCBvbmNlIHRoZXNlIGZ1bmN0aW9ucyBoYXZlIGJlZW4KPiBjYWxs
ZWQuCgpJc24ndCB0aGlzIHRvbyBicm9hZCBhIHN0YXRlbWVudD8gVGhlcmUncyBzb21lIHByb3Rl
Y3Rpb24sIGJ1dCBub3QKZm9yIGp1c3QgYW55dGhpbmcgdGhhdCBmb2xsb3dzLgoKPiAtLS0gYS94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMK
PiBAQCAtOTg4LDkgKzk4OCwxMCBAQCBtYXBfZ3JhbnRfcmVmKAo+ICAgICAgICAgIFBJTl9GQUlM
KHVubG9ja19vdXQsIEdOVFNUX2JhZF9nbnRyZWYsICJCYWQgcmVmICUjeCBmb3IgZCVkXG4iLAo+
ICAgICAgICAgICAgICAgICAgIG9wLT5yZWYsIHJndC0+ZG9tYWluLT5kb21haW5faWQpOwo+ICAK
PiAtICAgIGFjdCA9IGFjdGl2ZV9lbnRyeV9hY3F1aXJlKHJndCwgb3AtPnJlZik7Cj4gKyAgICAv
KiBUaGlzIGNhbGwgYWxzbyBlbnN1cmVzIHRoZSBhYm92ZSBjaGVjayBjYW5ub3QgYmUgcGFzc2Vk
IHNwZWN1bGF0aXZlbHkgKi8KPiAgICAgIHNoYWggPSBzaGFyZWRfZW50cnlfaGVhZGVyKHJndCwg
b3AtPnJlZik7Cj4gICAgICBzdGF0dXMgPSByZ3QtPmd0X3ZlcnNpb24gPT0gMSA/ICZzaGFoLT5m
bGFncyA6ICZzdGF0dXNfZW50cnkocmd0LCBvcC0+cmVmKTsKPiArICAgIGFjdCA9IGFjdGl2ZV9l
bnRyeV9hY3F1aXJlKHJndCwgb3AtPnJlZik7CgpJIGtub3cgd2UndmUgYmVlbiB0aGVyZSBiZWZv
cmUsIGJ1dCB3aGF0IGd1YXJhbnRlZXMgdGhhdCB0aGUKY29tcGlsZXIgd29uJ3QgcmVsb2FkIG9w
LT5yZWYgZnJvbSBtZW1vcnkgZm9yIGVpdGhlciBvZiB0aGUKbGF0dGVyIHR3byBhY2Nlc3Nlcz8g
SW4gZmFjdCBhZmFpY3QgaXQgYWx3YXlzIHdpbGwsIGR1ZSB0byB0aGUKbWVtb3J5IGNsb2JiZXIg
aW4gYWx0ZXJuYXRpdmUoKS4KCj4gQEAgLTM4NjMsNiArMzg4Myw5IEBAIHN0YXRpYyBpbnQgZ250
dGFiX2dldF9zdGF0dXNfZnJhbWVfbWZuKHN0cnVjdCBkb21haW4gKmQsCj4gICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ICAgICAgfQo+ICAKPiArICAgIC8qIE1ha2Ugc3VyZSBpZHggaXMg
Ym91bmRlZCB3cnQgbnJfc3RhdHVzX2ZyYW1lcyAqLwo+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24o
KTsKPiArCj4gICAgICAqbWZuID0gX21mbih2aXJ0X3RvX21mbihndC0+c3RhdHVzW2lkeF0pKTsK
PiAgICAgIHJldHVybiAwOwo+ICB9CgpXaHkgZG9uJ3QgeW91IHVzZSBhcnJheV9pbmRleF9ub3Nw
ZWMoKSBoZXJlPyBBbmQgaG93IGNvbWUKc3BlY3VsYXRpb24gaW50byBnbnR0YWJfZ3Jvd190YWJs
ZSgpIGlzIGZpbmUgYSBmZXcgbGluZXMgYWJvdmU/CkFuZCB3aGF0IGFib3V0IHRoZSBzaW1pbGFy
IGNvZGUgaW4gZ250dGFiX2dldF9zaGFyZWRfZnJhbWVfbWZuKCk/CgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
