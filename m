Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3036E35
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 10:11:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYnRc-0008Ae-EE; Thu, 06 Jun 2019 08:08:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYnRb-0008AZ-1z
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 08:08:19 +0000
X-Inumbo-ID: 3d57c0c1-8832-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3d57c0c1-8832-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 08:08:17 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 02:08:16 -0600
Message-Id: <5CF8C9EE0200007800235C76@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 02:08:14 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFA1020000780022CCA6@prv1-mh.provo.novell.com>
 <8953be9f-57ee-29b4-3fc1-d05468b056a5@citrix.com>
In-Reply-To: <8953be9f-57ee-29b4-3fc1-d05468b056a5@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/4] x86/IRQ: don't keep EOI timer running
 without need
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDE5OjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMDUvMjAxOSAxMzo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZSB0aW1l
ciBuZWVkcyB0byByZW1haW4gYWN0aXZlIG9ubHkgdW50aWwgYWxsIHBlbmRpbmcgSVJRIGluc3Rh
bmNlcwo+PiBoYXZlIHNlZW4gRU9JcyBmcm9tIHRoZWlyIHJlc3BlY3RpdmUgZG9tYWlucy4gU3Rv
cCBpdCB3aGVuIHRoZSBpbi1mbGlnaHQKPj4gY291bnQgaGFzIHJlYWNoZWQgemVybyBpbiBkZXNj
X2d1ZXN0X2VvaSgpLiBOb3RlIHRoYXQgdGhpcyBpcyByYWNlIGZyZWUKPj4gKHdpdGggX19kb19J
UlFfZ3Vlc3QoKSksIGFzIHRoZSBJUlEgZGVzY3JpcHRvciBsb2NrIGlzIGJlaW5nIGhlbGQgYXQK
Pj4gdGhhdCBwb2ludC4KPj4KPj4gQWxzbyBwdWxsIHVwIHN0b3BwaW5nIG9mIHRoZSB0aW1lciBp
biBfX2RvX0lSUV9ndWVzdCgpIGl0c2VsZjogSW5zdGVhZAo+PiBvZiBzdG9wcGluZyBpdCBpbW1l
ZGlhdGVseSBiZWZvcmUgcmUtc2V0dGluZywgc3RvcCBpdCBhcyBzb29uIGFzIHdlJ3ZlCj4+IG1h
ZGUgaXQgcGFzdCBhbnkgZWFybHkgcmV0dXJucyBmcm9tIHRoZSBmdW5jdGlvbiAoYW5kIGhlbmNl
IHdlJ3JlIHN1cmUKPj4gaXQnbGwgZ2V0IHNldCBhZ2FpbikuCj4gCj4gV2h5IHRoaXMgdGhpcyBh
IGdvb2QgdGhpbmc/CgpGb3IgaXQgdG8gbm90IGZpcmUgd2hlbiBpdCBkb2Vzbid0IG5lZWQgdG8u
IElmIHdlJ3JlIGFib3V0IHRvIHNldAphIG5ldyB0aW1lb3V0LCB3ZSBjbGVhcmx5IGRvbid0IHdh
bnQgdGhlIHByZXZpb3VzIG9uZSB0byBoYXZlCmFueSBlZmZlY3QgYW55bW9yZS4KCj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9pcnEuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKPj4gQEAgLTEx
MTUsNiArMTExNSw5IEBAIHN0YXRpYyB2b2lkIGlycV9ndWVzdF9lb2lfdGltZXJfZm4odm9pZAo+
PiAgCj4+ICAgICAgYWN0aW9uID0gKGlycV9ndWVzdF9hY3Rpb25fdCAqKWRlc2MtPmFjdGlvbjsK
Pj4gIAo+IAo+IC8qIEFub3RoZXIgaW5zdGFuY2Ugb2YgdGhpcyB0aW1lciBhbHJlYWR5IHJ1bm5p
bmc/IFNraXAgZXZlcnl0aGluZyB0bwo+IGF2b2lkIGZvcmNpbmcgYW4gRU9JIGVhcmx5LiAqLwoK
RmluZSB3aXRoIG1lLCBhZGRlZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
