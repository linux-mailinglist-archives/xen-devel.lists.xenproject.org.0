Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E939F36217
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 19:07:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYZL0-0006cq-0z; Wed, 05 Jun 2019 17:04:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ruhq=UE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hYZKy-0006ck-GJ
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 17:04:32 +0000
X-Inumbo-ID: fbfa0ba1-87b3-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fbfa0ba1-87b3-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 17:04:31 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wkXGWpOp8u/q0Pogv8pXNnPmcxjodg995tEKd5f6+QDieJ95o0BHYrfq/a7TKbbdKcU4SIrzEy
 VQDCr7jV1GpU2y6XECWEBGoB/bLcR9tyj1301wuhTvnbK3j0yGoVBAvXSNFzZWVDU3l2i8N5hX
 fENYcMgqdHPgzumcnJoDFJHRgNGSojKRvskIOc3B6Zg8fhh/MptsC6vuk5NZkz9pQfFhd/RxgR
 dry+3NrwcdhoOcIQjohKbfaog972DVykJbFdHoXSDs0R0F4l7VTWRH9Mc4TNNu1X73/ZK86240
 kBc=
X-SBRS: 2.7
X-MesageID: 1368046
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1368046"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFA1020000780022CCA6@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8953be9f-57ee-29b4-3fc1-d05468b056a5@citrix.com>
Date: Wed, 5 Jun 2019 18:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CD2CFA1020000780022CCA6@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

T24gMDgvMDUvMjAxOSAxMzo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIHRpbWVyIG5lZWRz
IHRvIHJlbWFpbiBhY3RpdmUgb25seSB1bnRpbCBhbGwgcGVuZGluZyBJUlEgaW5zdGFuY2VzCj4g
aGF2ZSBzZWVuIEVPSXMgZnJvbSB0aGVpciByZXNwZWN0aXZlIGRvbWFpbnMuIFN0b3AgaXQgd2hl
biB0aGUgaW4tZmxpZ2h0Cj4gY291bnQgaGFzIHJlYWNoZWQgemVybyBpbiBkZXNjX2d1ZXN0X2Vv
aSgpLiBOb3RlIHRoYXQgdGhpcyBpcyByYWNlIGZyZWUKPiAod2l0aCBfX2RvX0lSUV9ndWVzdCgp
KSwgYXMgdGhlIElSUSBkZXNjcmlwdG9yIGxvY2sgaXMgYmVpbmcgaGVsZCBhdAo+IHRoYXQgcG9p
bnQuCj4KPiBBbHNvIHB1bGwgdXAgc3RvcHBpbmcgb2YgdGhlIHRpbWVyIGluIF9fZG9fSVJRX2d1
ZXN0KCkgaXRzZWxmOiBJbnN0ZWFkCj4gb2Ygc3RvcHBpbmcgaXQgaW1tZWRpYXRlbHkgYmVmb3Jl
IHJlLXNldHRpbmcsIHN0b3AgaXQgYXMgc29vbiBhcyB3ZSd2ZQo+IG1hZGUgaXQgcGFzdCBhbnkg
ZWFybHkgcmV0dXJucyBmcm9tIHRoZSBmdW5jdGlvbiAoYW5kIGhlbmNlIHdlJ3JlIHN1cmUKPiBp
dCdsbCBnZXQgc2V0IGFnYWluKS4KCldoeSB0aGlzIHRoaXMgYSBnb29kIHRoaW5nPwoKPgo+IEZp
bmFsbHkgYmFpbCBmcm9tIHRoZSBhY3R1YWwgdGltZXIgaGFuZGxlciBpbiBjYXNlIHdlIGZpbmQg
dGhlIHRpbWVyCj4gYWxyZWFkeSBhY3RpdmUgYWdhaW4gYnkgdGhlIHRpbWUgd2UndmUgbWFuYWdl
ZCB0byBhY3F1aXJlIHRoZSBJUlEKPiBkZXNjcmlwdG9yIGxvY2suIFdpdGhvdXQgdGhpcyB3ZSBt
YXkgZm9yY2libHkgRU9JIGFuIElSUSBpbW1lZGlhdGVseQo+IGFmdGVyIGl0IGdvdCBzZW50IHRv
IGEgZ3Vlc3QuIEZvciB0aGlzLCB0aW1lcl9pc19hY3RpdmUoKSBnZXRzIHNwbGl0IG91dAo+IG9m
IGFjdGl2ZV90aW1lcigpLCBkZWxpYmVyYXRlbHkgbW92aW5nIGp1c3Qgb25lIG9mIHRoZSB0d28g
QVNTRVJUKClzICh0bwo+IGFsbG93IHRoZSBmdW5jdGlvbiB0byBiZSB1c2VkIGFsc28gb24gYSBu
ZXZlciBpbml0aWFsaXplZCB0aW1lcikuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPiArKysgYi94
ZW4vYXJjaC94ODYvaXJxLmMKPiBAQCAtMTExNSw2ICsxMTE1LDkgQEAgc3RhdGljIHZvaWQgaXJx
X2d1ZXN0X2VvaV90aW1lcl9mbih2b2lkCj4gIAo+ICAgICAgYWN0aW9uID0gKGlycV9ndWVzdF9h
Y3Rpb25fdCAqKWRlc2MtPmFjdGlvbjsKPiAgCgovKiBBbm90aGVyIGluc3RhbmNlIG9mIHRoaXMg
dGltZXIgYWxyZWFkeSBydW5uaW5nPyBTa2lwIGV2ZXJ5dGhpbmcgdG8KYXZvaWQgZm9yY2luZyBh
biBFT0kgZWFybHkuICovCgp+QW5kcmV3Cgo+ICsgICAgaWYgKCB0aW1lcl9pc19hY3RpdmUoJmFj
dGlvbi0+ZW9pX3RpbWVyKSApCj4gKyAgICAgICAgZ290byBvdXQ7Cj4gKwo+ICAgICAgaWYgKCBh
Y3Rpb24tPmFja190eXBlICE9IEFDS1RZUEVfTk9ORSApCj4gICAgICB7Cj4gICAgICAgICAgdW5z
aWduZWQgaW50IGk7Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
