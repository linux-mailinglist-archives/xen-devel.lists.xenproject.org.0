Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A534F4F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:51:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYDXg-0002W8-Lq; Tue, 04 Jun 2019 17:48:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYDXf-0002W2-9q
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:48:11 +0000
X-Inumbo-ID: eac1a10c-86f0-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eac1a10c-86f0-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 17:48:10 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fHHpxHYhzXpsCsUP2G/lZPO/mKImlb0SC3l+kfGiq1gCm1XjCVQoDnRQT34QKZbmdYF+hMHZhh
 azXnMsDYfhep6GcoRm5kYo1/i4d1Rt1HjBveOijvjRodzG3ZHFl6Z0jv4YhUaEB8Fbj1E51I7m
 6pRoUuMrRhTMFWN6cmGS1vJQjvd1ORLxXeEiaYKggDpOmh4nERX5dIetg1y3sxgHkPLfUSbHTF
 e0mujEfwAXaqnpFbmMKERdqVfhDvx3sH2eyYQSBKK2tll/BRaffeNpjytdrFzqYCoz30WV8xfV
 eBI=
X-SBRS: 2.7
X-MesageID: 1286691
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1286691"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.44724.367137.714833@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 18:47:32 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190409164542.30274-10-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-10-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 9/9] libxl_disk: Implement missing timeout
 for libxl_cdrom_insert
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDkvOV0gbGlieGxfZGlzazogSW1wbGVtZW50
IG1pc3NpbmcgdGltZW91dCBmb3IgbGlieGxfY2Ryb21faW5zZXJ0Iik6Cj4gU2luY2UgdGhlIHBy
ZXZpb3VzIHBhdGNoICJsaWJ4bF9kaXNrOiBVc2UgZXZfcW1wIGluIGxpYnhsX2Nkcm9tX2luc2Vy
dCIsCj4gdGhlcmUgYXJlIG5vIGtpbmQgb2YgdGltZW91dCBhbnltb3JlLCBhZGQgb25lIGJhY2su
CgpIcm0uICBUaGUgcGF0Y2ggaXRzZWxmIGxvb2tzIGdvb2QsIHNvCgpBY2tlZC1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpCdXQgSSB3b25kZXIgaWYgdGhpcyBj
b3VsZCBzb21laG93IGJlIHBsYWNlZCBlYXJsaWVyIHRvIHByZXNlcnZlCmJpc2VjdGFiaWxpdHku
CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
