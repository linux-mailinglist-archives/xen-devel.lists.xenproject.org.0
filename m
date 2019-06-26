Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D68A56645
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 12:09:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg4mv-0004zW-27; Wed, 26 Jun 2019 10:04:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fhrD=UZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hg4mt-0004zR-Sh
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 10:04:23 +0000
X-Inumbo-ID: c5343457-97f9-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c5343457-97f9-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 10:04:22 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gYZWC9+1ayetMlWOb+ymZVnkleAo5pDyAuoXfAvHiYmQtb9i7Na2XcVw5GkbykHRGBbpgkM/Zx
 7FSTRAEmw3EJxbmtZXhepRWTVx6epplT03bSA92zgBBtmIqhRdRUlXvAEKs0xSB/HCcfA2p7Ew
 GP5zWuektyUN15vOCzY7GuZIFdm/jsKcey432VCY9SC+1S1fabN+VqK+nnqUmpw44u2WgRomru
 34Ck0aFDXin4EchahhtyMS/tZKtfeGzmFGKE9VkeAd+qNEbfhH8rpZMFJ2x3yjWgrmneMh0gkW
 DZI=
X-SBRS: 2.7
X-MesageID: 2244337
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,419,1557201600"; 
   d="scan'208";a="2244337"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23827.17121.178866.198637@mariner.uk.xensource.com>
Date: Wed, 26 Jun 2019 11:03:13 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5D1329E8020000780023B2FD@prv1-mh.provo.novell.com>
References: <osstest-138333-mainreport@xen.org>
 <23824.55987.139222.778619@mariner.uk.xensource.com>
 <23824.56091.124052.340656@mariner.uk.xensource.com>
 <23824.56583.488225.205300@mariner.uk.xensource.com>
 <23825.64696.25926.318881@mariner.uk.xensource.com>
 <23826.11187.707446.188402@mariner.uk.xensource.com>
 <5D123CD0020000780023B077@prv1-mh.provo.novell.com>
 <23826.17279.656820.722725@mariner.uk.xensource.com>
 <5D1329E8020000780023B2FD@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.6-testing test] 138333: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4MzMzOiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBPbiAyNS4wNi4xOSBhdCAxNzo1MywgPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gSW5kZWVkLCBwcmVjaXNlbHkuICBBcmUgaGFwcHkgd2l0
aCBtZSBkb2luZyBhIGZvcmNlIHB1c2ggbm93ID8KPiAKPiBJIHRoaW5rIHNvLCB5ZXMuCgpOb3cg
ZG9uZS4gIEkgaGF2ZSB1bi1zdG9wcGVkIDQuNiBhbmQgNC43LiAgKEkgZG9uJ3QgZXhwZWN0IDQu
NiB0byBkbwphbnl0aGluZy4pCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
