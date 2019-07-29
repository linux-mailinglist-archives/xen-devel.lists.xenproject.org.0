Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEF2787DB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 10:59:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs1Rr-0007OL-DJ; Mon, 29 Jul 2019 08:56:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vOtp=V2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hs1Rq-0007OE-G4
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 08:56:02 +0000
X-Inumbo-ID: ae0dbf90-b1de-11e9-99ca-334c921585da
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae0dbf90-b1de-11e9-99ca-334c921585da;
 Mon, 29 Jul 2019 08:55:57 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IgMeHxEZGYF46+etFAg1yJ/i/1iDkVXK/c1ss6B47ndaOoSujypW+ndgT6j3u+lcSZ93AMG6TO
 TpNF9EpyErb8OEV8mLaNBzEbyST77ZEl2F832x3Cq+D+wogMbzE63L3WOI3P/ORb7BCmvEPiCY
 9oN7VU4Tg8WiZ+BHNd9YKL7xJPCol/0NFnDdIMVOu0fDyUPWVVKdR3Ddt3dBKRxpdyZ7UOMre9
 uajXt3j3SUfB8EtbFFNYjPv8OMfqaK795oZDAtYBDwuUejR3b6nnvhCysAxc5UMXZLSw/N9J2O
 c/g=
X-SBRS: 2.7
X-MesageID: 3664848
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3664848"
Date: Mon, 29 Jul 2019 10:55:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190729085548.ctmpyyg4la44pqhx@Air-de-Roger>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726210854.6408-3-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/4] xen/percpu: Drop unused xen/percpu.h
 includes
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTA6MDg6NTJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBOb25lIG9mIHRoZXNlIGhlYWRlcnMgdXNlIGFueSBQRVJfQ1BVKCkgaW5mcmFzdHJ1
Y3R1cmUuCj4gCj4geGVuL3J3bG9jay5oIGhvd2V2ZXIgZG9lcywgYW5kIHBpY2tlZCBpdCB1cCB0
cmFuc2l0aXZlbHkgdmlhIHhlbi9zcGlubG9jay5oLAo+IHNvIGluY2x1ZGUgaXQgcHJvcGVybHku
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
