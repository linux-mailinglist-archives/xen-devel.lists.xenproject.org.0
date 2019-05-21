Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16025368
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 17:04:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT6G6-0003cp-7T; Tue, 21 May 2019 15:00:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mDO=TV=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hT6G4-0003ck-JR
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 15:00:52 +0000
X-Inumbo-ID: 38c0653e-7bd9-11e9-8a1f-436607ebdfa7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38c0653e-7bd9-11e9-8a1f-436607ebdfa7;
 Tue, 21 May 2019 15:00:50 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: fyFspMr+bMo2AZW1zuS8gHIvYobZpZxYS4y5F7Xte1zmuvF7goWQLgNeKssxSF80QmNm9OJgDQ
 IfDJyUqtt9mAsnaFOxaIBPvlxf/RyeuzL6RRfmUauhLY93ZJSPLbpFGWHVQL3iroCtRfCvt5CW
 j52RB6hM5tsj4Ehbr0rkCpAFBuaYvkzi+fmsROVyLDtoGDF8xh+WsCbiGAChypyvKv7wyB0PpS
 eVf0A6kren7vNlpwQ15VLWVXpAPOsfkbIYALJK7zmkiQo8QZSdla5tkhrJAyQ7xNNo3aSc0Cfc
 Q4k=
X-SBRS: 2.7
X-MesageID: 714196
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,495,1549947600"; 
   d="scan'208";a="714196"
Date: Tue, 21 May 2019 16:00:42 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190521150042.GJ1846@zion.uk.xensource.com>
References: <20190521143702.GH1846@zion.uk.xensource.com>
 <20190521164122.187e51f6.olaf@aepfle.de>
 <20190521144315.GI1846@zion.uk.xensource.com>
 <20190521165818.6f13af3f.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521165818.6f13af3f.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Unhandle NONE type device model broke QDISK backend
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDQ6NTg6MThQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVHVlLCAyMSBNYXkgMjAxOSAxNTo0MzoxNSArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiBZZWFoLCB0aGF0J3MgaW5kZWVkIHN0cmFu
Z2UuIFRoYW5rcyBmb3IgaGF2aW5nIGEgbG9vay4KPiAKPiBJcyB0aGUgdXNlZCBkb21VLmNmZyBh
dmFpbGFibGU/IEkgdGhpbmsgSW4gbXkgdGVzdGluZyBkaXNrPVtdIGhhZCBiYWNrZW5kPXFkaXNr
LgoKU2VlCgpodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3Mv
MTM2NDQwL3Rlc3QtYW1kNjQtYW1kNjQteGwtcWNvdzIvYmFyb3F1ZTAtLS1ldGMteGVuLWRlYmlh
bi5zdHJldGNoLmd1ZXN0Lm9zc3Rlc3QuY2ZnCgpXZWkuCgo+IAo+IE9sYWYKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
