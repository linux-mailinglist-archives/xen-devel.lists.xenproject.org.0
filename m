Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0433C78B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 11:47:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadK1-0008Pm-SF; Tue, 11 Jun 2019 09:44:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6cN=UK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hadK0-0008Pf-8g
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 09:44:04 +0000
X-Inumbo-ID: 72424776-8c2d-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 72424776-8c2d-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 09:44:03 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZSMNJNX5YZgsVwzblzAhvqmXodqK4wud85hCDJW9iPl6rIKCbXj+NQBrsAWLhS8jLlrl11QXtS
 yG8T0PSKfoF69b9MJnjlWJpN7Pg7i301YcIUhJriiKGEsmijK6dhZYDlUm9Ha/BdzyPzdtF+Kk
 /dyWA4fHFkrGh+ggYOoRWEOJfrgZUSLJYsHuQuz+1eiGRF9/KYj77tJK9uKRx9zQm2oGBLKHaR
 uceUVFzUXJNXVzXw0gpp75+HjAu9sUgGnEE8TIZ5AoBgOTyNP05DWRqHxob/MBRBYvwQJcKzIW
 IqU=
X-SBRS: 2.7
X-MesageID: 1580200
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,578,1557201600"; 
   d="scan'208";a="1580200"
Date: Tue, 11 Jun 2019 11:43:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Fanny Dwargee <fdwargee6@gmail.com>
Message-ID: <20190611094355.u2vzg4zxy3xok75g@Air-de-Roger>
References: <1050197223.47376247.1559909190275.JavaMail.zimbra@cert.pl>
 <20190610094143.GA30852@perard.uk.xensource.com>
 <edf0eaff-2a00-b4a7-8ed9-2a1d8975264e@cert.pl>
 <CAOz6fc_te580vPxvkJGehQZ0rtR9JedoenoQfOQSTz1w4R81=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOz6fc_te580vPxvkJGehQZ0rtR9JedoenoQfOQSTz1w4R81=Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Relevance of global lock (/var/lock/xl) in xl tool
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 wl@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGxlYXNlIHRyeSB0byBhdm9pZCB0b3AgcG9zdGluZywgaXQgYnJlYWtzIHRoZSBmbG93IG9mIHRo
ZQpjb252ZXJzYXRpb24uCgorIElhbiBhbmQgV2VpLgoKT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQg
MDg6MzA6NDdBTSArMDIwMCwgRmFubnkgRHdhcmdlZSB3cm90ZToKPiBJJ2QgbGlrZSB0byBwb2lu
dCBvdXQgdGhhdCBhIHBhdGNoIGZvciBnZXR0aW5nIHJpZGUgb2YgdGhlIGxvY2sgd2FzCj4gcHJv
dmlkZWQgYnkgRG1pdHJ5IElzYXlraW4gb24gTWFyY2ggYnV0IHVuZm9ydHVuYXRlbHkgc2VlbXMg
dGhhdCBub2JvZHkKPiBub3RpY2VkLgo+IAo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wMy9tc2cwMDU2Ny5odG1sCgpUaGF0IHNlZW1z
IGxpa2UgYSBzZW5zaWJsZSBwYXRjaCwgaWZmIGluZGVlZCB0aGUgbG9jayBpcyBvbmx5IG5lZWRl
ZApmb3IgYXV0b2JhbGxvb25pbmcgbWVtb3J5LgoKSWFuLCBXZWksIGRvIHlvdSB0aGluayB0aGlz
IGlzIGEgc2Vuc2libGUgYXBwcm9hY2g/IEFyZSB0aGVyZSBvdGhlcgpwYXJ0cyBvZiB4bC9saWJ4
bCB0aGF0IHJlbHkgb24gdGhlIGxvY2s/CgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
