Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0751C1892D
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 13:40:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOhLz-0003F3-1F; Thu, 09 May 2019 11:36:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOhLx-0003Ey-El
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 11:36:45 +0000
X-Inumbo-ID: b8430561-724e-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b8430561-724e-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 11:36:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 05:36:43 -0600
Message-Id: <5CD410C9020000780022D1D7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 05:36:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <20190508113947.11920-1-george.dunlap@citrix.com>
 <d56ae8a0-7770-cb30-7996-a0d68d85e073@suse.com>
 <fa19ab5c-0d20-a198-74f4-6ee2fbf00c92@citrix.com>
 <23764.2442.337734.122162@mariner.uk.xensource.com>
In-Reply-To: <23764.2442.337734.122162@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add explicit check-in policy
 section
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA5LjA1LjE5IGF0IDEzOjA1LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gR2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSBNQUlOVEFJ
TkVSUzogQWRkIGV4cGxpY2l0IAo+IGNoZWNrLWluIHBvbGljeSBzZWN0aW9uIik6Cj4+IE9uIDUv
OC8xOSAxMjo1OSBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gPiAyLiBJbiB0aGUgY2FzZSB0
aGUgc3VibWl0dGVyIGlzIGEgbWFpbnRhaW5lciBvZiBhIG1vZGlmaWVkIGZpbGUgaXQgbXVzdAo+
PiA+IGhhdmUgYW4gQWNrIG9yIFJldmlldyBmcm9tIGVpdGhlciBhICJuZXN0ZWQiIG1haW50YWlu
ZXIgb3IgYSBEZXNpZ25hdGVkCj4+ID4gcmV2aWV3ZXIgb2YgdGhhdCBmaWxlLgo+PiAKPj4gVGhh
dCBjaGFuZ2VzIHRoZSBjdXJyZW50IG1lYW5pbmcgb2YgIkRlc2lnbmF0ZWQgUmV2aWV3ZXIiIHNv
bWV3aGF0LiAgQXQKPj4gdGhlIG1vbWVudCwgaXQgb25seSBtZWFucyAiU2VuZCB0aGlzIHBlcnNv
biBhbiBlbWFpbCI7IGlmIHdlIGRpZCB0aGF0LAo+PiBpdCB3b3VsZCBtZWFuLCAiVGhpcyBwZXJz
b24gaXMgbW9yZSB0cnVzdGVkIHRvIGRvIHJldmlld3MgdGhhbiBvdGhlcnMiLgo+PiAKPj4gTm90
IHN1cmUgd2hhdCBJIHRoaW5rIGFib3V0IHRoYXQgeWV0Lgo+IAo+IEkgdGhpbmsgdGhpcyBpcyBh
IGJhZCBpZGVhLiAgVGhlIHB1cnBvc2Ugd2FzIHRvIHByb3ZpZGUgYSB3YXkgZm9yCj4gc29tZW9u
ZSB0byBiZSBlbWFpbGVkIHdoaWNoIGRvZXNuJ3QgaW52b2x2ZSBnaXZpbmcgdGhlbSBhdXRob3Jp
dHksCj4gYW5kIHdoaWNoIGlzIHRoZXJlZm9yZSBhIHN0YXR1cyB3aGljaCBjYW4gYmUgZ3JhbnRl
ZCBvbiByZXF1ZXN0IGFuZAo+IGRvZXMgbm90IHJlcXVpcmUgYW55IGFzc2Vzc21lbnQgZXRjLgo+
IAo+IElmIHdlIGNoYW5lIHRoaXMgd2Ugd2lsbCBoYXZlIHRvIGludmVudCBhIG5ldyBzdGF0dXMg
dG8gcGVyZm9ybSB0aGlzCj4gZnVuY3Rpb24uCgpJIHRoaW5rIHdlIHdpbGwgd2FudCB0byBkbyB0
aGlzIGFueXdheTogIkRlc2lnbmF0ZWQgUmV2aWV3ZXIiIGlzbid0CnRoZSBzYW1lIGFzICJDYyA8
cGVyc29uPiBvbiBwYXRjaGVzIiAod2hpY2ggbWF5IGJlIGp1c3QgYmVjYXVzZQpzb21lb25lIHdh
bnRzIHRvIG1vbml0b3Igd2hhdCdzIGJlaW5nIHN1Ym1pdHRlZCAvIGRpc2N1c3NlZCkuIEF0Cmxl
YXN0IHRoYXQncyBteSAobm9uLW5hdGl2ZS1FbmdsaXNoKSB1bmRlcnN0YW5kaW5nIG9mICJkZXNp
Z25hdGVkIi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
