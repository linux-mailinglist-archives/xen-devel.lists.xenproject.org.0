Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D3749CF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 11:25:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqZxk-0004GD-4j; Thu, 25 Jul 2019 09:23:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqZxi-0004G8-JO
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 09:22:58 +0000
X-Inumbo-ID: c8507f4c-aebd-11e9-a264-f302aaffce68
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8507f4c-aebd-11e9-a264-f302aaffce68;
 Thu, 25 Jul 2019 09:22:55 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 70B7gRJz/IlUtbaCjHod3DqkcVMRoIKZJTridfuJCmgbRyVSFw36G0g6gciaoYPgNNAciegBiZ
 P3aBiheskqaAZYxWHR5nTVoiHicOjDWvzlYAI/Ng7W0SKQO2i7N7LlsULHAT5rBrTONx3xDO82
 GX2+7jGNzvQJjG4Iy8dgWnp8Px7a1xGT039j7cAoz4NlJq+NZyLjKqm17F+NOYA2fuOhIN2UaY
 TdCGrjdjN7yupW40PmFRBe/Re6tmfeZcsi7RFMhY1K86GhYmuK5/7m5goJZrItTDeVxNVz+ROK
 0RI=
X-SBRS: 2.7
X-MesageID: 3410610
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3410610"
Date: Thu, 25 Jul 2019 11:22:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190725092242.m675tevc5wudzaw5@Air-de-Roger>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-2-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723160609.2177-2-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDU6MDY6MDRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZXNlIGFyZSBjYW5vbmljYWwgc291cmNlIG9mIGRhdGEgdXNlZCB0byBzZXQgdmFy
aW91cyBvdGhlciBmbGFncy4gSWYKPiB0aGV5IGFyZSBhdmFpbGFibGUgZGlyZWN0bHkgaW4gc3Ry
dWN0IGRvbWFpbiB0aGVuIHRoZSBvdGhlciBmbGFncyBhcmUgbm8KPiBsb25nZXIgbmVlZGVkLgo+
IAo+IFRoaXMgcGF0Y2ggc2ltcGx5IGNvcGllcyB0aGUgZmxhZ3MgaW50byBhIG5ldyAnY3JlYXRl
ZmxhZ3MnIGZpZWxkIGluCj4gc3RydWN0IGRvbWFpbi4gU3Vic2VxdWVudCBwYXRjaGVzIHdpbGwg
ZG8gdGhlIHJlbGF0ZWQgY2xlYW4tdXAgd29yay4KClRoYW5rcyEKCkp1c3Qgb25lIG5hbWluZyBj
b21tZW50ICh3aGljaCBpcyBzdWJqZWN0IHRvIHRhc3RlIEkgZ3Vlc3MpLgoKPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+IGlu
ZGV4IGI0MGM4ZmQxMzguLmVkYWUzNzJjMmIgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L3NjaGVkLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+IEBAIC0zMDgsNiArMzA4
LDcgQEAgZW51bSBndWVzdF90eXBlIHsKPiAgCj4gIHN0cnVjdCBkb21haW4KPiAgewo+ICsgICAg
dW5zaWduZWQgaW50ICAgICBjcmVhdGVmbGFnczsKCkNhbiB5b3UgbmFtZSB0aGlzIGp1c3QgZmxh
Z3Mgb3Igb3B0aW9ucyBvciBzb21lIHN1Y2ggKHdpdGhvdXQgdGhlCmNyZWF0ZSBwcmVmaXgpLiBJ
TU8gYWRkaW5nIHRoZSBjcmVhdGUgcHJlZml4IG1ha2VzIGl0IGxvb2sgbGlrZSBhCmZpZWxkIG9u
bHkgdXNlZCBkdXJpbmcgZG9tYWluIGNyZWF0aW9uLCB3aGlsZSBpdCdzIG5vdCB0aGUgY2FzZS4K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
