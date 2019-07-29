Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD1787DC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 10:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs1Sz-0007Sy-OQ; Mon, 29 Jul 2019 08:57:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vOtp=V2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hs1Sy-0007Ss-Fl
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 08:57:12 +0000
X-Inumbo-ID: d9af6253-b1de-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d9af6253-b1de-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 08:57:10 +0000 (UTC)
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
IronPort-SDR: nA60j4zBW/2EaEA0ssw2A19K6ABk2jYiXw1hMUlt8wApDO3dBOcvHibbCbpO6MZsuBDKW1oX6O
 TLbe71KJN1NZmqtymnAcLjp67qMCIxGtYD0R5WJTytBJr4qPfpO3lOt37K8Nz3YmAUAlu0pVm5
 MHVCX0Y62YikkoibBa2ftjrYTRlGGHtUkxqTJE7egVWA33u7GXx9uC7SSP7W/fCEDTEe4P4rpR
 D1j6vtTKTz8yr8qu9loZkEazZWmN6oHji9FhoBZW1utPbCRSio6H7PEmhwBI3HznotInQek+jL
 aW4=
X-SBRS: 2.7
X-MesageID: 3664886
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3664886"
Date: Mon, 29 Jul 2019 10:56:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190729085657.ko4n4l7zkvvpeg7d@Air-de-Roger>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726210854.6408-4-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/4] xen/percpu: Drop unused asm/percpu.h
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

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTA6MDg6NTNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGVzZSBmaWxlcyBlaXRoZXIgZG9uJ3QgdXNlIGFueSBQRVJfQ1BVKCkgaW5mcmFz
dHJ1Y3R1cmUgYXQgYWxsLCBvciB1c2UKPiBERUZJTkVfUEVSX0NQVV8qKCkuICBUaGlzIGlzIGRl
Y2xhcmVkIGluIHhlbi9wZXJjcHUuaCwgbm90IGFzbS9wZXJjcHUuaCwgd2hpY2gKPiBtZWFucyB0
aGF0IHhlbi9wZXJjcHUuaCBpcyBpbmNsdWRlZCB2aWEgYSBkaWZmZXJlbnQgcGF0aC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhh
bmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
