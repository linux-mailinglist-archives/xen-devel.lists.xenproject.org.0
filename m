Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567157885C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 11:27:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs1u2-0001w5-LZ; Mon, 29 Jul 2019 09:25:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vOtp=V2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hs1u0-0001vw-ES
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 09:25:08 +0000
X-Inumbo-ID: c0bd13b4-b1e2-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c0bd13b4-b1e2-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 09:25:06 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JCXkAuvRwivWEKvtlAF1FJaqv8oy7COni3q2HSVGvaWla1X/LZF4BCFr9mPj3WpaVfETtlulqz
 KSoBpk9OhuGOSpAM2X7joHQdaLjMv1pgMQ0CUM/k24y6EbUAfur4n/VKnPi+VJ+Y3tSl8ysVJp
 x2f310k2Dw/UeGvphVO0LcdS1e3D6hn6LKnLRq5r+DDpoUpEEh+C4bJhIU1ZlwQKw75ojUNnrJ
 hlXPeqD5fyrt66CMnrKyXfTrZBhUbaErG0wZv2ltfG9CdjP3c/YiwTVR0QqciWBQ9LLMI/STjB
 O1c=
X-SBRS: 2.7
X-MesageID: 3648128
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3648128"
Date: Mon, 29 Jul 2019 11:24:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190729092454.nh4jvcsaqbqlqrg2@Air-de-Roger>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-2-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725133920.40673-2-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/6] domain: stash
 xen_domctl_createdomain flags in struct domain
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

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDI6Mzk6MTVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZXNlIGFyZSBjYW5vbmljYWwgc291cmNlIG9mIGRhdGEgdXNlZCB0byBzZXQgdmFy
aW91cyBvdGhlciBmbGFncy4gSWYKPiB0aGV5IGFyZSBhdmFpbGFibGUgZGlyZWN0bHkgaW4gc3Ry
dWN0IGRvbWFpbiB0aGVuIHRoZSBvdGhlciBmbGFncyBhcmUgbm8KPiBsb25nZXIgbmVlZGVkLgo+
IAo+IFRoaXMgcGF0Y2ggc2ltcGx5IGNvcGllcyB0aGUgZmxhZ3MgaW50byBhIG5ldyAnb3B0aW9u
cycgZmllbGQgaW4KPiBzdHJ1Y3QgZG9tYWluLiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBkbyB0
aGUgcmVsYXRlZCBjbGVhbi11cCB3b3JrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
