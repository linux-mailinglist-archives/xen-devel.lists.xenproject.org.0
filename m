Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B762D2B89F
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 17:55:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVHur-0000Ye-1t; Mon, 27 May 2019 15:52:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVHup-0000YZ-9g
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 15:51:59 +0000
X-Inumbo-ID: 5bc115cb-8097-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5bc115cb-8097-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 15:51:58 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: OpOM58v3ZcWy7lNR3vpkZoJx119miS4w7nrv33cYBgkCGxOcvvUbTGczfiQCmqPegdlL3Q3kmb
 eJXCIWu82GVAevclvajngx6zTF1U7lxKAWfj0PdmBimtLuejvjJJYHHwF/W15d/Kk2+UtlSum+
 QDG9A9S1Pqhj7JGZbbor0E3YCQxlII7KFj23z/J2cPZ6TFWHDrL2bY/rMC3Z6+DbiH3vrIBShA
 /C5GaU1myxEJhf14+eDb2DSLQ+RmjZJV/NOwqgfgzquy5k/wrgB5tB8ohIDlEvLkIOL1YIU4Kh
 l9A=
X-SBRS: 2.7
X-MesageID: 951650
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; 
   d="scan'208";a="951650"
Date: Mon, 27 May 2019 17:51:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190527155143.khxljfjmq5lsdxxa@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-2-roger.pau@citrix.com>
 <5CE6BC680200007800231C8F@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE6BC680200007800231C8F@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/5] pci: use pci_sbdf_t in pci_dev
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDk6Mjk6NDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcGNpLmgKPiA+IEBAIC04MCw5ICs4MCw4IEBAIHN0cnVjdCBwY2lfZGV2IHsKPiA+ICAg
ICAgc3RydWN0IGFyY2hfbXNpeCAqbXNpeDsKPiA+ICAKPiA+ICAgICAgc3RydWN0IGRvbWFpbiAq
ZG9tYWluOwo+ID4gLSAgICBjb25zdCB1MTYgc2VnOwo+ID4gLSAgICBjb25zdCB1OCBidXM7Cj4g
PiAtICAgIGNvbnN0IHU4IGRldmZuOwo+ID4gKwo+ID4gKyAgICBjb25zdCBwY2lfc2JkZl90IHNi
ZGY7Cj4gCj4gVG8gaGVscCB0aGUgdHJhbnNpdGlvbiwgZGlkIHlvdSBjb25zaWRlciBmaXJzdCBt
YWtpbmcgdGhpcyBhIHVuaW9uIG9mCj4gdGhlIGV4aXN0aW5nIGZpZWxkcyBhbmQgdGhlIG5ldyBv
bmUsIG5leHQgcmVwbGFjaW5nIHVzZWQgaW4gYSBwZXIKPiBjb21wb25lbnQgbWFubmVyIChzbyB0
aGF0IGluZGl2aWR1YWwgbWFpbnRhaW5lcnMgd291bGQgaGF2ZSB0bwo+IGxvb2sgYXQgc21hbGxl
ciBwYXRjaGVzIGVhY2ggb25seSksIGFuZCBmaW5hbGx5IGRyb3BwaW5nIHRoZSB1bmlvbgo+IGFu
ZCBpdHMgb2xkIGZpZWxkcz8KCk5vLCB0aGF0IGRpZG4ndCBvY2N1ciB0byBtZSBhbmQgaXQncyBp
bmRlZWQgbGlrZWx5IHRvIG1ha2UgdGhpcyBtdWNoCmxlc3MgcGFpbmZ1bC4gTXkgcGxhbiB3YXMg
dG8gc3dpdGNoIHRoaXMgaW4gb25lIGdvIGFkIGRvbmUgaW4gdGhpcwpzZXJpZXMsIGJ1dCB1c2lu
ZyBzdWNoIHVuaW9uIHdvdWxkIGFsbG93IGZvciBzbWFsbGVyIHBhdGNoZXMuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
