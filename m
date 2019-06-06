Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7FC3763C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 16:20:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYtC8-0005ez-0D; Thu, 06 Jun 2019 14:16:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYtC6-0005eu-DH
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 14:16:42 +0000
X-Inumbo-ID: b3e1aee1-8865-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b3e1aee1-8865-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 14:16:40 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 08:16:39 -0600
Message-Id: <5CF920430200007800235F91@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 08:16:35 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Petre Pircalabu" <ppircalabu@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <3ec19ed5425a62ecbc524e44c4bba86d5fe41762.1559224640.git.ppircalabu@bitdefender.com>
 <74176687-4c9f-f2dc-fafa-a999e3129f3c@citrix.com>
 <2d36968a158b9ff12ef8b717d9ae617062abae6c.camel@bitdefender.com>
 <5CF8D0B40200007800235CAA@prv1-mh.provo.novell.com>
 <8e6872513e24eeec5171d738643abc3c4e6cc969.camel@bitdefender.com>
In-Reply-To: <8e6872513e24eeec5171d738643abc3c4e6cc969.camel@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 8/9] vm_event: Add vm_event_ng interface
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA2LjE5IGF0IDE1OjQ4LCA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+IE9uIFRodSwgMjAxOS0wNi0wNiBhdCAwMjozNyAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEluIHdoaWNoIGNhc2UgbWF5YmUgdXNlIHZtYWxsb2MoKSBhbmQgdGhlbiBhc3NpZ25f
cGFnZXMoKT8KPj4gSmFuCj4gVW5mb3J0dW5hdGVseSBJIHdhc24ndCBhYmxlIHRvIG1ha2UgaXQg
d29yazoKPiBJIHJlcGxhY2VkIHRoZSBidWZmZXIgYWxsb2NhdGlvbiB3aXRoIHRoaXMgY29kZToK
PiAuLi4uCj4gICAgIGltcGwtPnNsb3RzID0gdnphbGxvYyhpbXBsLT5ucl9mcmFtZXMgKiBQQUdF
X1NJWkUpOwo+ICAgICBpZiAoICFpbXBsLT5zbG90cyApCj4gICAgICAgICByZXR1cm4gLUVOT01F
TTsKPiAKPiAgICAgZm9yICggaSA9IDA7IGkgPCBpbXBsLT5ucl9mcmFtZXM7IGkrKyApCj4gICAg
IHsKPiAgICAgICAgIGltcGwtPm1mbltpXSA9IHZtYXBfdG9fbWZuKGltcGwtPnNsb3RzICsgaSAq
IFBBR0VfU0laRSk7Cj4gICAgICAgICBpZiAoIGFzc2lnbl9wYWdlcyhjdXJyZW50LT5kb21haW4s
IG1mbl90b19wYWdlKGltcGwtPm1mbltpXSksCj4gMCwgMC8qTUVNRl9ub19yZWZjb3VudCovICkg
KQoKV2hvIGlzIGN1cnJlbnQtPmRvbWFpbiBhdCB0aGlzIHBvaW50PwoKPiAgICAgICAgIHsKPiAg
ICAgICAgICAgICBwcmludGsoIiVzOiBhc3NpZ25fcGFnZXMgcmV0dXJuZWQgZXJyb3JcbiIsIF9f
ZnVuY19fKTsKPiAgICAgICAgIH0KPiAgICAgfQo+IC4uLgo+IEFuZCB0aGUgZXJyb3IgaXMgc2lt
aWxhciB3aXRoIHRoZSBvbmUgd2l0aG91dCBhc3NpZ25fcGFnZXM6Cj4gLi4uLgo+IChYRU4pIG1t
LmM6MTAxNTpkMHY0IHBnX293bmVyIGQxIGwxZV9vd25lciBkMCwgYnV0IHJlYWxfcGdfb3duZXIg
ZDAKPiAoWEVOKSBtbS5jOjEwOTE6ZDB2NCBFcnJvciBnZXR0aW5nIG1mbiA2MGRlYWYgKHBmbiBm
ZmZmZmZmZmZmZmZmZmZmKQo+IGZyb20gTDEgZW50cnkgODAwMDAwMDYwZGVhZjIyNyBmb3IgbDFl
X293bmVyIGQwLCBwZ19vd25lciBkMQoKVGhpcyBsb29rcyB0byBiZSBhbiBhdHRlbXB0IGJ5IERv
bTAgdG8gbWFwIGEgcGFnZSBpbnRvIGl0cyBvd24KcGFnZSB0YWJsZXMgd2hpY2ggaXQgYmVsaWV2
ZXMgdG8gYmUgb3duZWQgYnkgRG9tMS4gVGhpcyB3b3VsZAppbXBseSB0aGF0IGN1cnJlbnQtPmRv
bWFpbiBhYm92ZSBpcyBhbHNvIERvbTEuIEkgd291bGQgaW5zdGVhZApoYXZlIGV4cGVjdGVkIHRo
aXMgdG8gYmUgYSBEb20wLW93bmVkIHBhZ2UsIGluIHdoaWNoIGNhc2UgeW91CnNob3VsZG4ndCBz
cGVjaWZ5IERvbTEgdG8gYmUgdGhlIHN1cHBvc2VkIG93bmVyIG9mIGl0IGluIHRoZQptYXBwaW5n
IHJlcXVlc3QuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
